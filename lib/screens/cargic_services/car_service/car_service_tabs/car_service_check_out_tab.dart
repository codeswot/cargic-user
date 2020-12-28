import 'package:cargic_user/models/front_end_models/selected_services_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/check_out_container.dart';
import 'package:cargic_user/widgets/check_out_credit_card.dart';
import 'package:flutter/material.dart';

class CarServiceCheckOutTab extends StatefulWidget {
  const CarServiceCheckOutTab({
    Key key,
  }) : super(key: key);

  @override
  _CarServiceCheckOutTabState createState() => _CarServiceCheckOutTabState();
}

class _CarServiceCheckOutTabState extends State<CarServiceCheckOutTab> {
  List<SelectedServiceModel> selectedServices = List<SelectedServiceModel>();
  void initState() {
    //emulate data ...use firestore later
    //must be three/service(for now!)

    selectedServices.add(
      SelectedServiceModel(
        serviceName: "Oil Change ",
        serviceDescription: "30 to 40 Minutes",
        servicePrice: "250",
      ),
    );
    selectedServices.add(
      SelectedServiceModel(
        serviceName: "Oil Filter ",
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
