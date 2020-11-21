import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CargicPurchaseOrderCard extends StatelessWidget {
  const CargicPurchaseOrderCard({
    Key key,
    this.itemName,
    this.itemDescription,
    this.itemPrice,
    this.itemCount,
    this.itemImage,
    this.cancelOrder,
    this.itemCountAdd,
    this.itemCountRemove,
  }) : super(key: key);
  final String itemName;
  final String itemImage;
  final String itemDescription;
  final String itemPrice;
  final int itemCount;
  final Function cancelOrder;
  final Function itemCountAdd;
  final Function itemCountRemove;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(
        left: 15.0,
        bottom: 15.0,
        right: 15.0,
      ),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 5,
            offset: Offset(0.0, 2.5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //left side
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //cart item image
                    SvgPicture.asset(
                      (itemImage != null) ? itemImage : 'images/bike_red.svg',
                      width: 92,
                      height: 71.6,
                    ),
                    SizedBox(width: 17.5),
                    //cart item name and description
                    Container(
                      child: Column(
                        children: [
                          Text(
                            (itemName != null) ? itemName : 'item',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            (itemDescription != null) ? itemDescription : 'Red',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //cart item count
                SizedBox(height: 15),
                Container(
                  child: Row(
                    children: [
                      //item remove --
                      GestureDetector(
                        onTap: itemCountRemove,
                        child: Container(
                          padding: EdgeInsets.all(1.4),
                          decoration: BoxDecoration(
                            color: CargicColors.subtleWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: CargicColors.brandBlue,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      //item count
                      Container(
                        padding: EdgeInsets.only(
                            left: 15, right: 22, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: CargicColors.emidWhite,
                          ),
                        ),
                        child: Text((itemCount != null)
                            ? itemCount.toString()
                            : 0.toString()),
                      ),
                      SizedBox(width: 10),
                      //item add ++
                      GestureDetector(
                        onTap: itemCountAdd,
                        child: Container(
                          padding: EdgeInsets.all(1.4),
                          decoration: BoxDecoration(
                            color: CargicColors.subtleWhite,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Icon(
                            Icons.add,
                            color: CargicColors.brandBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Ride side
          Container(
            height: 115, //if issue?
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //clear cart item
                GestureDetector(child: Icon(Icons.close)),
                Flexible(
                  child: Container(),
                ),
                //cart item price
                Text(
                  (itemPrice != null) ? itemPrice : 'N0.00',
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
