import 'package:cargic_user/models/front_end_models/date_picker_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class TastyMonthPicker extends StatelessWidget {
  const TastyMonthPicker({
    Key key,
    this.time,
    this.item,
    this.isPicked,
  }) : super(key: key);
  final String time;
  final TastyTimePickerModel item;
  final bool isPicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 15, top: 15),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 4,
            offset: Offset(0, 1.4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          (time != null) ? time : '',
          style: TextStyle(
              color: (isPicked != null)
                  ? (isPicked)
                      ? CargicColors.brandBlue
                      : CargicColors.deludedGrey
                  : CargicColors.deludedGrey),
        ),
      ),
    );
  }
}

class AmPmCard extends StatelessWidget {
  final String timeOfDay;
  final AmPm item;
  final bool isPicked;
  AmPmCard({this.timeOfDay, this.item, this.isPicked});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 4,
            offset: Offset(0, 1.2),
          ),
        ],
      ),
      child: Text(
        (timeOfDay != null) ? timeOfDay : "",
        style: TextStyle(
          color: (isPicked) ? CargicColors.brandBlue : CargicColors.fairGrey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
