import 'package:cargic_user/models/car_brand_model.dart';
import 'package:cargic_user/utils/car_logo.dart';
import 'package:cargic_user/utils/car_names.dart';
import 'package:cargic_user/widgets/car_brand_card.dart';
import 'package:flutter/material.dart';

int chosenCarBrand;
String carBrandName;
bool isCarBrandSelected = false;

class VehicleBrand extends StatefulWidget {
  @override
  _VehicleBrandState createState() => _VehicleBrandState();
}

class _VehicleBrandState extends State<VehicleBrand> {
  List<CarBrandModel> sampleData = new List<CarBrandModel>();

  @override
  void initState() {
    super.initState();
    setState(() {
      sampleData.add(
        CarBrandModel(
          carBrandName: CarNames.honda,
          carBrandLogo: CarLogos.honda,
          isSelected: false,
        ),
      );
      sampleData.add(
        CarBrandModel(
          carBrandName: CarNames.kia,
          carBrandLogo: CarLogos.kia,
          isSelected: false,
        ),
      );
      sampleData.add(
        CarBrandModel(
          carBrandName: CarNames.ford,
          carBrandLogo: CarLogos.ford,
          isSelected: false,
        ),
      );
      sampleData.add(
        CarBrandModel(
          carBrandName: CarNames.bmw,
          carBrandLogo: CarLogos.bmw,
          isSelected: false,
        ),
      );
      sampleData.add(
        CarBrandModel(
          carBrandName: CarNames.mercedes,
          carBrandLogo: CarLogos.mercedes,
          isSelected: false,
        ),
      );
      sampleData.add(
        CarBrandModel(
          carBrandName: CarNames.audi,
          carBrandLogo: CarLogos.audi,
          isSelected: false,
        ),
      );
      sampleData.add(
        CarBrandModel(
          carBrandName: CarNames.toyota,
          carBrandLogo: CarLogos.toyota,
          isSelected: false,
        ),
      );
      sampleData.add(
        CarBrandModel(
          carBrandName: CarNames.volvo,
          carBrandLogo: CarLogos.volvo,
          isSelected: false,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: GestureDetector(
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
                chosenCarBrand = index;
                carBrandName = sampleData[index].carBrandName;
                isCarBrandSelected = sampleData[index].isSelected;
              });
            },
            child: CarBrandCard(
              item: sampleData[index],
              carBrandLogo: sampleData[index].carBrandLogo,
              carBrandName: sampleData[index].carBrandName,
            ),
          ),
        );
      },
      itemCount: sampleData.length,
    );
  }
}