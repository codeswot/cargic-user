import 'dart:async';

import 'package:cargic_user/helpers/geofire_helper.dart';
import 'package:cargic_user/helpers/send_req_helper.dart';
import 'package:cargic_user/models/back_end_model/nearby_ninjas.dart';
import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/screens/cargic_services/car_services_order_screens/track_order_screen.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:cargic_user/widgets/cargic_brand_name.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseOrderScreen extends StatefulWidget {
  static const String id = 'PurchaseOrderScreen';
  @override
  _PurchaseOrderScreenState createState() => _PurchaseOrderScreenState();
}

class _PurchaseOrderScreenState extends State<PurchaseOrderScreen> {
  String idFromDB = '';
  String reqID = '';
  DatabaseReference dbRef;
  List<NearbyNinjas> availableNinjas = [];
  bool nearbyDriverKeyLoaded = false;

  DatabaseReference dataBaseRef = FirebaseDatabase.instance.reference();

  //find all available

  void findNinjas() {
    availableNinjas = FireHelper.nearbyNinjaList;
    print(availableNinjas);
    if (FireHelper.nearbyNinjaList.length == 0) {
      print('no Ninja available');
      return;
    }
    var ninja = FireHelper.nearbyNinjaList[0];
    sendRequestToDB(nearbyNinjas: ninja);
    print('Ninja ${ninja.key}');
    FireHelper.nearbyNinjaList.removeAt(0);
    // print(ninja.key);
  }

//sends req
  sendRequestToDB({NearbyNinjas nearbyNinjas}) async {
    var cargicReq = Provider.of<AppData>(context).serviceReqMap;
    Timer(Duration(seconds: 1), () {
      dbRef = FirebaseDatabase.instance.reference().child('cargicReq').push();
      reqID = dbRef.key;
      print('Req ID ${dbRef.key}');
      dbRef.set(cargicReq);

      //send to ninjas by TokenID
      DatabaseReference newReqRef = FirebaseDatabase()
          .reference()
          .child('ninjas/${nearbyNinjas.key}/newReq');
      newReqRef.set(reqID);
      DatabaseReference tokenRef = FirebaseDatabase()
          .reference()
          //geting nearby ninja's token for comm
          .child('ninjas/${nearbyNinjas.key}/token');
      tokenRef.once().then((DataSnapshot snapshot) {
        if (snapshot != null) {
          String token = snapshot.value.toString();

          SendRequestHelper.sendNottification(
            reqID: reqID,
            context: context,
            token: token,
          );
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    findNinjas();
    String orderID = Provider.of<AppData>(context).serviceReqMap["orderID"];
    String date = Provider.of<AppData>(context).serviceReqMap["formattedDate"];

    return Scaffold(
      body: SafeArea(
        child: PurchaseOderCard(
          orderID: orderID, //generates
          orderDateTime: '$date', //format
          primaryTap: () {
            //got to track order
            dataBaseRef
                .reference()
                .child('cargicReq/$reqID/orderID')
                .once()
                .then((DataSnapshot snapshot) {
              if (snapshot.value != null) {
                idFromDB = snapshot.value.toString();
              }
            });
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => NavigationScreen()),
                (route) => false);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    TrackOrderScreen(reqID: reqID, orderID: idFromDB),
              ),
            );
            Provider.of<AppData>(context, listen: false).servicePrice = null;
          },
          secondaryTap: () {
            //pop to home
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => NavigationScreen()),
                (route) => false);
            Provider.of<AppData>(context, listen: false).servicePrice = null;
          },
        ),
      ),
    );
  }
}

class PurchaseOderCard extends StatelessWidget {
  const PurchaseOderCard({
    Key key,
    this.orderID,
    this.orderDateTime,
    this.primaryTap,
    this.secondaryTap,
  }) : super(key: key);
  final String orderID;
  final String orderDateTime;
  final Function primaryTap;
  final Function secondaryTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, bottom: 50),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: CargicBrandName(width: 85, height: 80),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  (orderID != null) ? 'Order $orderID  is Processed' : '',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Sit back and relax The Ninja \n will come to you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 34),
                Text(
                  (orderDateTime != null) ? '$orderDateTime' : '',
                  style: TextStyle(
                    color: CargicColors.fearYellow,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 57),
            child: Column(
              children: [
                CandyButton(
                  buttonColor: CargicColors.plainWhite,
                  titleColor: CargicColors.smoothGray,
                  title: 'Back To Home',
                  onPressed: secondaryTap,
                ),
                SizedBox(height: 24),
                CandyButton(
                  buttonColor: CargicColors.brandBlue,
                  titleColor: CargicColors.plainWhite,
                  title: 'Track Your Order',
                  onPressed: primaryTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
