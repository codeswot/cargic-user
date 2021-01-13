import 'package:cargic_user/models/front_end_models/selected_services_model.dart';
import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/utils/colors.dart';

import 'package:cargic_user/widgets/check_out_container.dart';
import 'package:cargic_user/widgets/check_out_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    var vehicleDB = Provider.of<AppData>(context, listen: false);
    var monthName = '';
    var date = Provider.of<AppData>(context, listen: false).bookDate.toString();
    var time = Provider.of<AppData>(context, listen: false).bookTime;
    var dayType = Provider.of<AppData>(context, listen: false).bookTypeOfDay;
    String fixedDate = date.split(' ')[0];
    String month = fixedDate.split('-')[1];
    String day = fixedDate.split('-')[2];
    var monthAsInt = int.parse(month);
    assert(monthAsInt is int);
    if (monthAsInt == 01) {
      monthName = 'January';
    } else if (monthAsInt == 02) {
      monthName = 'Febuary';
    } else if (monthAsInt == 03) {
      monthName = 'March';
    } else if (monthAsInt == 04) {
      monthName = 'April';
    } else if (monthAsInt == 05) {
      monthName = 'May';
    } else if (monthAsInt == 06) {
      monthName = 'June';
    } else if (monthAsInt == 07) {
      monthName = 'July';
    } else if (monthAsInt == 08) {
      monthName = 'August';
    } else if (monthAsInt == 09) {
      monthName = 'September';
    } else if (monthAsInt == 10) {
      monthName = 'October';
    } else if (monthAsInt == 11) {
      monthName = 'November';
    } else {
      monthName = 'December';
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckOutContainer(
            carDashName: Provider.of<AppData>(context, listen: false).vName,
            carDashFuel: Provider.of<AppData>(context, listen: false).vFuel,
            serviceName:
                Provider.of<AppData>(context, listen: false).serviceName,
            servicePrice:
                Provider.of<AppData>(context, listen: false).servicePrice,
            serviceDesc:
                Provider.of<AppData>(context, listen: false).serviceDesc,
            serviceDate:
                (date != null) ? '$day $monthName at $time $dayType' : '',
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
