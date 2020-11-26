import 'package:cargic_user/screens/change_car_details_screens/vehicle_props_tabs/vehicle_type.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseVehiclePropsScreen extends StatefulWidget {
  static const id = 'ChooseVehiclePropsScreen';
  @override
  _ChooseVehiclePropsScreenState createState() =>
      _ChooseVehiclePropsScreenState();
}

class _ChooseVehiclePropsScreenState extends State<ChooseVehiclePropsScreen>
    with TickerProviderStateMixin {
  int index = 0;
  TabController tabController;

  List<Widget> carPropsTabItem = [
    VehicleType(),
    Container(),
    Container(
      child: Text('3'),
    ),
    Container(
      child: Text('4'),
    ),
  ];
  @override
  void initState() {
    tabController = TabController(
        length: carPropsTabItem.length, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CargicColors.faintWhite,
      appBar: AppBar(
        title: Text('Vehicle Type'),
        bottom: PreferredSize(
          child: Column(
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
                    Tab(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
          preferredSize: Size.fromHeight(90),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: carPropsTabItem,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (carPropsTabItem.length < 5) {
                  tabController.index++;
                } else {
                  return;
                }
              });
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: CargicColors.plainWhite,
                boxShadow: [
                  BoxShadow(
                      color: CargicColors.cosmicShadow,
                      blurRadius: 8,
                      offset: Offset(0, 4)),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    decoration: BoxDecoration(
                      color: CargicColors.brandBlue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: CargicColors.cosmicShadow,
                            blurRadius: 8,
                            offset: Offset(0, 4)),
                      ],
                    ),
                    child: Center(
                        child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: CargicColors.plainWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}