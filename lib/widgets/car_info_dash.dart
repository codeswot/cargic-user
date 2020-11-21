import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

import 'car_logo.dart';

class CarInfoDash extends StatelessWidget {
  const CarInfoDash({
    Key key,
    this.onTap,
  }) : super(key: key);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
        decoration: BoxDecoration(
          color: CargicColors.plainWhite,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: CargicColors.cosmicShadow,
              blurRadius: 5.0,
              offset: Offset(0.0, 2.5),
            ),
          ],
        ),
        child: Row(
          children: [
            //car logo container
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: 2.5, color: CargicColors.smoothGray)),
              child: CarLogo(carLogo: CarLogos.honda),
            ),
            //car name and fuel type
            SizedBox(width: 11),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Honda Accord',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CargicColors.pitchBlack,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Petrol',
                    style: TextStyle(
                      color: CargicColors.pitchBlack,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            //space
            Flexible(child: Container()),
            //change info button
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: CargicColors.subtleWhite,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: CargicColors.cosmicShadow,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 2.5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Change',
                    style: TextStyle(color: CargicColors.grimBlack),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
