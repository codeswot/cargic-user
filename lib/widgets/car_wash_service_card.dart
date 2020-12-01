import 'package:cargic_user/models/car_wash_service_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:flutter/material.dart';

class CarWashServiceCard extends StatelessWidget {
  const CarWashServiceCard({
    Key key,
    this.carWashServiceName,
    this.carWashServiceImage,
    this.carWashServicePrice,
    this.carWashServiceDiscount,
    this.carWashServiceTime,
    this.item,
    this.isSelected,
  }) : super(key: key);
  final String carWashServiceName;
  final String carWashServiceImage;
  final String carWashServicePrice;
  final String carWashServiceDiscount;
  final String carWashServiceTime;
  final bool isSelected;
  final CarWashTypeModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
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
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              color: CargicColors.hopeBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.elliptical(180, 100),
                bottomRight: Radius.elliptical(100, 50),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.elliptical(180, 100),
                bottomRight: Radius.elliptical(100, 50),
              ),
              child: Image.network(
                (carWashServiceImage != null) ? carWashServiceImage : '',
              ),
            ),
          ),
          //
          // SizedBox(height: 22),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              (carWashServicePrice != null)
                                  ? nigerianCurrency
                                  : '',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              (carWashServicePrice != null)
                                  ? carWashServicePrice
                                  : '',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        Text(
                          (carWashServiceDiscount != null)
                              ? '$carWashServiceDiscount% off first wash!'
                              : '',
                          style: TextStyle(
                            fontSize: 9,
                            color: CargicColors.willGreen,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: CargicColors.plainWhite,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: CargicColors.cosmicShadow,
                            blurRadius: 3,
                            offset: Offset(0, 1.5),
                          ),
                        ],
                      ),
                      child: Text(
                        '30 to 40 \n Minutes',
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  (carWashServiceName != null) ? carWashServiceName : '',
                ),
                // SizedBox(height: 15)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
