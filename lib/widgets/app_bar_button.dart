import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key key,
    this.onTap,
    this.buttonTitle,
    this.buttonColor,
    this.titleColor,
  }) : super(key: key);
  final Function onTap;
  final String buttonTitle;
  final Color buttonColor;
  final Color titleColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 47),
        margin: EdgeInsets.symmetric(vertical: 18.0),
        decoration: BoxDecoration(
          color: (buttonColor != null) ? buttonColor : CargicColors.plainWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: CargicColors.cosmicShadow,
                blurRadius: 6.0,
                offset: Offset(0.0, 4.0)),
          ],
        ),
        child: Text(
          (buttonTitle != null) ? buttonTitle : '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: (titleColor != null) ? titleColor : CargicColors.pitchBlack,
          ),
        ),
      ),
    );
  }
}
