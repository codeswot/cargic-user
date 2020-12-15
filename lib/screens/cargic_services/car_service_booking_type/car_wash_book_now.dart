import 'package:flutter/material.dart';

class CarServicesBookNow extends StatefulWidget {
  const CarServicesBookNow({
    Key key,
  }) : super(key: key);

  @override
  _CarServicesBookNowState createState() => _CarServicesBookNowState();
}

class _CarServicesBookNowState extends State<CarServicesBookNow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
