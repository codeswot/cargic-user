import 'package:flutter/material.dart';

class ChangeVehicleScreen extends StatefulWidget {
  static const String id = 'ChangeVehicleScreen';
  @override
  _ChangeVehicleScreenState createState() => _ChangeVehicleScreenState();
}

class _ChangeVehicleScreenState extends State<ChangeVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Change'),
      ),
    );
  }
}
