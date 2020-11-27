//honda
import 'package:flutter/material.dart';

List<String> hondaModelList = [
  'Honda Accord',
  'Honda City',
  'Honda Civic',
  'Honda CRV',
];
//toyota
List<String> toyotaModelList = [
  'Toyota Camry',
  'Toyota Corolla',
  'Toyota Yaris',
  'Toyota Sienna',
];
//kia
List<String> kiaModelList = [
  'Kia Rio',
  'Kia Soul',
  'Kia Optima',
  'Kia Forte',
];
//ford
List<String> fordModelList = [
  'Ford Edge',
  'Ford Escape',
  'Ford Explorer',
  'Ford EcoSport',
];
//bmw
List<String> bmwModelList = [
  'BMW 2 Series',
  'BMW 3 Series',
  'BMW 4 Series',
  'BMW M5',
];
//mercedes
List<String> mercedesModelList = [
  'Mercedes-Benz AMG GLC',
  'Mercedes-Benz B-Class',
  'Mercedes-Benz CLK',
  'Mercedes-Benz GLS-Class',
];
//audi
List<String> audiModelList = [
  'Audi Q3',
  'Audi S6',
  'Audi A5 Coupe',
  'Audi A3 Sedan',
  'Audi 2021  e-tron®',
];
//volvo
List<String> volvoModelList = [
  'Volvo S60',
  'Volvo XC40 SUV',
  'Volvo XC60 SUV',
  'Volvo V90',
];

//function to get list

List<DropdownMenuItem> getHondaModelList() {
  List<DropdownMenuItem<String>> dropdowmItems = [];

  for (String type in hondaModelList) {
    var newItem = DropdownMenuItem(
      child: Text(type),
      value: type,
    );
    dropdowmItems.add(newItem);
  }
  return dropdowmItems;
}
