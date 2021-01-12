import 'dart:async';

import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/screens/cargic_services/car_services_order_screens/car_service_purchase_order.dart';
import 'package:cargic_user/utils/random_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarServicesBookNow extends StatefulWidget {
  const CarServicesBookNow({
    Key key,
  }) : super(key: key);

  @override
  _CarServicesBookNowState createState() => _CarServicesBookNowState();
}

class _CarServicesBookNowState extends State<CarServicesBookNow> {
  navigatTo(context) {
    //pass DateTime Now
    String monthName = '';
    String hour12 = '';
    String typeOfDay = '';
    var timeNow = DateTime.now();
    String formatedDate = '${timeNow.toLocal()}'.split(' ')[0];
    String formatedTime = '${timeNow.toLocal()}'.split(' ')[1];

    String gottenHour = formatedTime.split(':')[0];
    String gottenMin = formatedTime.split(':')[1];

    String gottenMonth = formatedDate.split('-')[1];
    String gottenDay = formatedDate.split('-')[2];

    print(
        'the day is $gottenDay of $gottenMonth and time is $gottenHour $gottenMin min');

    print('time for $formatedTime');

    var day = gottenDay;
    var month = gottenMonth;
    var hour = gottenHour;
    var min = gottenMin;
    var id = Provider.of<AppData>(context, listen: false).userID;
    String userID = id.substring(0, 2);
    String orderID = "#$userID$day${randomCode()}";
    //Month Name
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
    //AM or PM
    var hourAsInt = int.parse(hour);
    assert(hourAsInt is int);
    if (hourAsInt >= 12) {
      typeOfDay = "pm";
    } else {
      typeOfDay = "am";
    }
    //12 hour format
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
    String formattedDate = "$day $monthName at $hour12:$min $typeOfDay";
    Timer(Duration(seconds: 1), () {
      //send request to DB here
      print(Provider.of<AppData>(context, listen: false).userID);
      Provider.of<AppData>(context, listen: false).sendServiceRequest(
        orderID: orderID,
        //service
        serviceType: Provider.of<AppData>(context, listen: false).serviceType,
        serviceName: Provider.of<AppData>(context, listen: false).serviceName,
        price: Provider.of<AppData>(context, listen: false).servicePrice,
        serviceDiscount:
            Provider.of<AppData>(context, listen: false).serviceDiscount,

        date: '$day $month',
        time: '$hour $min ',
        formattedDate: formattedDate,
        //vehicle
        vehicleType: Provider.of<AppData>(context, listen: false).vType,
        vehicleName: Provider.of<AppData>(context, listen: false).vName,
        vehicleModel: Provider.of<AppData>(context, listen: false).vModel,
        vehicleManufactureYear:
            Provider.of<AppData>(context, listen: false).vYear,
        vehicleFuelType: Provider.of<AppData>(context, listen: false).vFuel,
        //user
        userAddress:
            Provider.of<AppData>(context, listen: false).userAdress.placeName,
        userName: Provider.of<AppData>(context, listen: false).userName,
        userEmail: Provider.of<AppData>(context, listen: false).userEmail,
        userPhone: Provider.of<AppData>(context, listen: false).userPhone,
        //status
        status: "Pending",
        //ninja set it to accepted
      );
      Navigator.of(context).pushNamed(PurchaseOrderScreen.id);
    });
  }

  @override
  void initState() {
    navigatTo(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
