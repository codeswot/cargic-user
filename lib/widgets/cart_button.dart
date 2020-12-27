import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartButton extends StatelessWidget {
  CartButton({
    Key key,
    this.itemCount,
  }) : super(key: key);
  final int itemCount;
  bool isCountOverflow = false;
  countOverFlow() {
    if (itemCount >= 99) {
      isCountOverflow = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    countOverFlow();
    return Container(
      child: Stack(
        children: [
          // GestureDetector(
          //   onTap: () {},
          //   child: Icon(
          //     Icons.shopping_cart_outlined,
          //   ),
          // ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () {}, //navigate to cart screen
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: CargicColors.fearYellow,
                shape: BoxShape.circle,
              ),
              child: Text(
                (itemCount != null)
                    ? (isCountOverflow)
                        ? '99+'
                        : '$itemCount'
                    : '',
                style: TextStyle(
                  color: CargicColors.brandBlue,
                  fontWeight: FontWeight.w600,
                  fontSize: 8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
