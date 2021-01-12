import 'package:cargic_user/models/front_end_models/selected_services_model.dart';
import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/check_out_container.dart';
import 'package:cargic_user/widgets/check_out_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        serviceName: '',
        serviceDescription: "30 to 40 Minutes",
        servicePrice: '',
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

  var vehicleDB;

  @override
  Widget build(BuildContext context) {
    vehicleDB = Provider.of<AppData>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckOutContainer(
            selectedServices: selectedServices,
            carDashName: Provider.of<AppData>(context, listen: false).vName,
            carDashFuel: Provider.of<AppData>(context, listen: false).vFuel,
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
