import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/screens/cargic_services/car_service/car_service_tabs/car_service_booking_tab.dart';
import 'package:cargic_user/screens/cargic_services/car_service/car_service_tabs/car_service_check_out_tab.dart';
import 'package:cargic_user/screens/cargic_services/car_service/car_service_tabs/car_service_type_tab.dart';
import 'package:cargic_user/screens/cargic_services/car_services_order_screens/car_service_purchase_order.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/random_code.dart';
import 'package:cargic_user/widgets/subtotal_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarServiceScreen extends StatefulWidget {
  static const String id = 'CarServiceScreen';
  @override
  _CarServiceScreenState createState() => _CarServiceScreenState();
}

class _CarServiceScreenState extends State<CarServiceScreen>
    with TickerProviderStateMixin {
  TabController tabController;
  int index = 0;
  String buttonTitle = 'Next';
  bool isDone = false;
  indexController() {
    setState(() {
      tabController.index++;
      index++;
    });
    if (tabController.index == 2) {
      setState(() {
        buttonTitle = "Done";
        isDone = true;
      });
      print('end of tab');
    } else {
      return;
    }
  }

  navigateTo() {
    //send to DB here
    String monthName = '';
    //get value from provider
    var id = Provider.of<AppData>(context, listen: false).userID;
    var serviceDate =
        Provider.of<AppData>(context, listen: false).bookDate.toString();
    var serviceTime = Provider.of<AppData>(context, listen: false).bookTime;
    var dayType = Provider.of<AppData>(context, listen: false).bookTypeOfDay;

    print('test to run $serviceDate $serviceTime $dayType ');
    //split for use date
    String fixedDate = serviceDate.split(' ')[0];
    String day = fixedDate.split('-')[2];
    String month = fixedDate.split('-')[1];
    //split for use time
    String hour = serviceTime.split(':')[0];
    String min = serviceTime.split(':')[1];
//    //split for use generate orderID
    String userID = id.substring(0, 2);
    String orderID = "#$userID$day${randomCode()}";
    print(orderID);
    //check for month name
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
    // set formated date
    String formattedDate = "$day $monthName at $hour:$min $dayType";
//prepare data to send
    Provider.of<AppData>(context, listen: false).sendServiceRequest(
      orderID: orderID,
      serviceType: Provider.of<AppData>(context, listen: false).serviceType,
      serviceName: Provider.of<AppData>(context, listen: false).serviceName,
      price: Provider.of<AppData>(context, listen: false).servicePrice,
      serviceDesc: Provider.of<AppData>(context, listen: false).serviceDesc,
      serviceDiscount:
          Provider.of<AppData>(context, listen: false).serviceDiscount,

      date: '$day $month',
      time: '$hour $min',
      formattedDate: formattedDate,
      //vehicle
      vehicleType: Provider.of<AppData>(context, listen: false).vType,
      vehicleName: Provider.of<AppData>(context, listen: false).vName,
      vehicleModel: Provider.of<AppData>(context, listen: false).vModel,
      vehicleManufactureYear:
          Provider.of<AppData>(context, listen: false).vYear,
      vehicleFuelType: Provider.of<AppData>(context, listen: false).vFuel,
      //user
      userAddress:
          Provider.of<AppData>(context, listen: false).userAdress.placeName,
      userName: Provider.of<AppData>(context, listen: false).userName,
      userEmail: Provider.of<AppData>(context, listen: false).userEmail,
      userPhone: Provider.of<AppData>(context, listen: false).userPhone,
      //status
      status: "Pending",
      //ninja set it to accepted
    );
    Navigator.of(context).pushNamed(PurchaseOrderScreen.id);
  }

  List<Widget> carServiceTabs = [
    CarServiceTypeTab(),
    CarServiceBookingTab(),
    CarServiceCheckOutTab(),
  ];
  @override
  void initState() {
    tabController = TabController(
        length: carServiceTabs.length, initialIndex: index, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String price = Provider.of<AppData>(context).servicePrice;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Provider.of<AppData>(context, listen: false).servicePrice = null;
            Navigator.of(context).pop();
          },
        ),
        title: Text('Car Service'),
        bottom: PreferredSize(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: TabBar(
                  controller: tabController,
                  labelColor: CargicColors.brandBlue,
                  unselectedLabelColor: CargicColors.fairGrey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: CargicColors.brandBlue),
                  tabs: [
                    Tab(
                      child: Container(),
                    ),
                    Tab(
                      child: Container(),
                    ),
                    Tab(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: (tabController.index == 1) ? 10 : 15),
              (tabController.index == 0)
                  ? Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text('Select service type'),
                    )
                  : Container(),
              SizedBox(height: (tabController.index == 1) ? 0 : 20),
            ],
          ),
          preferredSize: Size.fromHeight((tabController.index == 1) ? 80 : 100),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: carServiceTabs,
              ),
            ),
            SubTotalCard(
              //set price from selected card
              price: (price != null) ? price : null,
              //for now
              buttonTitle: buttonTitle,
              onTap: (isDone) ? navigateTo : indexController,
            ),
          ],
        ),
      ),
    );
  }
}
