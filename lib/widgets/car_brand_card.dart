import 'package:cargic_user/models/car_brand_model.dart';
import 'package:cargic_user/screens/change_car_details_screens/vehicle_props_tabs/vehicle_type.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarBrandCard extends StatelessWidget {
  const CarBrandCard({
    Key key,
    this.carBrandLogo,
    this.carBrandName,
    this.item,
  }) : super(key: key);
  final String carBrandLogo;
  final String carBrandName;
  final CarBrandModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              (carBrandLogo != null)
                  ? SvgPicture.asset(carBrandLogo)
                  : SvgPicture.asset('images/brand_logo.svg',
                      width: 30, height: 35),
              SizedBox(width: 30),
              Text(
                (carBrandName != null) ? carBrandName : '',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: (item.isSelected != null)
                  ? (item.isSelected)
                      ? Border.all(color: CargicColors.willGreen, width: 1.8)
                      : Border.all(color: CargicColors.fairGrey, width: 1.8)
                  : BorderSide.none,
            ),
            child: Icon(
              Icons.check,
              size: 15,
              color: (item.isSelected != null)
                  ? (item.isSelected)
                      ? CargicColors.willGreen
                      : CargicColors.fairGrey
                  : CargicColors.fairGrey,
            ),
          ),
        ],
      ),
    );
  }
}
