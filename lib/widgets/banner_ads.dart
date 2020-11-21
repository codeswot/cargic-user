import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CargicBannerAds extends StatelessWidget {
  const CargicBannerAds({
    Key key,
    this.banners,
  }) : super(key: key);
  final List<CargicAds> banners;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      height: 145,
      child: Carousel(
        borderRadius: true,
        dotBgColor: CargicColors.wackoBlue,
        images: banners,
      ),
    );
  }
}

class CargicAds extends StatelessWidget {
  const CargicAds({
    Key key,
    this.ads,
  }) : super(key: key);
  final String ads;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      (ads != null) ? ads : 'images/banner1.svg',
      width: 500,
      height: 110,
    );
  }
}
