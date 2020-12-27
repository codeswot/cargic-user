import 'package:cargic_user/screens/cargic_services/car_service/car_service_tabs/car_service_booking_tab.dart';
import 'package:cargic_user/screens/cargic_services/car_service/car_service_tabs/car_service_check_out_tab.dart';
import 'package:cargic_user/screens/cargic_services/car_service/car_service_tabs/car_service_type_tab.dart';
import 'package:cargic_user/screens/cargic_services/car_services_order_screens/car_service_purchase_order.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/subtotal_card.dart';
import 'package:flutter/material.dart';

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
    Navigator.of(context).pushNamed(PurchaseOrderScreen.id);
  }

  List<Widget> carServiceTabs = [
    CarServiceTypeTab(),
    CarServiceBookingTab(),
    CarServiceCheckOutTab(),
  ];
  @override
  void initState() {
    setState(() {});
    tabController = TabController(
        length: carServiceTabs.length, initialIndex: index, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              price: '300',
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
