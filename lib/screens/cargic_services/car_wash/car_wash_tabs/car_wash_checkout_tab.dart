import 'package:cargic_user/models/selected_services_model.dart';
import 'package:cargic_user/utils/colors.dart';

import 'package:cargic_user/widgets/check_out_container.dart';
import 'package:cargic_user/widgets/check_out_credit_card.dart';
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
      ),
    );
    selectedServices.add(
      SelectedServiceModel(
        serviceName: "Interior Wash",
        serviceDescription: "30 to 40 Minutes",
        servicePrice: "250",
      ),
    );
    selectedServices.add(
      SelectedServiceModel(
        serviceName: "Full Wash",
        serviceDescription: "30 to 40 Minutes",
        servicePrice: "250",
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
          CheckOutContainer(
            selectedServices: selectedServices,
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
          CheckOutCreditCard(),
        ],
      ),
    );
  }
}
