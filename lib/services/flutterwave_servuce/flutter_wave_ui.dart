import 'package:cargic_user/services/flutterwave_servuce/card_payment_card.dart';
import 'package:cargic_user/services/flutterwave_servuce/card_payment_manager.dart';
import 'package:cargic_user/services/flutterwave_servuce/flutter_wave_manager.dart';
import 'package:cargic_user/services/flutterwave_servuce/flutter_wave_res.dart';
import 'package:cargic_user/services/flutterwave_servuce/payment_options.dart';
import 'package:flutter/material.dart';

class FlutterwaveUI extends StatefulWidget {
  final FlutterwavePaymentManager _flutterwavePaymentManager;

  FlutterwaveUI(this._flutterwavePaymentManager);

  @override
  _FlutterwaveUIState createState() => _FlutterwaveUIState();
}

class _FlutterwaveUIState extends State<FlutterwaveUI> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final FlutterwavePaymentManager paymentManager =
        this.widget._flutterwavePaymentManager;

    return MaterialApp(
      home: Scaffold(
        key: this._scaffoldKey,
        body: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 70, 10, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.lock,
                          size: 10.0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "SECURED BY FLUTTERWAVE",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                              letterSpacing: 1.0),
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                      child: Text(
                        "How would you \nlike to pay?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 5,
                        width: 200,
                        color: Colors.pink,
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 100.0,
              ),
              Container(
                color: Colors.white38,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Visibility(
                      visible: paymentManager.acceptCardPayment,
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: FlutterwavePaymentOption(
                              handleClick: this._launchCardPaymentWidget,
                              buttonText: "Card",
                            ),
                          ),
                          SizedBox(
                            height: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _launchCardPaymentWidget() async {
    final CardPaymentManager cardPaymentManager =
        this.widget._flutterwavePaymentManager.getCardPaymentManager();
    final ChargeResponse chargeResponse = await Navigator.push(
      this.context,
      MaterialPageRoute(builder: (context) => CardPayment(cardPaymentManager)),
    );
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
