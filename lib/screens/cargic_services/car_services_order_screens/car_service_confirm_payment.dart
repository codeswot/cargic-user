import 'package:cargic_user/services/flutterwave_servuce/flutter_wave.dart';
import 'package:cargic_user/services/flutterwave_servuce/flutter_wave_currencies.dart';
import 'package:cargic_user/services/flutterwave_servuce/flutter_wave_res.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:cargic_user/widgets/feed_back_container.dart';
import 'package:cargic_user/widgets/over_view_service_card.dart';
import 'package:flutter/material.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  static const String id = 'ConfirmPaymentScreen';
  @override
  _ConfirmPaymentScreenState createState() => _ConfirmPaymentScreenState();
}

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Payment'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 15),
              Column(
                children: [
                  OverViewServiceCard(
                    serviceName: 'Car Service',
                    serviceDate: '06 November at 02:00pm',
                    servicePrice: 340,
                  ),
                  OverViewLocationCard(
                    address: 'CK 12 Unguwar Rimi',
                    addressState: 'U/Rimi, Kaduna',
                  ),
                  SizedBox(height: 65),
                  FeedbackContainer(
                    onRated: (r) {
                      print(r);
                    },
                  ),
                  SizedBox(height: 15),
                ],
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 57, vertical: 14),
                child: CandyButton(
                  onPressed: () {
                    beginPayment();
                  },
                  buttonColor: CargicColors.brandBlue,
                  title: 'Confirm Payment',
                  titleColor: CargicColors.plainWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _pay(BuildContext context) {
  //   final snackBar_onFailure = SnackBar(content: Text('Transaction failed'));
  //   final snackBar_onClosed = SnackBar(content: Text('Transaction closed'));
  //   final _rave = RaveCardPayment(
  //     isDemo: true,
  //     encKey: "FLWSECK_TEST52e118c6178f",
  //     publicKey: "FLWPUBK_TEST-746afe91f6a64f5fa07f73057de1ee35-X",
  //     transactionRef: "SCH${DateTime.now().millisecondsSinceEpoch}",
  //     amount: 340,
  //     email: "demo1@example.com",
  //     onSuccess: (response) {
  //       print("$response");
  //       print("Transaction Successful");
  //       if (mounted) {
  //         Scaffold.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text("Transaction Sucessful!"),
  //             backgroundColor: Colors.green,
  //             duration: Duration(
  //               seconds: 5,
  //             ),
  //           ),
  //         );
  //       }
  //     },
  //     onFailure: (err) {
  //       print("$err");
  //       print("Transaction failed");
  //       Scaffold.of(context).showSnackBar(snackBar_onFailure);
  //     },
  //     onClosed: () {
  //       print("Transaction closed");
  //       Scaffold.of(context).showSnackBar(snackBar_onClosed);
  //     },
  //     context: context,
  //   );
  //   _rave.process();
  // }

  beginPayment({
    String name,
    String email,
    String amount,
    String phone,
  }) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          context: this.context,
          encryptionKey: "FLWSECK_TEST52e118c6178f",
          publicKey: "FLWPUBK_TEST-746afe91f6a64f5fa07f73057de1ee35-X",
          currency: FlutterwaveCurrency.NGN,
          amount: '340',
          email: "elmubarak333@gmail.com",
          fullName: "Mubarak Ibrahim",
          txRef: "SCH${DateTime.now().millisecondsSinceEpoch}",
          isDebugMode: false,
          phoneNumber: "08106859478",
          acceptCardPayment: true,
          acceptUSSDPayment: false,
          acceptAccountPayment: false,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: false,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: false,
          acceptZambiaPayment: false);

      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
      print(response);
    } catch (error) {
      print(error);
    }
  }
}
