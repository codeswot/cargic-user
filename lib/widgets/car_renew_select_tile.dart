import 'package:cargic_user/models/car_reg_renew_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class CarRenewListTile extends StatelessWidget {
  CarRenewListTile(
      {this.isMultiSelect,
      this.paperName,
      this.numberOfItem,
      this.isSelected,
      this.addItem,
      this.removeItem,
      this.item,
      this.itemPrice});
  final bool isMultiSelect;
  final bool isSelected;
  final String paperName;
  final int numberOfItem;
  final int itemPrice;
  final Function addItem;
  final Function removeItem;
  final CarRegRenewModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 6.0,
            offset: Offset(0, 4.0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text((paperName != null) ? '$paperName' : ''),
          Row(
            children: [
              Container(
                child: (isMultiSelect != null)
                    ? (isMultiSelect)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CartButton(
                                icon: Icons.remove,
                                onTap: removeItem,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, top: 3, bottom: 3, right: 20),
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: CargicColors.plainWhite,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 0.5,
                                    color: CargicColors.fairGrey,
                                  ),
                                ),
                                child: Text(
                                  (numberOfItem != null) ? "$numberOfItem" : "",
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              CartButton(
                                icon: Icons.add,
                                onTap: addItem,
                              ),
                            ],
                          )
                        : Container()
                    : Container(),
              ),
              SizedBox(width: 21),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.3,
                    color: (isSelected != null)
                        ? (isSelected)
                            ? CargicColors.willGreen
                            : CargicColors.smoothGray
                        : CargicColors.smoothGray,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: (isSelected != null)
                        ? (isSelected)
                            ? CargicColors.willGreen
                            : CargicColors.smoothGray
                        : CargicColors.smoothGray,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    Key key,
    this.onTap,
    this.icon,
    this.color,
  }) : super(key: key);
  final Function onTap;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: CargicColors.pinkishWhite,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(
          icon,
          size: 16,
          color: CargicColors.brandBlue,
        ),
      ),
    );
  }
}
