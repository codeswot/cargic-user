import 'package:cargic_user/models/front_end_models/car_renew_tile_model.dart';
import 'package:cargic_user/widgets/car_info_dash.dart';
import 'package:cargic_user/widgets/car_renew_select_tile.dart';
import 'package:flutter/material.dart';

class RegRenewSelectPapersTab extends StatefulWidget {
  const RegRenewSelectPapersTab({
    Key key,
  }) : super(key: key);

  @override
  _RegRenewSelectPapersTabState createState() =>
      _RegRenewSelectPapersTabState();
}

class _RegRenewSelectPapersTabState extends State<RegRenewSelectPapersTab> {
  List<CarRenewTileModel> renewPaperModel = List<CarRenewTileModel>();
//TODO add every price when collecting data, send to total(provider)
  @override
  void initState() {
    renewPaperModel.add(CarRenewTileModel(
      paperName: "Road Worthiness",
      isMultiSelect: false,
      isSelected: false,
      itemCount: 0,
      itemPrice: 200, //Naira
    ));
    renewPaperModel.add(CarRenewTileModel(
      paperName: "Vehicle License",
      isMultiSelect: true,
      isSelected: false,
      itemCount: 0,
      itemPrice: 200, //Naira
    ));
    renewPaperModel.add(CarRenewTileModel(
      paperName: "Third Party Insurance",
      isMultiSelect: false,
      isSelected: false,
      itemCount: 0,
      itemPrice: 2500, //Naira
    ));
    renewPaperModel.add(CarRenewTileModel(
      paperName: "Hackyney Permit",
      isMultiSelect: true,
      isSelected: false,
      itemCount: 0,
      itemPrice: 200, //Naira
    ));
    renewPaperModel.add(CarRenewTileModel(
      paperName: "Heavy Duty Permit",
      isMultiSelect: false,
      isSelected: false,
      itemCount: 0,
      itemPrice: 200, //Naira
    ));
    renewPaperModel.add(CarRenewTileModel(
      paperName: "Local Govt. Permit",
      isMultiSelect: false,
      isSelected: false,
      itemCount: 0,
      itemPrice: 200, //Naira
    ));
    renewPaperModel.add(CarRenewTileModel(
      paperName: "State Carriage Permit",
      isMultiSelect: false,
      isSelected: false,
      itemCount: 0,
      itemPrice: 200, //Naira
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          CarInfoDash(
            isBorder: true,
            isShaddow: false,
          ),
          // ...
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        renewPaperModel
                            .forEach((element) => element.isSelected = false);
                        renewPaperModel[index].isSelected = true;
                      });
                      print(
                          "${renewPaperModel[index].paperName} and price is ${renewPaperModel[index].itemPrice}");
                    },
                    child: CarRenewListTile(
                      paperName: renewPaperModel[index].paperName,
                      isSelected: renewPaperModel[index].isSelected,
                      isMultiSelect: renewPaperModel[index].isMultiSelect,
                      numberOfItem: renewPaperModel[index].itemCount,
                      // itemPrice: renewPaperModel[index].itemPrice,
                      addItem: () {
                        if (renewPaperModel[index].isSelected) {
                          setState(() {
                            renewPaperModel[index].itemCount++;
                            //TODO take care of negative value, and round to int for remove items
                            print(
                                "${renewPaperModel[index].itemCount} for ${renewPaperModel[index].paperName} and price is ${renewPaperModel[index].itemPrice * renewPaperModel[index].itemCount}");
                          });
                        }
                      },
                      removeItem: () {
                        if (renewPaperModel[index].isSelected) {
                          setState(() {
                            renewPaperModel[index].itemCount--;
                            print(
                                "${renewPaperModel[index].itemCount} for ${renewPaperModel[index].paperName} and price is ${renewPaperModel[index].itemPrice / renewPaperModel[index].itemCount}");
                          });
                        }
                      },
                    ),
                  );
                },
                itemCount: renewPaperModel.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
