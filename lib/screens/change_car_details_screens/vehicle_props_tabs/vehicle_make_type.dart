import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/utils/car_make_fuel_type.dart';
import 'package:cargic_user/utils/car_make_types.dart';
import 'package:cargic_user/utils/car_make_year.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleMakeType extends StatelessWidget {
  const VehicleMakeType({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vehicleDB = Provider.of<AppData>(context, listen: false);

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
                onChanged: (val) async {
                  await vehicleDB.updateUserVehicle(
                    key: 'model',
                    value: val,
                  );
                  print('chosen model is ${vehicleDB.vModel}');
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
                onChanged: (val) async {
                  await vehicleDB.updateUserVehicle(
                    key: 'year',
                    value: val,
                  );
                  print('chosen year is ${vehicleDB.vYear}');
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
                onChanged: (val) async {
                  await vehicleDB.updateUserVehicle(
                    key: 'fuel',
                    value: val,
                  );
                  print('chosen model is ${vehicleDB.vFuel}');
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
