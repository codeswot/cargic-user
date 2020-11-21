import 'package:flutter/material.dart';

sleekSnakBar({String message, var myScaffoldKey}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ),
  );
  myScaffoldKey.currentState.showSnackBar(snackBar);
}
