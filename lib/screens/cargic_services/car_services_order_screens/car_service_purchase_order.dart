import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/screens/cargic_services/car_services_order_screens/track_order_screen.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:cargic_user/widgets/cargic_brand_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseOrderScreen extends StatefulWidget {
  static const String id = 'PurchaseOrderScreen';
  @override
  _PurchaseOrderScreenState createState() => _PurchaseOrderScreenState();
}

class _PurchaseOrderScreenState extends State<PurchaseOrderScreen> {
  @override
  Widget build(BuildContext context) {
    String monthName = '';
    String hour12 = '';
    String typeOfDay = '';
    String orderID = Provider.of<AppData>(context).serviceReqMap["orderID"];
    String date = Provider.of<AppData>(context).serviceReqMap["date"];
    String time = Provider.of<AppData>(context).serviceReqMap["time"];
    String hour = time.split(' ')[0];
    String min = time.split(' ')[1];

    String day = date.split(' ')[0];
    String month = date.split(' ')[1];
    var hourAsInt = int.parse(hour);
    assert(hourAsInt is int);
    if (hourAsInt >= 12) {
      typeOfDay = "pm";
    } else {
      typeOfDay = "am";
    }
    var monthAsInt = int.parse(month);
    assert(monthAsInt is int);
    if (monthAsInt == 01) {
      monthName = 'January';
    } else if (monthAsInt == 02) {
      monthName = 'Febuary';
    } else if (monthAsInt == 03) {
      monthName = 'March';
    } else if (monthAsInt == 04) {
      monthName = 'April';
    } else if (monthAsInt == 05) {
      monthName = 'May';
    } else if (monthAsInt == 06) {
      monthName = 'June';
    } else if (monthAsInt == 07) {
      monthName = 'July';
    } else if (monthAsInt == 08) {
      monthName = 'August';
    } else if (monthAsInt == 09) {
      monthName = 'September';
    } else if (monthAsInt == 10) {
      monthName = 'October';
    } else if (monthAsInt == 11) {
      monthName = 'November';
    } else {
      monthName = 'December';
    }
    if (hourAsInt == 01) {
      hour12 = '1';
    } else if (hourAsInt == 02) {
      hour12 = '2';
    } else if (hourAsInt == 03) {
      hour12 = '3';
    } else if (hourAsInt == 04) {
      hour12 = '4';
    } else if (hourAsInt == 05) {
      hour12 = '5';
    } else if (hourAsInt == 06) {
      hour12 = '6';
    } else if (hourAsInt == 07) {
      hour12 = '7';
    } else if (hourAsInt == 08) {
      hour12 = '8';
    } else if (hourAsInt == 09) {
      hour12 = '9';
    } else if (hourAsInt == 10) {
      hour12 = '10';
    } else if (hourAsInt == 11) {
      hour12 = '11';
    } else if (hourAsInt == 12) {
      hour12 = '12';
    } else if (hourAsInt == 13) {
      hour12 = '1';
    } else if (hourAsInt == 14) {
      hour12 = '2';
    } else if (hourAsInt == 15) {
      hour12 = '3';
    } else if (hourAsInt == 16) {
      hour12 = '4';
    } else if (hourAsInt == 17) {
      hour12 = '5';
    } else if (hourAsInt == 18) {
      hour12 = '6';
    } else if (hourAsInt == 19) {
      hour12 = '7';
    } else if (hourAsInt == 20) {
      hour12 = '8';
    } else if (hourAsInt == 21) {
      hour12 = '9';
    } else if (hourAsInt == 22) {
      hour12 = '10';
    } else if (hourAsInt == 23) {
      hour12 = '11';
    } else if (hourAsInt == 24) {
      hour12 = '12';
    }

    return Scaffold(
      body: SafeArea(
        child: PurchaseOderCard(
          orderID: orderID, //generates
          orderDateTime: '$day $monthName at  $hour12:$min $typeOfDay', //format
          primaryTap: () {
            //got to track order
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => NavigationScreen()),
                (route) => false);
            Navigator.pushNamed(context, TrackOrderScreen.id);
          },
          secondaryTap: () {
            //pop to home
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => NavigationScreen()),
                (route) => false);
          },
        ),
      ),
    );
  }
}

class PurchaseOderCard extends StatelessWidget {
  const PurchaseOderCard({
    Key key,
    this.orderID,
    this.orderDateTime,
    this.primaryTap,
    this.secondaryTap,
  }) : super(key: key);
  final String orderID;
  final String orderDateTime;
  final Function primaryTap;
  final Function secondaryTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 50),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: CargicBrandName(width: 85, height: 80),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  (orderID != null) ? 'Oder $orderID  is Processed' : '',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Sit back and relax The Ninja \n will come to you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 34),
                Text(
                  (orderDateTime != null) ? '$orderDateTime' : '',
                  style: TextStyle(
                    color: CargicColors.fearYellow,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 57),
            child: Column(
              children: [
                CandyButton(
                  buttonColor: CargicColors.plainWhite,
                  titleColor: CargicColors.smoothGray,
                  title: 'Back To Home',
                  onPressed: secondaryTap,
                ),
                SizedBox(height: 24),
                CandyButton(
                  buttonColor: CargicColors.brandBlue,
                  titleColor: CargicColors.plainWhite,
                  title: 'Track Your Order',
                  onPressed: primaryTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
