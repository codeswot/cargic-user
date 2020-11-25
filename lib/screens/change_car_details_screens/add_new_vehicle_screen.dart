import 'package:cargic_user/screens/change_car_details_screens/choose_vehicle_pops_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddVehicleScreen extends StatelessWidget {
  static const String id = 'AddVehicleScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Vehicle'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'images/add_vehicles.svg',
              width: 221,
              height: 138,
            ),
            SizedBox(height: 30),
            Text(
              'Add a Vehicle',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: CargicColors.hoodwinkGrey,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Click the Plus button to Add Your Vehicle,\n Start Your Services, sit back\n and we will take care for it.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: CargicColors.hoodwinkGrey,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: CargicColors.brandBlue,
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed(ChooseVehiclePropsScreen.id);
        },
      ),
    );
  }
}
