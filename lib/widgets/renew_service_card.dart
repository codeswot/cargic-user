import 'package:cargic_user/models/car_reg_renew_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class CarRenewServiceCard extends StatelessWidget {
  CarRenewServiceCard(
      {this.isSelected, this.serviceName, this.serviceImage, this.item});
  final bool isSelected;
  final String serviceName;
  final String serviceImage;
  final CarRegRenewModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: (isSelected != null)
            ? (isSelected)
                ? Border.all(
                    color: CargicColors.fearYellow,
                  )
                : Border.all(
                    color: CargicColors.plainWhite,
                  )
            : Border.all(
                color: CargicColors.plainWhite,
              ),
        borderRadius: BorderRadius.circular(5),
        color: CargicColors.plainWhite,
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.elliptical(120, 25),
                bottomRight: Radius.elliptical(105, 30),
              ),
              boxShadow: [
                BoxShadow(
                  color: CargicColors.cosmicShadow,
                  blurRadius: 3,
                  offset: Offset(0, 1.2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.elliptical(120, 25),
                bottomRight: Radius.elliptical(105, 30),
              ),
              child: Image.network(
                (serviceImage != null)
                    ? serviceImage
                    : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCaVAjYtKer1uwBY59xDzBs0tO1KoChtP7-Q&usqp=CAU',
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              (serviceName != null) ? serviceName : "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
