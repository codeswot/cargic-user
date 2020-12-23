import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/check_out_credit_card.dart';
import 'package:cargic_user/widgets/location_card.dart';
import 'package:cargic_user/widgets/paper_renew_cart_card.dart';
import 'package:flutter/material.dart';

import '../../../change_location_screen.dart';

class RegRenewCheckOut extends StatefulWidget {
  const RegRenewCheckOut({
    Key key,
  }) : super(key: key);

  @override
  _RegRenewCheckOutState createState() => _RegRenewCheckOutState();
}

class _RegRenewCheckOutState extends State<RegRenewCheckOut> {
  List selectedItems = [
    'Road Worthiness',
    'Vehicle License',
    'Third Party Insurance',
    'Heavy Duty Permit',
    'Local Govt. Permit',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          LocationCard(
            onTap: () {
              Navigator.of(context).pushNamed(ChangeLocationScreen.id);
            },
          ),
          PaperRenewCartCard(
            selectedItems: Container(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(
                      '${selectedItems[index]}', //
                      style: TextStyle(
                        color: CargicColors.smoothGray,
                        fontSize: 12,
                      ),
                    ),
                  );
                },
                itemCount: selectedItems.length,
              ),
            ),
          ),
          CheckOutCreditCard()
        ],
      ),
    );
  }
}
