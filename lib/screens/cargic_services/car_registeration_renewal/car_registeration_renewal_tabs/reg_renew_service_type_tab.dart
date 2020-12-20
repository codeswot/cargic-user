import 'package:cargic_user/models/car_reg_renew_model.dart';
import 'package:cargic_user/widgets/renew_service_card.dart';
import 'package:flutter/material.dart';

class RegRenewServiceTypeTab extends StatefulWidget {
  const RegRenewServiceTypeTab({
    Key key,
  }) : super(key: key);

  @override
  _RegRenewServiceTypeTabState createState() => _RegRenewServiceTypeTabState();
}

class _RegRenewServiceTypeTabState extends State<RegRenewServiceTypeTab> {
  List<CarRegRenewModel> sampleData = new List<CarRegRenewModel>();

  @override
  void initState() {
    sampleData.add(
      CarRegRenewModel(
        carServiceName: "Renew Vehicle \n Papers",
        isSelected: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 5 / 7,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //get/price,name,discount
              setState(() {
                sampleData.forEach((element) => element.isSelected = false);
                sampleData[index].isSelected = true;
              });
            },
            child: CarRenewServiceCard(
              serviceName: sampleData[index].carServiceName,
              isSelected: sampleData[index].isSelected,
            ),
          );
        },
        itemCount: sampleData.length,
      ),
    );
  }
}
