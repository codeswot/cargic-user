import 'package:cargic_user/models/front_end_models/car_type_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarTypeCard extends StatelessWidget {
  CarTypeCard(this._item, this.carTypeIcon, this.carTypeName);
  final String carTypeIcon;
  final String carTypeName;
  final CarTypeModel _item;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            width: double.infinity,
            child: Container(
              width: double.infinity,
              // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
              decoration: BoxDecoration(
                border: (_item.isSelected != null)
                    ? (_item.isSelected)
                        ? Border.all(color: CargicColors.fearYellow)
                        : Border.all(color: CargicColors.plainWhite)
                    : BorderSide.none,
                color: CargicColors.plainWhite,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  SvgPicture.asset(
                    (carTypeIcon != null)
                        ? carTypeIcon
                        : 'images/car_yellow.svg',
                    height: 40,
                    width: 90,
                  ),
                  SizedBox(height: 10),
                  Text(
                    (carTypeName != null) ? carTypeName : 'Car',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: CargicColors.outwitBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: (_item.isSelected)
                ? Container(
                    decoration: BoxDecoration(
                      color: CargicColors.fearYellow,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.check,
                        size: 14,
                        color: CargicColors.plainWhite,
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
