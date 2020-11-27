import 'package:cargic_user/utils/car_make_fuel_type.dart';
import 'package:cargic_user/utils/car_make_types.dart';
import 'package:cargic_user/utils/car_make_year.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class VehicleMakeType extends StatelessWidget {
  const VehicleMakeType({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String carModel = '';
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 23),
      decoration: BoxDecoration(
          color: CargicColors.plainWhite,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: CargicColors.cosmicShadow,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ]),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25),
            Text('Select your car model'),
            SizedBox(height: 7),
            Container(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: CargicColors.fairGrey),
              ),
              child: DropdownButtonFormField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Honda City',
                  border: InputBorder.none,
                ),
                onChanged: (val) {
                  val = carModel;
                },
                items: getHondaModelList(),
              ),
            ),
            //
            SizedBox(height: 26),
            Text('Manufacture Year'),
            SizedBox(height: 7),
            Container(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: CargicColors.fairGrey),
              ),
              child: DropdownButtonFormField(
                decoration: InputDecoration.collapsed(
                  hintText: '2018',
                  border: InputBorder.none,
                ),
                onChanged: (val) {
                  val = carModel;
                },
                items: getManufactureYear(),
              ),
            ),
            SizedBox(height: 26),
            Text('Fuel Type'),
            SizedBox(height: 7),
            Container(
              padding: EdgeInsets.symmetric(vertical: 9, horizontal: 11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: CargicColors.fairGrey),
              ),
              child: DropdownButtonFormField(
                decoration: InputDecoration.collapsed(
                  hintText: 'Petrol',
                  border: InputBorder.none,
                ),
                onChanged: (val) {
                  val = carModel;
                },
                items: getCarFuelType(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
