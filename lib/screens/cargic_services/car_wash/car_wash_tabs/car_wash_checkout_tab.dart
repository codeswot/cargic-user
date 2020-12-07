import 'package:cargic_user/models/selected_services_model.dart';
import 'package:cargic_user/utils/car_logo.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:cargic_user/widgets/car_info_dash.dart';
import 'package:cargic_user/widgets/selected_service_card.dart';
import 'package:flutter/material.dart';

class CarWashCheckOutTab extends StatefulWidget {
  const CarWashCheckOutTab({
    Key key,
  }) : super(key: key);

  @override
  _CarWashCheckOutTabState createState() => _CarWashCheckOutTabState();
}

class _CarWashCheckOutTabState extends State<CarWashCheckOutTab> {
  List<SelectedServiceModel> selectedServices = List<SelectedServiceModel>();

  @override
  void initState() {
    //emulate data ...use firestore later
    //must be three/service(for now!)
    selectedServices.add(
      SelectedServiceModel(
        serviceName: "Exterior Wash",
        serviceDescription: "30 to 40 Minutes",
        servicePrice: "300",
        isSelected: false,
      ),
    );
    selectedServices.add(
      SelectedServiceModel(
        serviceName: "Interior Wash",
        serviceDescription: "30 to 40 Minutes",
        servicePrice: "250",
        isSelected: false,
      ),
    );
    selectedServices.add(
      SelectedServiceModel(
        serviceName: "Full Wash",
        serviceDescription: "30 to 40 Minutes",
        servicePrice: "250",
        isSelected: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                  carName: "Honda",
                  fuelType: "Petrol",
                  carLogo: CarLogos.honda,
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
                    '06 November at 02:00 PM',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Divider(height: 5, color: CargicColors.fairGrey),
                Container(
                  height: (selectedServices.length < 3) ? 150 : 200,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SelectedServiceCard(
                        serviceName: selectedServices[index].serviceName,
                        serviceDescription:
                            selectedServices[index].serviceDescription,
                        servicePrice: selectedServices[index].servicePrice,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 5, color: CargicColors.fairGrey);
                    },
                    itemCount: selectedServices.length,
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
                          '$nigerianCurrency 550',
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
          ),
          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Payment',
              style: TextStyle(
                color: CargicColors.fairGrey,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Primary Card',
                      style: TextStyle(
                        color: CargicColors.sweetBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '.........3456',
                      style: TextStyle(
                        color: CargicColors.sweetBlue,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Edit',
                      style: TextStyle(
                        color: CargicColors.rageRed,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '03/22',
                      style: TextStyle(
                        color: CargicColors.sweetBlue,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
