import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankCard extends StatelessWidget {
  const BankCard({
    Key key,
    this.bankName,
    this.cardNumber,
    this.cardLogo,
    this.onTap,
    this.onDeleteTap,
  }) : super(key: key);
  final String bankName;
  final String cardNumber;
  final String cardLogo;
  final Function onTap;
  final Function onDeleteTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(
          left: 15.5,
          right: 15.5,
          bottom: 20.5,
        ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  (cardLogo != null) ? cardLogo : 'images/bank_card.svg',
                  color: CargicColors.brandBlue,
                  width: 80,
                  height: 50,
                ),
                SizedBox(width: 14.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (bankName != null) ? bankName : '',
                      style: TextStyle(fontSize: 15.7),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      (cardNumber != null) ? cardNumber : '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 13.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: onDeleteTap,
              child: SvgPicture.asset(
                'images/delete_icon.svg',
                width: 15,
                height: 19.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
