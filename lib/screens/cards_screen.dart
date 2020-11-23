import 'package:cargic_user/screens/add_cards_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/bank_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardScreen extends StatelessWidget {
  static const String id = 'CardScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cards'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AddCards.id);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(horizontal: 15.5, vertical: 25),
                  decoration: BoxDecoration(
                    color: CargicColors.plainWhite,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: CargicColors.cosmicShadow,
                        blurRadius: 9.0,
                        offset: Offset(0.0, 6.0),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'images/credit_card_icon.svg',
                        width: 20,
                        height: 15,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Add Card',
                        style: TextStyle(fontSize: 18.6),
                      ),
                    ],
                  ),
                ),
              ),
              BankCard(
                bankName: 'Zenith Bank',
                cardNumber: '12345*********67890',
                onTap: () {},
                onDeleteTap: () {},
              ),
              BankCard(
                bankName: 'GT Bank',
                cardNumber: '12345*********67890',
                onTap: () {},
                onDeleteTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
