import 'dart:async';

import 'package:cargic_user/services/flutterwave_servuce/card_payment_card.dart';
import 'package:cargic_user/services/flutterwave_servuce/card_payment_manager.dart';
import 'package:cargic_user/services/flutterwave_servuce/flutter_wave_manager.dart';
import 'package:cargic_user/services/flutterwave_servuce/flutter_wave_res.dart';
import 'package:flutter/material.dart';

class PopUpPayment extends StatefulWidget {
  final FlutterwavePaymentManager paymentManager;

  const PopUpPayment({Key key, this.paymentManager}) : super(key: key);

  @override
  _PopUpPaymentState createState() => _PopUpPaymentState();
}

class _PopUpPaymentState extends State<PopUpPayment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      _launchCardPaymentWidget();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FlutterwavePaymentManager paymentManager = this.widget.paymentManager;

    return Scaffold(
      key: this._scaffoldKey,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _launchCardPaymentWidget() async {
    final CardPaymentManager cardPaymentManager =
        this.widget.paymentManager.getCardPaymentManager();
    final ChargeResponse chargeResponse = await showDialog(
        context: context,
        builder: (context) {
          return CardPayment(cardPaymentManager);
        });
    // final ChargeResponse chargeResponse2 = await Navigator.push(
    //   this.context,
    //   MaterialPageRoute(builder: (context) => CardPayment(cardPaymentManager)),
    // );
    String message;
    if (chargeResponse != null) {
      message = chargeResponse.message;
    } else {
      message = "Transaction cancelled";
    }
    this.showSnackBar(message);
    Navigator.pop(this.context, chargeResponse);
  }

  void showSnackBar(String message) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
    this._scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
