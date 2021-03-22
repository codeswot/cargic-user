import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:flutter/material.dart';

class OverViewServiceCard extends StatelessWidget {
  const OverViewServiceCard({
    Key key,
    this.servicePrice,
    this.serviceName,
    this.serviceDate,
  }) : super(key: key);
  final double servicePrice;
  final String serviceName;
  final String serviceDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CargicColors.brandBlue,
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
        children: [
          SizedBox(height: 30),
          Text(
            'TOTAL',
            style: TextStyle(
              color: CargicColors.plainWhite,
              fontSize: 15,
            ),
          ),
          Text(
            (servicePrice != null) ? '$nigerianCurrency $servicePrice' : '',
            style: TextStyle(
              color: CargicColors.fearYellow,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (serviceName != null) ? '$serviceName' : '',
                    style: TextStyle(
                      color: CargicColors.plainWhite,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    (serviceDate != null) ? '$serviceDate' : '',
                    style: TextStyle(
                      color: CargicColors.plainWhite,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//over view location

class OverViewLocationCard extends StatelessWidget {
  const OverViewLocationCard({
    Key key,
    this.address,
    this.addressState,
  }) : super(key: key);
  final String address;
  final String addressState;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      margin: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: CargicColors.brandBlue,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: CargicColors.brandBlue.withOpacity(0.10),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CargicColors.fearYellow,
            ),
          ),
          SizedBox(width: 15),
          Container(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (address != null) ? '$address' : '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: CargicColors.plainWhite,
                    fontSize: 14,
                  ),
                ),
                Text(
                  (addressState != null) ? '$addressState' : '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: CargicColors.plainWhite,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
