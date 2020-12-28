import 'package:cargic_user/models/front_end_models/serviceTypeModel.dart';
import 'package:cargic_user/widgets/car_service_card.dart';
import 'package:flutter/material.dart';

class CarServiceTypeTab extends StatefulWidget {
  const CarServiceTypeTab({
    Key key,
  }) : super(key: key);

  @override
  _CarServiceTypeTabState createState() => _CarServiceTypeTabState();
}

class _CarServiceTypeTabState extends State<CarServiceTypeTab> {
  List<CarServiceTypeModel> sampleData = new List<CarServiceTypeModel>();
  @override
  void initState() {
    sampleData.add(
      CarServiceTypeModel(
        carServiceImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNP34AxxevhiGRICYto78tMghNmWVVTxZu-w&usqp=CAU",
        carServiceName: "Oil Change Service",
        carServicePrice: "399",
        carServiceDescription: "Ammasco oil, Oil filter",
        isSelected: false,
      ),
    );
    sampleData.add(
      CarServiceTypeModel(
        carServiceImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNP34AxxevhiGRICYto78tMghNmWVVTxZu-w&usqp=CAU",
        carServiceName: "Oil Change Service",
        carServicePrice: "499",
        carServiceDescription: "Total oil",
        isSelected: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 5 / 7,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
              });
            },
            child: CarServiceCard(
              carServiceName: sampleData[index].carServiceName,
              carServiceImage: sampleData[index].carServiceImage,
              carServiceDescription: sampleData[index].carServiceDescription,
              carServicePrice: sampleData[index].carServicePrice,
              isSelected: sampleData[index].isSelected,
            ),
          );
        },
        itemCount: sampleData.length,
      ),
    );
  }
}
