import 'package:flutter/material.dart';

List<String> carMakeYearList = [
  '2000',
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2007',
  '2008',
  '2009',
  '2010',
  '2011',
  '2012',
  '2013',
  '2014',
  '2015',
  '2016',
  '2017',
  '2018',
  '2019',
  '2020',
];

List<DropdownMenuItem> getManufactureYear() {
  List<DropdownMenuItem<String>> dropdowmItems = [];

  for (String type in carMakeYearList) {
    var newItem = DropdownMenuItem(
      child: Text(type),
      value: type,
    );
    dropdowmItems.add(newItem);
  }
  return dropdowmItems;
}
