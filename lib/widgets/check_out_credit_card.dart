import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class CheckOutCreditCard extends StatelessWidget {
  const CheckOutCreditCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 3,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Primary Card',
                style: TextStyle(
                  color: CargicColors.sweetBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                '.........3456',
                style: TextStyle(
                  color: CargicColors.sweetBlue,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Edit',
                style: TextStyle(
                  color: CargicColors.rageRed,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              Text(
                '03/22',
                style: TextStyle(
                  color: CargicColors.sweetBlue,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
