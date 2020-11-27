import 'package:cargic_user/models/car_type_model.dart';
import 'package:cargic_user/widgets/car_type_card.dart';
import 'package:flutter/material.dart';

int chosenCarType;
String carTypeName;
bool isCarTypeSelected = false;

class VehicleType extends StatefulWidget {
  @override
  createState() {
    return VehicleTypeState();
  }
}

class VehicleTypeState extends State<VehicleType> {
  List<CarTypeModel> sampleData = new List<CarTypeModel>();

  @override
  void initState() {
    super.initState();
    setState(() {
      sampleData.add(
        CarTypeModel(
            isSelected: false,
            carTypeName: 'Car',
            carTypeImage: 'images/car_yellow.svg'),
      );
      sampleData.add(
        CarTypeModel(
            isSelected: false,
            carTypeName: 'Van',
            carTypeImage: 'images/van.svg'),
      );

      sampleData.add(
        CarTypeModel(
            isSelected: false,
            carTypeName: 'Bus',
            carTypeImage: 'images/school_buss.svg'),
      );
      sampleData.add(
        CarTypeModel(
            isSelected: false,
            carTypeName: 'Truck',
            carTypeImage: 'images/truck.svg'),
      );
      sampleData.add(
        CarTypeModel(
            isSelected: false,
            carTypeName: 'Jeep',
            carTypeImage: 'images/jeep_red.svg'),
      );
      sampleData.add(
        CarTypeModel(
            isSelected: false,
            carTypeName: 'Tractor',
            carTypeImage: 'images/tractor_blue.svg'),
      );
      sampleData.add(
        CarTypeModel(
            isSelected: false,
            carTypeName: 'Bike',
            carTypeImage: 'images/bike_red.svg'),
      );
      sampleData.add(
        CarTypeModel(
            isSelected: false,
            carTypeName: 'Motorcycle',
            carTypeImage: 'images/scooter_red.svg'),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(15),
      itemCount: sampleData.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: GestureDetector(
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
                chosenCarType = index;
                isCarTypeSelected = sampleData[chosenCarType].isSelected;
                carTypeName = sampleData[chosenCarType].carTypeName;
                print('chosen car is $carTypeName');

                print(isCarTypeSelected);
              });
            },
            child: CarTypeCard(
              sampleData[index],
              sampleData[index].carTypeImage,
              sampleData[index].carTypeName,
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
    );
  }
}
