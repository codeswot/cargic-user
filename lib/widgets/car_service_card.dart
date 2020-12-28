import 'package:cargic_user/models/front_end_models/serviceTypeModel.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:flutter/material.dart';

class CarServiceCard extends StatelessWidget {
  final String carServiceName;
  final String carServiceDescription;
  final String carServicePrice;
  final String timeToFinishServie;
  final String carServiceImage;
  final bool isSelected;
  final CarServiceTypeModel item;
  CarServiceCard(
      {this.carServiceName,
      this.carServiceDescription,
      this.carServicePrice,
      this.timeToFinishServie,
      this.carServiceImage,
      this.isSelected,
      this.item});
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
            height: 110,
            width: double.infinity,
            child: Column(
              children: [
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Expanded(
                      child: Image.network(
                        (carServiceImage != null)
                            ? carServiceImage
                            : 'https://avatars3.githubusercontent.com/u/40618838?s=460&v=4',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              (carServicePrice != null)
                                  ? '$nigerianCurrency'
                                  : '',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              (carServicePrice != null)
                                  ? '$carServicePrice.00' //might use kobo
                                  : '',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        Container(
                          width: 65,
                          child: Text(
                            (carServiceDescription != null)
                                ? '$carServiceDescription'
                                : '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 9,
                              color: CargicColors.brandBlue,
                            ),
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
                        'Done in  \n 45 Mins',
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  (carServiceName != null) ? carServiceName : '',
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
