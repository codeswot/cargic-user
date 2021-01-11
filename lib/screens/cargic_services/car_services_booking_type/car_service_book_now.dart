import 'dart:async';

import 'package:cargic_user/screens/cargic_services/car_services_order_screens/car_service_purchase_order.dart';
import 'package:flutter/material.dart';

class CarServicesBookNow extends StatefulWidget {
  const CarServicesBookNow({
    Key key,
  }) : super(key: key);

  @override
  _CarServicesBookNowState createState() => _CarServicesBookNowState();
}

class _CarServicesBookNowState extends State<CarServicesBookNow> {
  DateTime _dateTime;
  navigatTo(context) {
    //pass DateTime Now
    DateTime.now();
    var dateNow = _dateTime.toLocal();
    print(dateNow);
    Timer(Duration(seconds: 1), () {
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
