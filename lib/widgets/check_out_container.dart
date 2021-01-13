import 'dart:async';

import 'package:cargic_user/models/front_end_models/selected_services_model.dart';
import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:cargic_user/widgets/car_info_dash.dart';
import 'package:cargic_user/widgets/selected_service_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutContainer extends StatefulWidget {
  const CheckOutContainer({
    Key key,
    this.carDashName,
    this.carDashFuel,
    this.serviceName,
    this.serviceDesc,
    this.serviceDate,
    this.servicePrice,
  }) : super(key: key);
  final String carDashName;
  final String carDashFuel;
  final String serviceName;
  final String serviceDesc;
  final String serviceDate;
  final String servicePrice;

  @override
  _CheckOutContainerState createState() => _CheckOutContainerState();
}

class _CheckOutContainerState extends State<CheckOutContainer> {
  var vehicleDB;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    vehicleDB = Provider.of<AppData>(context, listen: false);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 23),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarInfoDash(
            carName: (widget.carDashName != null)
                ? widget.carDashName
                : vehicleDB.vName,
            fuelType: (widget.carDashFuel != null)
                ? widget.carDashFuel
                : vehicleDB.vFuel,
            //car info from DB
            //if return from DB as null, set
            //properties to null
            // carName: 'Honda Accord',
            // carLogo: CarLogos.honda,
            // fuelType: 'Electric',
          ),
          Divider(height: 5, color: CargicColors.fairGrey),
          Container(
            padding: EdgeInsets.symmetric(vertical: 9),
            child: Text(
              (widget.serviceDate != null) ? widget.serviceDate : '',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Divider(height: 5, color: CargicColors.fairGrey),
          Container(
            height: 150,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SelectedServiceCard(
                  serviceName:
                      (widget.servicePrice != null) ? widget.serviceName : '',
                  serviceDescription:
                      (widget.serviceDesc != null) ? widget.serviceDesc : '',
                  servicePrice:
                      (widget.servicePrice != null) ? widget.servicePrice : '',
                );
              },
              separatorBuilder: (context, index) {
                return Divider(height: 5, color: CargicColors.fairGrey);
              },
              itemCount: 1,
            ),
          ),
          Divider(height: 5, color: CargicColors.fairGrey),
          Container(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    (widget.servicePrice != null)
                        ? '$nigerianCurrency ${widget.servicePrice}'
                        : '',
                    style: TextStyle(
                      color: CargicColors.rageRed,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
