import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/bouncing_ripple_loader.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:cargic_user/widgets/cargicMaps.dart';
import 'package:cargic_user/widgets/cute_bottom_nav.dart';
import 'package:flutter/material.dart';

class CarModificationRequest extends StatefulWidget {
  static const String id = 'CarModificationRequest';
  @override
  _CarModificationRequestState createState() => _CarModificationRequestState();
}

class _CarModificationRequestState extends State<CarModificationRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            CargicMap(),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                height: 165,
                decoration: BoxDecoration(
                  color: CargicColors.plainWhite,
                  boxShadow: [
                    BoxShadow(
                      color: CargicColors.cosmicShadow,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 35), //TODO mdia Q
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Requesting Car Upgrade \n (Modification)..',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: CargicColors.smoothGray,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            child: Text('Retry'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Please Wait, Searching for nearest car upgrade',
                        style: TextStyle(
                            fontSize: 14, color: CargicColors.smoothGray),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: BouncingRippleLoader(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MapCancelButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class MapCancelButton extends StatelessWidget {
  const MapCancelButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 125,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CargicColors.plainWhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: CargicColors.cosmicShadow,
              blurRadius: 9,
              offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CargicColors.brandBlue,
              boxShadow: [
                BoxShadow(
                  color: CargicColors.cosmicShadow,
                  blurRadius: 3,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            child: Icon(Icons.close, color: CargicColors.plainWhite),
          ),
          SizedBox(height: 15),
          Text(
            'CANCEL',
            style: TextStyle(
              color: CargicColors.smoothGray,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// appBar: PreferredSize(
//         child:

//         preferredSize: Size.fromHeight(145),
//       ),
