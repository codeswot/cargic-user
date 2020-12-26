import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class MapCancelButton extends StatelessWidget {
  const MapCancelButton({
    Key key,
    this.onTap,
  }) : super(key: key);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125, //TODO media Q
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: CargicColors.cosmicShadow,
              blurRadius: 9,
              offset: Offset(0, 6)),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CargicColors.brandBlue,
                boxShadow: [
                  BoxShadow(
                    color: CargicColors.cosmicShadow,
                    blurRadius: 3,
                    offset: Offset(0, 1.5),
                  ),
                ],
              ),
              child: Icon(Icons.close, color: CargicColors.plainWhite),
            ),
            SizedBox(height: 15),
            Text(
              'CANCEL',
              style: TextStyle(
                color: CargicColors.smoothGray,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
