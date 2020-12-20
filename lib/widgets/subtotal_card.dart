import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:flutter/material.dart';

class SubTotalCard extends StatelessWidget {
  const SubTotalCard({
    Key key,
    this.price,
    this.onTap,
    this.isSubTotal,
  }) : super(key: key);
  final bool isSubTotal;
  final String price;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
        width: double.infinity,
        color: CargicColors.plainWhite,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text((isSubTotal == null)
                    ? ''
                    : (isSubTotal)
                        ? "subtotal"
                        : ""),
                Row(
                  children: [
                    Text((price != null) ? '$nigerianCurrency' : ''),
                    Text((price != null) ? '$price' : ''),
                  ],
                ),
              ],
            ),
            Flexible(child: Container()),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 42, vertical: 12),
                decoration: BoxDecoration(
                  color: CargicColors.brandBlue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: CargicColors.cosmicShadow,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: CargicColors.plainWhite,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
