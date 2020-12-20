import 'package:cargic_user/screens/cargic_services/car_registeration_renewal/car_registeration_renewal_tabs/reg_renew_service_paper_tab.dart';
import 'package:cargic_user/screens/cargic_services/car_registeration_renewal/car_registeration_renewal_tabs/reg_renew_service_type_tab.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/subtotal_card.dart';
import 'package:flutter/material.dart';

class CarRegRenewal extends StatefulWidget {
  static const String id = 'CarRegRenewal';
  @override
  _CarRegRenewalState createState() => _CarRegRenewalState();
}

class _CarRegRenewalState extends State<CarRegRenewal>
    with TickerProviderStateMixin {
  TabController tabController;
  int index = 0;

  indexController() {
    if (carRegRenewTabs.length >= 3) {
      setState(() {
        tabController.index++;
        index++;
      });
    } else {
      print('end of tab');
    }
  }

  List<Widget> carRegRenewTabs = [
    RegRenewServiceTypeTab(),
    RegRenewSelectPapersTab(),
    Container(),
  ];
  @override
  void initState() {
    setState(() {});
    tabController = TabController(
        length: carRegRenewTabs.length, initialIndex: index, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Renewal'),
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
                      child: Text('Select Service'),
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
                children: carRegRenewTabs,
              ),
            ),
            SubTotalCard(
              isSubTotal: false,
              //set price from selected card
              // price: '',
              //for now
              onTap: indexController,
            ),
          ],
        ),
      ),
    );
  }
}
