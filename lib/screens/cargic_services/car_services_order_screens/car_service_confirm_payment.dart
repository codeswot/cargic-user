import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:cargic_user/widgets/smooth_star_rating.dart';
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
                  OverViewServiceCard(),
                  OverViewLocationCard(),
                  SizedBox(height: 65),
                  FeedbacContainer(),
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

class FeedbacContainer extends StatelessWidget {
  const FeedbacContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 9,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('How was the job ?'),
          SizedBox(height: 16),
          SmoothStarRating(
            size: 31.0,
            starCount: 5,
            borderColor: CargicColors.fearYellow,
            color: CargicColors.fearYellow,
          ),
          SizedBox(height: 20),
          Container(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Provide your feedback.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OverViewLocationCard extends StatelessWidget {
  const OverViewLocationCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CargicColors.brandBlue,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: CargicColors.brandBlue.withOpacity(0.10),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CargicColors.fearYellow,
            ),
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CK 12 Unguwar Rimi',
                style: TextStyle(
                  color: CargicColors.plainWhite,
                  fontSize: 14,
                ),
              ),
              Text(
                'U/Rimi, Kaduna',
                style: TextStyle(
                  color: CargicColors.plainWhite,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OverViewServiceCard extends StatelessWidget {
  const OverViewServiceCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CargicColors.brandBlue,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'TOTAL',
            style: TextStyle(
              color: CargicColors.plainWhite,
              fontSize: 15,
            ),
          ),
          Text(
            '$nigerianCurrency 250.0',
            style: TextStyle(
              color: CargicColors.fearYellow,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Exterior Wash',
                    style: TextStyle(
                      color: CargicColors.plainWhite,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '06 November at 6.00pm',
                    style: TextStyle(
                      color: CargicColors.plainWhite,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
