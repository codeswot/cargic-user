import 'package:cargic_user/models/cart_item_model.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/car_info_dash.dart';
import 'package:cargic_user/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';

class SelectItemToCart extends StatefulWidget {
  SelectItemToCart(this.selectedPartType);
  final String selectedPartType;
  static const String id = 'CarPartsSelectedCategory';
  @override
  _SelectItemToCartState createState() => _SelectItemToCartState();
}

class _SelectItemToCartState extends State<SelectItemToCart> {
  List<CartItemModel> mockCartItem = List<CartItemModel>();
  List mockinCart = [];
  @override
  void initState() {
    mockCartItem.add(CartItemModel(
      itemID: 0,
      itemImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQfSU7zo2NBpUgXGK7svdh3I_yMSzWzK8sOw&usqp=CAU',
      itemName: 'Horn BLOCK',
      itemPrice: 200,
      itemRating: 0,
      ratingNumber: 5,
    ));
    mockCartItem.add(CartItemModel(
      itemID: 1,
      itemImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQfSU7zo2NBpUgXGK7svdh3I_yMSzWzK8sOw&usqp=CAU',
      itemName: 'Horn DAX',
      itemPrice: 450,
      itemRating: 12,
      ratingNumber: 100,
    ));
    mockCartItem.add(CartItemModel(
      itemID: 2,
      itemImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQfSU7zo2NBpUgXGK7svdh3I_yMSzWzK8sOw&usqp=CAU',
      itemName: 'Horn DAX',
      itemPrice: 250,
      itemRating: 3.2,
      ratingNumber: 24,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CargicColors.pinkishWhite,
      appBar: AppBar(
        backgroundColor: CargicColors.brandBlue,
        iconTheme: IconThemeData(color: CargicColors.plainWhite),
        title: Text(
          (widget.selectedPartType != null) ? widget.selectedPartType : '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: CargicColors.plainWhite,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CarInfoDash(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.selectedPartType} For Honda Accord ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: CargicColors.plainWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.5),
                      Text(
                        '${mockCartItem.length} Product found ',
                        style: TextStyle(
                          color: CargicColors.fearYellow,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ), //add name of Sel car
              ],
            ),
          ),
          preferredSize: Size.fromHeight(200),
        ),
      ),
      body: Container(
        color: CargicColors.pinkishWhite,
        //stream builder(from prev list)
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: 5 / 7,
          ),
          itemBuilder: (context, index) {
            return CartItemCard(
              itemImage: mockCartItem[index].itemImage,
              itemName: mockCartItem[index].itemName,
              itemPrice: mockCartItem[index].itemPrice,
              itemRating: mockCartItem[index].itemRating,
              ratingNumber: mockCartItem[index].ratingNumber,
              onTap: () {
                print(mockCartItem[index].itemName);
                //if itme exist
                if (mockinCart.contains(mockCartItem[index].itemID)) {
                  print('item already in cart');
                } else {
                  mockinCart.add(mockCartItem[index].itemID);
                  print(mockinCart);
                }
                //add to cart
              },
            );
          },
          itemCount: mockCartItem.length,
        ),
      ),
    );
  }
}
