import 'package:cargic_user/screens/cargic_services/car_service_booking_type/car_wash_book_later.dart';
import 'package:cargic_user/screens/cargic_services/car_service_booking_type/car_wash_book_now.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/app_bar_button.dart';
import 'package:flutter/material.dart';

class CarServiceBookingTab extends StatefulWidget {
  @override
  _CarServiceBookingTabState createState() => _CarServiceBookingTabState();
}

class _CarServiceBookingTabState extends State<CarServiceBookingTab> {
  bool isBookNow = false;
  bool isBookLater = false;
  bool isNotBookSelect = true;
  checkBookNow() {
    setState(() {
      isBookNow = true;
      isNotBookSelect = false;

      isBookLater = false;
    });
  }

  checkBookLater() {
    setState(() {
      isBookNow = false;
      isNotBookSelect = false;
      isBookLater = true;
    });
  }

  @override
  void initState() {
    isNotBookSelect = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBarButton(
                buttonColor: (isBookNow)
                    ? CargicColors.brandBlue
                    : CargicColors.plainWhite,
                titleColor: (isBookNow)
                    ? CargicColors.plainWhite
                    : CargicColors.pitchBlack,
                buttonTitle: 'Book Now',
                onTap: () {
                  //get book now
                  checkBookNow();
                  //next tab
                },
              ),
              SizedBox(width: 10),
              AppBarButton(
                buttonColor: (isBookLater)
                    ? CargicColors.brandBlue
                    : CargicColors.plainWhite,
                titleColor: (isBookLater)
                    ? CargicColors.plainWhite
                    : CargicColors.pitchBlack,
                buttonTitle: 'Book Later',
                onTap: () {
                  checkBookLater();
                  //get book later
                },
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(80),
      ),
      body: Container(
        child: (isNotBookSelect)
            ? Container()
            : (isBookNow)
                //controll to next tab
                ? CarServicesBookNow()
                : Container(
                    child: CarServicesBookLater(),
                  ),
      ),
    );
  }
}
