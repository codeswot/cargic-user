import 'dart:convert';
import 'dart:io';

import 'package:cargic_user/services/flutterwave_servuce/charge_card_req.dart';
import 'package:cargic_user/services/flutterwave_servuce/charge_req_address.dart';
import 'package:cargic_user/services/flutterwave_servuce/flutter_wave_res.dart';
import 'package:cargic_user/services/flutterwave_servuce/utils/api_utils.dart';
import 'package:cargic_user/services/flutterwave_servuce/utils/flutter_wave_const.dart';
import 'package:cargic_user/services/flutterwave_servuce/utils/flutter_wave_urls.dart';
import 'package:cargic_user/services/flutterwave_servuce/utils/flutterwave_utils.dart';
import 'package:cargic_user/services/flutterwave_servuce/utils/payment_listner.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'auth.dart';

class CardPaymentManager {
  String publicKey;
  String encryptionKey;
  String currency;
  String amount;
  String email;
  String fullName;
  String txRef;
  bool isDebugMode;
  String phoneNumber;
  int frequency;
  int duration;
  bool isPermanent;
  String narration;
  String country;

  ChargeCardRequest chargeCardRequest;
  CardPaymentListener cardPaymentListener;

  /// CardPaymentManager constructor
  CardPaymentManager({
    @required this.publicKey,
    @required this.encryptionKey,
    @required this.currency,
    @required this.amount,
    @required this.email,
    @required this.fullName,
    @required this.txRef,
    @required this.isDebugMode,
    this.country,
    this.phoneNumber,
    this.frequency,
    this.duration,
    this.isPermanent,
    this.narration,
  });

  /// This method is required to add a payment listener to card transactions
  CardPaymentManager setCardPaymentListener(
      final CardPaymentListener cardPaymentListener) {
    this.cardPaymentListener = cardPaymentListener;
    return this;
  }

  /// Responsible for encrypting charge requests using 3DES encryption
  /// it returns a map
  Map<String, String> _prepareRequest(
      final ChargeCardRequest chargeCardRequest) {
    final String encryptedChargeRequest = FlutterwaveUtils.tripleDESEncrypt(
        jsonEncode(chargeCardRequest.toJson()), encryptionKey);
    return FlutterwaveUtils.createCardRequest(encryptedChargeRequest);
  }

  /// Initiates Card Request
  Future<dynamic> payWithCard(final http.Client client,
      final ChargeCardRequest chargeCardRequest) async {
    this.chargeCardRequest = chargeCardRequest;
    if (this.cardPaymentListener == null) {
      this.cardPaymentListener.onError("No CardPaymentListener Attached!");
      return;
    }

    final Map<String, String> encryptedPayload =
        this._prepareRequest(chargeCardRequest);

    final url = FlutterwaveURLS.getBaseUrl(this.isDebugMode) +
        FlutterwaveURLS.CHARGE_CARD_URL;
    final http.Response response = await client.post(url,
        headers: {HttpHeaders.authorizationHeader: this.publicKey},
        body: encryptedPayload);

    this._handleResponse(response);
  }

  /// Responsible for vhandling card payment responses depending on
  /// the card's authorization mode.
  /// It calls the Callback methods when it required additional information
  /// for authorisation
  void _handleResponse(final http.Response response) {
    try {
      final responseBody = ChargeResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        final bool requiresExtraAuth =
            (responseBody.message == FlutterwaveConstants.REQUIRES_AUTH) &&
                (responseBody.meta.authorization.mode != null);

        final bool is3DS = (responseBody.message ==
                FlutterwaveConstants.CHARGE_INITIATED) &&
            (responseBody.meta.authorization.mode == Authorization.REDIRECT);

        final bool requiresOtp =
            (responseBody.message == FlutterwaveConstants.CHARGE_INITIATED) &&
                (responseBody.meta.authorization.mode == Authorization.OTP);

        if (requiresExtraAuth) {
          return this
              ._handleExtraCardAuth(responseBody, this.cardPaymentListener);
        }
        if (is3DS) {
          return this.cardPaymentListener.onRedirect(
              responseBody, responseBody.meta.authorization.redirect);
        }
        if (requiresOtp) {
          return this
              .cardPaymentListener
              .onRequireOTP(responseBody, responseBody.data.processorResponse);
        }
        return;
      }
      if (response.statusCode.toString().substring(0, 1) == "4") {
        return this.cardPaymentListener.onError(responseBody.message);
      }
      return this
          .cardPaymentListener
          .onError(jsonDecode(response.body).toString());
    } catch (e) {
      this.cardPaymentListener.onError(e.toString());
    }
  }

  void _handleExtraCardAuth(
      ChargeResponse response, CardPaymentListener listener) {
    final String authMode = response.meta.authorization.mode;
    if (Authorization.AVS == authMode) {
      return this.cardPaymentListener.onRequireAddress(response);
    }
    if (Authorization.REDIRECT == authMode) {
      return this
          .cardPaymentListener
          .onRedirect(response, response.meta.authorization.redirect);
    }
    if (Authorization.OTP == authMode) {
      return this
          .cardPaymentListener
          .onRequireOTP(response, response.data.processorResponse);
    }
    if (Authorization.PIN == authMode)
      return this.cardPaymentListener.onRequirePin(response);
    return;
  }

  /// This method is responsible for updating a card request with the card's pin
  Future<dynamic> addPin(String pin) async {
    Authorization auth = Authorization();
    auth.mode = Authorization.PIN;
    auth.pin = pin;
    this.chargeCardRequest.authorization = auth;
    this.payWithCard(http.Client(), this.chargeCardRequest);
  }

  /// This method is responsible for updating a card request with the card's
  /// address information
  Future<dynamic> addAddress(ChargeRequestAddress chargeAddress) async {
    Authorization auth = Authorization();
    auth.mode = Authorization.AVS;
    auth.address = chargeAddress.address;
    auth.city = chargeAddress.city;
    auth.state = chargeAddress.state;
    auth.zipcode = chargeAddress.zipCode;
    auth.country = chargeAddress.country;

    this.chargeCardRequest.authorization = auth;
    this.payWithCard(http.Client(), this.chargeCardRequest);
  }

  /// This method is responsible for updating a card request with the card's OTP
  Future<ChargeResponse> addOTP(String otp, String flwRef) async {
    return FlutterwaveAPIUtils.validatePayment(
        otp, flwRef, http.Client(), this.isDebugMode, this.publicKey, false);
  }
}
