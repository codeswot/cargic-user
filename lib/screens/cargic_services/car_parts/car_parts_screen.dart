import 'package:cargic_user/screens/cargic_services/car_parts/car_part_selected_category.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:cargic_user/widgets/car_info_dash.dart';
import 'package:cargic_user/widgets/cart_button.dart';
import 'package:cargic_user/widgets/select_car_part_tile.dart';
import 'package:flutter/material.dart';

class CarPartsScreen extends StatefulWidget {
  static const String id = 'CarPartsScreen';
  @override
  _CarPartsScreenState createState() => _CarPartsScreenState();
}

class _CarPartsScreenState extends State<CarPartsScreen> {
  List<String> mockCarPartItems = [
    'Engine Oil',
    'Tyres',
    'Clutch Kit',
    'Electrical and lighting',
    'Front brake disc',
    'Brakes',
    'Filters'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CargicColors.pinkishWhite,
      appBar: AppBar(
        backgroundColor: CargicColors.brandBlue,
        iconTheme: IconThemeData(color: CargicColors.plainWhite),
        title: Text(
          'Car Parts Sales',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: CargicColors.plainWhite,
          ),
        ),
        actions: [
          CartButton(
            itemCount: cartItemMock,
          ),
        ],
        bottom: PreferredSize(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CarInfoDash(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: CargicColors.cosmicShadow,
                          blurRadius: 6,
                          offset: Offset(0, 4)),
                    ],
                    color: CargicColors.plainWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintText: 'Search',
                    ),
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(200),
        ),
      ),
      body: Container(
        color: CargicColors.pinkishWhite,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarPartsSelectedCategory(
                      mockCarPartItems[index],
                    ),
                  ),
                );
              },
              child: SelectCarPartCategoryTile(
                itemName: mockCarPartItems[index],
              ),
            );
          },
          itemCount: mockCarPartItems.length,
        ),
      ),
    );
  }
}
