import 'package:cargic_user/widgets/car_service_card.dart';
import 'package:flutter/material.dart';

class CarServiceTypeTab extends StatelessWidget {
  const CarServiceTypeTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            child: CarServiceCard(
              carServiceName: 'Oil change',
              carServiceDescription: 'Something cool here or far away to cosmo',
              carServicePrice: '300',
            ),
          ),
          Flexible(
            child: CarServiceCard(
              carServiceName: 'Oil change',
              carServiceDescription: 'Something',
              carServicePrice: '300',
            ),
          ),
        ],
      ),
    );
  }
}
