import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CargicBrandName extends StatelessWidget {
  const CargicBrandName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'images/brand_name.svg',
      width: 40,
      height: 30,
    );
  }
}
