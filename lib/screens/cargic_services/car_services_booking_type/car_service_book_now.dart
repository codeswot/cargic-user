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
    Timer(Duration(seconds: 1), () {
      //send request to DB here
      print(Provider.of<AppData>(context, listen: false).userID);
      Provider.of<AppData>(context, listen: false).sendServiceRequest(
        orderID: orderID,
        //service
        serviceType: Provider.of<AppData>(context, listen: false).serviceType,
        serviceName: Provider.of<AppData>(context, listen: false).serviceName,
        price: Provider.of<AppData>(context, listen: false).servicePrice,
        date: '$day $month',
        time: '$hour $min ',
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
