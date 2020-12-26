import 'dart:async';

import 'package:cargic_user/screens/cargic_services/car_request_accepted_screens/services_requested_map.dart';
import 'package:flutter/material.dart';

class CarModificationRequest extends StatefulWidget {
  static const String id = "CarModificationRequest";
  @override
  _CarModificationRequestState createState() => _CarModificationRequestState();
}

class _CarModificationRequestState extends State<CarModificationRequest> {
  @override
  void initState() {
    sendRequest(context);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  sendRequest(BuildContext context) {
    Timer(Duration(milliseconds: 600), () {
      Navigator.popAndPushNamed(context, ServiceRequestMap.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
