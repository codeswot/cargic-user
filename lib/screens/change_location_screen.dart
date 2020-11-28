import 'package:cargic_user/utils/colors.dart';
import 'package:flutter/material.dart';

class ChangeLocationScreen extends StatelessWidget {
  static const String id = 'ChangeLocationScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: CargicColors.plainWhite,
            boxShadow: [
              BoxShadow(
                color: CargicColors.cosmicShadow,
                blurRadius: 6.0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.close),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 17),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // AddFromMapButton(),
              //location Lists
            ],
          ),
        ),
      ),
    );
  }
}

class AddFromMapButton extends StatelessWidget {
  const AddFromMapButton({
    Key key,
    this.onTap,
  }) : super(key: key);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: CargicColors.plainWhite,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: CargicColors.cosmicShadow,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_location,
                  color: CargicColors.fairGrey,
                  size: 18,
                ),
                SizedBox(width: 11),
                Text(
                  'Set Location on Map',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            Icon(Icons.chevron_right, color: CargicColors.fairGrey)
          ],
        ),
      ),
    );
  }
}
