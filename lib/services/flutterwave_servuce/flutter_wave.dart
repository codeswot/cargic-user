import 'package:cargic_user/services/flutterwave_servuce/card_payment_card.dart';
import 'package:cargic_user/services/flutterwave_servuce/card_payment_manager.dart';
import 'package:cargic_user/services/flutterwave_servuce/pay_pop_up.dart';
import 'package:flutter/material.dart';

import 'flutter_wave_currencies.dart';
import 'flutter_wave_manager.dart';
import 'flutter_wave_res.dart';
import 'flutter_wave_ui.dart';

class Flutterwave {
  BuildContext context;
  String publicKey;
  String encryptionKey;
  bool isDebugMode;
  String amount;
  String currency;
  String email;
  String fullName;
  String txRef;
  String redirectUrl;
  bool acceptAccountPayment;
  bool acceptCardPayment;
  bool acceptUSSDPayment;
  bool acceptRwandaMoneyPayment;
  bool acceptMpesaPayment;
  bool acceptZambiaPayment;
  bool acceptGhanaPayment;
  bool acceptUgandaPayment;
  bool acceptFrancophoneMobileMoney;
  String phoneNumber;
  int frequency;
  int duration;
  bool isPermanent;
  String narration;

  //todo include these when they become available and stable on v3
  // bool acceptVoucherPayment;
  // bool acceptUKAccountPayment;
  // bool acceptBarterPayment;
  // bool acceptSouthAfricaBankPayment;
  // bool acceptBankTransferPayment;

  /// Flutterwave Constructor
  Flutterwave.forUIPayment({
    @required this.context,
    @required this.publicKey,
    @required this.encryptionKey,
    @required this.currency,
    @required this.amount,
    @required this.email,
    @required this.fullName,
    @required this.txRef,
    @required this.isDebugMode,
    @required this.phoneNumber,
    this.frequency,
    this.duration = 0,
    this.isPermanent = false,
    this.narration = "",
    this.acceptAccountPayment = false,
    this.acceptCardPayment = false,
    this.acceptUSSDPayment = false,
    this.acceptRwandaMoneyPayment = false,
    this.acceptMpesaPayment = false,
    this.acceptZambiaPayment = false,
    this.acceptGhanaPayment = false,
    this.acceptUgandaPayment = false,
    this.acceptFrancophoneMobileMoney = false,
  }) {
    this.currency = this.currency.toUpperCase();

    if (this.currency == FlutterwaveCurrency.NGN) {
      this.acceptRwandaMoneyPayment = false;
      this.acceptMpesaPayment = false;
      this.acceptZambiaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
    }
    if (this.currency == FlutterwaveCurrency.KES) {
      this.acceptMpesaPayment = true;

      this.acceptRwandaMoneyPayment = false;
      this.acceptZambiaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
      this.acceptAccountPayment = false;
    }
    if (this.currency == FlutterwaveCurrency.RWF) {
      this.acceptRwandaMoneyPayment = true;

      this.acceptMpesaPayment = false;
      this.acceptZambiaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
      this.acceptAccountPayment = false;
      this.acceptUSSDPayment = false;
    }
    if (this.currency == FlutterwaveCurrency.UGX) {
      this.acceptUgandaPayment = true;
      this.acceptMpesaPayment = false;
      this.acceptZambiaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
      this.acceptAccountPayment = false;
      this.acceptUSSDPayment = false;
      this.acceptRwandaMoneyPayment = false;
    }
    if (this.currency == FlutterwaveCurrency.ZMW) {
      this.acceptZambiaPayment = true;

      this.acceptAccountPayment = false;
      this.acceptRwandaMoneyPayment = false;
      this.acceptMpesaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
      this.acceptUSSDPayment = false;
    }
    if (this.currency == FlutterwaveCurrency.GHS) {
      this.acceptGhanaPayment = true;
      this.acceptAccountPayment = false;
      this.acceptRwandaMoneyPayment = false;
      this.acceptMpesaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptFrancophoneMobileMoney = false;
      this.acceptUSSDPayment = false;
    }
    if (this.currency == FlutterwaveCurrency.XAF ||
        this.currency == FlutterwaveCurrency.XOF) {
      this.acceptFrancophoneMobileMoney = true;
      this.acceptAccountPayment = false;
      this.acceptRwandaMoneyPayment = false;
      this.acceptMpesaPayment = false;
      this.acceptGhanaPayment = false;
      this.acceptUgandaPayment = false;
      this.acceptUSSDPayment = false;
    }
  }

  String country;

  String _setCountry() {
    switch (this.currency) {
      case FlutterwaveCurrency.NGN:
        return "NG";
      case FlutterwaveCurrency.GHS:
        return "GH";
      case FlutterwaveCurrency.RWF:
        return "RW";
      case FlutterwaveCurrency.UGX:
        return "UG";
      case FlutterwaveCurrency.ZMW:
        return "ZM";
      default:
        return "NG";
    }
  }

  Future<ChargeResponse> initializeForUiPayments() async {
    FlutterwavePaymentManager paymentManager = FlutterwavePaymentManager(
      publicKey: this.publicKey,
      encryptionKey: this.encryptionKey,
      currency: this.currency,
      email: this.email,
      fullName: this.fullName,
      amount: this.amount,
      txRef: this.txRef,
      isDebugMode: this.isDebugMode,
      narration: this.narration,
      isPermanent: this.isPermanent,
      phoneNumber: this.phoneNumber,
      frequency: this.frequency,
      duration: this.duration,
      acceptAccountPayment: this.acceptAccountPayment,
      acceptCardPayment: this.acceptCardPayment,
      acceptUSSDPayment: this.acceptUSSDPayment,
      acceptRwandaMoneyPayment: this.acceptRwandaMoneyPayment,
      acceptMpesaPayment: this.acceptMpesaPayment,
      acceptZambiaPayment: this.acceptZambiaPayment,
      acceptGhanaPayment: this.acceptGhanaPayment,
      acceptUgandaPayment: this.acceptUgandaPayment,
      acceptFancophoneMobileMoney: this.acceptFrancophoneMobileMoney,
      country: this._setCountry(),
    );

    final chargeResponse = await this._launchPaymentScreen(paymentManager);
    return chargeResponse;
  }

  Future<ChargeResponse> _launchPaymentScreen(
      final FlutterwavePaymentManager paymentManager) async {
    final CardPaymentManager cardPaymentManager =
        paymentManager.getCardPaymentManager();
    final ChargeResponse chargeResponse = await showDialog(
        context: context,
        builder: (context) {
          return CardPayment(cardPaymentManager);
        });
//msgs
    String message;
    if (chargeResponse != null) {
      message = chargeResponse.message;
    } else {
      message = "Transaction cancelled";
    }
    this.showSnackBar(message);
    // Navigator.pop(this.context, chargeResponse);
  }

  void showSnackBar(String message) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
    // this._scaffoldKey.currentState.showSnackBar(snackBar);
  }
  // return await Navigator.push(
  //   this.context,
  //   MaterialPageRoute(
  //     builder: (context) => PopUpPayment(paymentManager: paymentManager),
  //   ),
  // );

}
