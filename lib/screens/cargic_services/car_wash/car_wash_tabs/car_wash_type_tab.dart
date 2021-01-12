import 'package:cargic_user/models/front_end_models/car_wash_service_model.dart';
import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/widgets/car_wash_service_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarWashTypeTab extends StatefulWidget {
  const CarWashTypeTab({
    Key key,
  }) : super(key: key);

  @override
  _CarWashTypeTabState createState() => _CarWashTypeTabState();
}

class _CarWashTypeTabState extends State<CarWashTypeTab> {
  List<CarWashTypeModel> sampleData = new List<CarWashTypeModel>();

  @override
  void initState() {
    super.initState();
    setState(() {
      sampleData.add(
        CarWashTypeModel(
          carWashServiceImage: '',
          carWashServiceName: 'Exterior Wash',
          carWashServiceDiscount: '15',
          carWashServicePrice: '300',
          isSelected: false,
        ),
      );

      sampleData.add(
        CarWashTypeModel(
          carWashServiceImage: '',
          carWashServiceName: 'Interior Wash',
          carWashServiceDiscount: '15',
          carWashServicePrice: '350',
          isSelected: false,
        ),
      );
      sampleData.add(
        CarWashTypeModel(
          carWashServiceImage: '',
          carWashServiceName: 'Exterior Wash',
          carWashServiceDiscount: '15',
          carWashServicePrice: '750',
          isSelected: false,
        ),
      );
      sampleData.add(
        CarWashTypeModel(
          carWashServiceImage: '',
          carWashServiceName: 'Exterior Detailing',
          carWashServiceDiscount: '15',
          carWashServicePrice: '850',
          isSelected: false,
        ),
      );
      sampleData.add(
        CarWashTypeModel(
          carWashServiceImage: '',
          carWashServiceName: 'Disinfection',
          carWashServiceDiscount: '15',
          carWashServicePrice: '850',
          isSelected: false,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 5 / 7,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: GestureDetector(
              onTap: () {
                //get/price,name,discount
                setState(() {
                  sampleData.forEach((element) => element.isSelected = false);
                  sampleData[index].isSelected = true;
                  Provider.of<AppData>(context, listen: false).saveService(
                    type: "Car Wash",
                    name: sampleData[index].carWashServiceName,
                    discount: sampleData[index].carWashServiceDiscount,
                    price: sampleData[index].carWashServicePrice,
                  );
                });
              },
              child: CarWashServiceCard(
                isSelected: sampleData[index].isSelected,
                item: sampleData[index],
                carWashServiceImage: sampleData[index].carWashServiceImage,
                carWashServiceName: sampleData[index].carWashServiceName,
                carWashServicePrice: sampleData[index].carWashServicePrice,
                carWashServiceDiscount:
                    sampleData[index].carWashServiceDiscount,
              ),
            ),
          );
        },
        itemCount: sampleData.length,
      ),
    );
  }
}
