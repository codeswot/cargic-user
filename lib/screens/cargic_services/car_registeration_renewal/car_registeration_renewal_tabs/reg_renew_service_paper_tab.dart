import 'package:cargic_user/widgets/car_info_dash.dart';
import 'package:flutter/material.dart';

class RegRenewSelectPapersTab extends StatefulWidget {
  const RegRenewSelectPapersTab({
    Key key,
  }) : super(key: key);

  @override
  _RegRenewSelectPapersTabState createState() =>
      _RegRenewSelectPapersTabState();
}

class _RegRenewSelectPapersTabState extends State<RegRenewSelectPapersTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarInfoDash(
            isBorder: true,
            isShaddow: false,
          ),
          Flexible(
            child: ListView.builder(itemBuilder: (context, index) {
              return Container();
            }),
          ),
        ],
      ),
    );
  }
}
