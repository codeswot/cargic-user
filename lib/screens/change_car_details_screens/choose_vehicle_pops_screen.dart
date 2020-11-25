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
    Container(
      child: Text('2'),
    ),
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

class VehicleType extends StatefulWidget {
  //...stateful for now!!
  const VehicleType({
    Key key,
  }) : super(key: key);

  @override
  _VehicleTypeState createState() => _VehicleTypeState();
}

class _VehicleTypeState extends State<VehicleType> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CarTypeCard(
                carTypeIcon: 'images/car_yellow.svg',
                carTypeName: 'Car',
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
              ),
              SizedBox(width: 13),
              CarTypeCard(
                carTypeIcon: 'images/van.svg',
                carTypeName: 'Van',
              ),
              SizedBox(width: 13),
              CarTypeCard(
                carTypeIcon: 'images/school_buss.svg',
                carTypeName: 'Bus',
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              CarTypeCard(
                carTypeIcon: 'images/truck.svg',
                carTypeName: 'Truck',
              ),
              SizedBox(width: 13),
              CarTypeCard(
                carTypeIcon: 'images/jeep_red.svg',
                carTypeName: 'Jeep',
              ),
              SizedBox(width: 13),
              CarTypeCard(
                carTypeIcon: 'images/tractor_blue.svg',
                carTypeName: 'Tractor',
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              CarTypeCard(
                carTypeIcon: 'images/bike_red.svg',
                carTypeName: 'Bike',
              ),
              SizedBox(width: 13),
              CarTypeCard(
                carTypeIcon: 'images/scooter_red.svg',
                carTypeName: 'Motorcycle',
              ),
              Flexible(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}

class CarTypeCard extends StatelessWidget {
  CarTypeCard({
    Key key,
    this.carTypeIcon,
    this.carTypeName,
    this.isSelected = false,
    this.onTap,
    this.onChanged,
  }) : super(key: key);
  final String carTypeIcon;
  final String carTypeName;
  final bool isSelected;
  final Function onTap;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                width: double.infinity,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                  decoration: BoxDecoration(
                    border: (isSelected != null)
                        ? (isSelected)
                            ? Border.all(color: CargicColors.fearYellow)
                            : Border.all(color: CargicColors.plainWhite)
                        : BorderSide.none,
                    color: CargicColors.plainWhite,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        (carTypeIcon != null)
                            ? carTypeIcon
                            : 'images/car_yellow.svg',
                        height: 40,
                        width: 90,
                      ),
                      SizedBox(height: 10),
                      Text(
                        (carTypeName != null) ? carTypeName : 'Car',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: CargicColors.outwitBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: (isSelected)
                    ? Container(
                        decoration: BoxDecoration(
                          color: CargicColors.fearYellow,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color: CargicColors.plainWhite,
                          ),
                        ),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
