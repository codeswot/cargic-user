import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarLogos {
  static String honda = 'images/honda_icon.svg';
  static String bmw = 'images/bmw_icon.svg';
  static String audi = 'images/audi_icon.dvg';
  static String kia = 'images/kia_icon.svg';
  static String mercedes = 'images/mercedes_icon.svg';
  static String toyota = 'images/toyota_icon.svg';
  static String volvo = 'images/volvo_icon.svg';
}

class CarLogo extends StatelessWidget {
  const CarLogo({
    Key key,
    this.carLogo,
  }) : super(key: key);
  final String carLogo;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      carLogo,
      width: 35,
      height: 35,
    );
  }
}
