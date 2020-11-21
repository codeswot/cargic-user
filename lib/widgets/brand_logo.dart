import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80.3, bottom: 79.5),
      child: SvgPicture.asset(
        'images/brand_logo.svg',
        width: 104.9,
        height: 106.2,
      ),
    );
  }
}
