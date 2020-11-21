import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class CargicServiceOrderCard extends StatelessWidget {
  CargicServiceOrderCard({
    Key key,
    this.orderNumber,
    this.orderStatus,
    this.serviceType,
    this.serviceDate,
  }) : super(key: key);
  final String orderNumber;
  final String orderStatus;
  final String serviceType;
  final String serviceDate;

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    if (orderStatus == 'Accepted') {
      statusColor = CargicColors.willGreen;
    } else if (orderStatus == 'Waiting') {
      statusColor = CargicColors.fearYellow;
    } else {
      statusColor = CargicColors.willGreen;
    }
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(
        left: 15.0,
        bottom: 15.0,
        right: 15.0,
      ),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(5),
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
        children: [
          //Order no, and status
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (orderNumber != null) ? orderNumber : 'Order #0101',
                  style: TextStyle(
                    color: CargicColors.hoodwinkGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status:',
                      style: TextStyle(
                        color: CargicColors.brandBlue,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CargicColors.fearYellow,
                          ),
                        ),
                        Text(
                          (orderStatus != null) ? orderStatus : '',
                          style: TextStyle(
                            color: statusColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          //more info
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Service',
                  style: TextStyle(
                    color: CargicColors.smoothGray,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 7.5),
                Text((serviceType != null) ? serviceType : 'Doorstep Car Wash'),
                SizedBox(height: 7.5),
                Text((serviceDate != null)
                    ? serviceDate
                    : '06 November at 02:00pm'),
              ],
            ),
          ),
          //
        ],
      ),
    );
  }
}
