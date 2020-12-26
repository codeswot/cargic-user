import 'package:cargic_user/screens/cargic_services/car_parts/car_parts_select_item_to_cart.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/car_info_dash.dart';
import 'package:cargic_user/widgets/select_car_part_tile.dart';
import 'package:flutter/material.dart';

class CarPartsSelectedCategory extends StatefulWidget {
  CarPartsSelectedCategory(this.selectedCategoryName);
  final String selectedCategoryName;
  static const String id = 'CarPartsSelectedCategory';
  @override
  _CarPartsSelectedCategoryState createState() =>
      _CarPartsSelectedCategoryState();
}

class _CarPartsSelectedCategoryState extends State<CarPartsSelectedCategory> {
  List<String> mockCarPartCatrgoryItems = [
    'Horn ',
    'Fuses/Relay',
    'Clutch Kit',
    'Battery',
    'Miscellaneous parts',
    'Electrical accessories',
    'Alternator/Starter'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CargicColors.pinkishWhite,
      appBar: AppBar(
        backgroundColor: CargicColors.brandBlue,
        iconTheme: IconThemeData(color: CargicColors.plainWhite),
        title: Text(
          (widget.selectedCategoryName != null)
              ? widget.selectedCategoryName
              : '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: CargicColors.plainWhite,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () {},
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
        //stream builder(from prev list)
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SelectItemToCart(mockCarPartCatrgoryItems[index])));
              },
              child: SelectCarPartCategoryTile(
                itemName: mockCarPartCatrgoryItems[index],
              ),
            );
          },
          itemCount: mockCarPartCatrgoryItems.length,
        ),
      ),
    );
  }
}
