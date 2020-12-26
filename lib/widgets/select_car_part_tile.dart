import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class SelectCarPartCategoryTile extends StatelessWidget {
  const SelectCarPartCategoryTile({
    Key key,
    this.itemName,
  }) : super(key: key);

  final String itemName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      decoration: BoxDecoration(color: CargicColors.plainWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            (itemName != null) ? itemName : '',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Icon(Icons.chevron_right, size: 21)
        ],
      ),
    );
  }
}
