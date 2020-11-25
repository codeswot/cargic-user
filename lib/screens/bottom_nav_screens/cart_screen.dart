import 'package:cargic_user/widgets/cargic_purchase_order_card.dart';
import 'package:cargic_user/widgets/cargic_service_order_card.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static const String id = 'CartScreen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int testCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(),
          Column(
            children: [
              SizedBox(height: 15),
              CargicServiceOrderCard(
                orderNumber: '#0110',
                orderStatus: 'Completed',
                serviceType: 'Car Service',
                serviceDate: '05 December at 02:00pm', //Date ($time)
              ),
              CargicPurchaseOrderCard(
                itemName: 'Test',
                itemImage: 'images/brand_logo.svg',
                itemCount: testCount,
                itemDescription: 'Green',
                itemPrice: 'N500.00',
                itemCountRemove: () {
                  setState(() {
                    testCount--;
                  });
                },
                itemCountAdd: () {
                  setState(() {
                    testCount++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
