import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:flutter/material.dart';

class SelectedServiceCard extends StatelessWidget {
  const SelectedServiceCard({
    Key key,
    this.serviceName,
    this.serviceDescription,
    this.servicePrice,
  }) : super(key: key);
  final String serviceName;
  final String serviceDescription;
  final String servicePrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (serviceName != null) ? serviceName : '',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                (serviceDescription != null) ? serviceDescription : '',
                style: TextStyle(
                  color: CargicColors.smoothGray,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Text((servicePrice != null) ? '$nigerianCurrency $servicePrice' : ''),
        ],
      ),
    );
  }
}
