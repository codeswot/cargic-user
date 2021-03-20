import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ServicesButtonCard extends StatelessWidget {
  const ServicesButtonCard({
    Key key,
    this.serviceName,
    this.serviceIcon,
    this.serviceArrowColor,
    this.secondNameInfo,
    this.onTap,
  }) : super(key: key);
  final String serviceName;
  final String serviceIcon;
  final String secondNameInfo;
  final Color serviceArrowColor;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        // height: 140.0,
        padding: EdgeInsets.only(left: 15.0, top: 11.5),
        decoration: BoxDecoration(
          color: CargicColors.plainWhite,
          borderRadius: BorderRadius.circular(7.5),
          boxShadow: [
            BoxShadow(
              color: CargicColors.cosmicShadow,
              blurRadius: 5,
              offset: Offset(0.0, 2.5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  (serviceName != null) ? serviceName : 'Service Name ',
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14.2,
                  ),
                ),
                Text(
                  (secondNameInfo != null) ? secondNameInfo : '',
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (serviceArrowColor != null)
                        ? serviceArrowColor
                        : CargicColors.faintingGrey,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: CargicColors.plainWhite,
                  ),
                ),
                //
                Container(
                  child: SvgPicture.asset(
                    (serviceIcon != null)
                        ? serviceIcon
                        : 'images/brand_logo.svg',
                    width: 99.0,
                    height: 66.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
