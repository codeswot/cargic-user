import 'dart:async';

import 'package:cargic_user/screens/change_car_details_screens/choose_vehicle_pops_screen.dart';
import 'package:flutter/material.dart';

class ChangeVehicleScreen extends StatefulWidget {
  static const String id = 'ChangeVehicleScreen';
  @override
  _ChangeVehicleScreenState createState() => _ChangeVehicleScreenState();
}

class _ChangeVehicleScreenState extends State<ChangeVehicleScreen> {
  changeVehicle() {
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(ChooseVehiclePropsScreen.id);
    });
  }

  @override
  void initState() {
    changeVehicle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
