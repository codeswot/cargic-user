import 'package:cargic_user/models/front_end_models/cart_item_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:cargic_user/widgets/add_to_cart_button.dart';
import 'package:cargic_user/widgets/smooth_star_rating.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key,
    this.cartItem,
    this.itemName,
    this.itemPrice,
    this.itemImage,
    this.itemRating,
    this.ratingNumber,
    this.onTap,
    this.itemID,
  }) : super(key: key);
  final CartItemModel cartItem;
  final String itemName;
  final double itemPrice;
  final String itemImage;
  final double itemRating;
  final int ratingNumber;
  final Function onTap;
  final int itemID;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: CargicColors.cosmicShadow,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 96,
            child: Image.network((itemImage != null) ? itemImage : ''),
          ),
          Text(
            (itemName != null) ? itemName : '',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothStarRating(
                color: CargicColors.fearYellow,
                borderColor: CargicColors.fearYellow,
                starCount: 5,
                size: 15,
                rating: (itemRating != null) ? itemRating : 0.0,
              ),
              SizedBox(width: 5),
              Text(
                (ratingNumber != null) ? '($ratingNumber)' : '',
                style: TextStyle(
                  color: CargicColors.smoothGray,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            (itemPrice != null) ? '$nigerianCurrency $itemPrice' : '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          SizedBox(height: 10),
          AddToCartButton(
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
