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
}
