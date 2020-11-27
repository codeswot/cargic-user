import 'package:flutter/material.dart';

List<String> carFuelType = [
  'Petrol',
  'Gas',
  'Electric',
];

List<DropdownMenuItem> getCarFuelType() {
  List<DropdownMenuItem<String>> dropdowmItems = [];

  for (String type in carFuelType) {
    var newItem = DropdownMenuItem(
      child: Text(type),
      value: type,
    );
    dropdowmItems.add(newItem);
  }
  return dropdowmItems;
}
