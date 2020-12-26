import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class CargicReqServiceButtons extends StatelessWidget {
  const CargicReqServiceButtons({
    Key key,
    this.onTap,
    this.icon,
    this.buttonTitle,
  }) : super(key: key);
  final Function onTap;
  final IconData icon;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 35,
        // padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        decoration: BoxDecoration(
          color: CargicColors.brandBlue,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: CargicColors.cosmicShadow,
              blurRadius: 3,
              offset: Offset(0, 1.5),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              (icon != null) ? icon : Icons.phone,
              color: CargicColors.plainWhite,
            ),
            SizedBox(width: 9.5),
            Text(
              (buttonTitle != null) ? buttonTitle : '',
              style: TextStyle(
                color: CargicColors.plainWhite,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
