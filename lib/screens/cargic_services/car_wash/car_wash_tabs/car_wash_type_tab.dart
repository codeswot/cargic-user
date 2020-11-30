import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/custom_clipper.dart';
import 'package:flutter/material.dart';

class CarWashTypeTab extends StatelessWidget {
  const CarWashTypeTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: CargicColors.plainWhite,
              ),
              child: Column(
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Image.network(
                      'https://i.ibb.co/1vXpqVs/flutter-logo.jpg',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
