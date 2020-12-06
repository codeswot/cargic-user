import 'package:cargic_user/models/date_picker_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class TastyMonthPicker extends StatelessWidget {
  const TastyMonthPicker({
    Key key,
    this.monthName,
    this.monthNumber,
    this.item,
    this.isPicked,
  }) : super(key: key);
  final String monthName;
  final String monthNumber;
  final TastyMonthPickerModel item;
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
          (monthName != null) ? monthName : '',
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
