import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class ServiceRequestDash extends StatelessWidget {
  const ServiceRequestDash({
    Key key,
    this.title,
    this.information,
    this.isRetry,
    this.onTap,
    this.failedInfo,
  }) : super(key: key);
  final String title;
  final String information;
  final String failedInfo;
  final bool isRetry;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(top: 35), //TODO mdia Q
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (title != null) ? title : '',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: CargicColors.smoothGray,
                    fontSize: 18,
                  ),
                ),
                Container(
                  child: (isRetry != null)
                      ? (isRetry)
                          ? GestureDetector(
                              onTap: onTap,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 13),
                                decoration: BoxDecoration(
                                  color: CargicColors.brandBlue,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: CargicColors.cosmicShadow,
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'Retry',
                                  style: TextStyle(
                                    color: CargicColors.plainWhite,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          : Container()
                      : Container(),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              (isRetry != null)
                  ? (isRetry == false) //retry false
                      ? (information != null)
                          ? information
                          : (failedInfo != null)
                              ? failedInfo
                              : ''
                      : failedInfo // retry !false
                  : '',
              style: TextStyle(fontSize: 14, color: CargicColors.smoothGray),
            ),
          ],
        ),
      ),
    );
  }
}
