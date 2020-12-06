import 'package:cargic_user/screens/cargic_services/car_wash/car_wash_tabs/car_wash_booking_tab.dart';
import 'package:cargic_user/screens/cargic_services/car_wash/car_wash_tabs/car_wash_checkout_tab.dart';
import 'package:cargic_user/screens/cargic_services/car_wash/car_wash_tabs/car_wash_type_tab.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/subtotal_card.dart';
import 'package:flutter/material.dart';

class CarWashScreen extends StatefulWidget {
  static const String id = 'CarWashScreen';
  @override
  _CarWashScreenState createState() => _CarWashScreenState();
}

class _CarWashScreenState extends State<CarWashScreen>
    with TickerProviderStateMixin {
  TabController tabController;
  int index = 0;

  indexController() {
    if (carWashTabs.length >= 3) {
      setState(() {
        tabController.index++;
        index++;
      });
    } else {
      print('end of tab');
    }
  }

  List<Widget> carWashTabs = [
    CarWashTypeTab(),
    CarWashBookingTab(),
    CarWashCheckOutTab(),
  ];

  @override
  void initState() {
    setState(() {});
    tabController = TabController(
        length: carWashTabs.length, initialIndex: index, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Wash'),
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
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                      ),
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
                      child: Text('Select carwash type'),
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
                children: carWashTabs,
              ),
            ),
            SubTotalCard(
              //set price from selected card
              price: '300',
              //for now
              onTap: indexController,
            ),
          ],
        ),
      ),
    );
  }
}
