import 'dart:async';

import 'package:cargic_user/screens/cargic_services/car_services_order_screens/track_order_map.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:cargic_user/widgets/track_order_timeline.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TrackOrderScreen extends StatefulWidget {
  TrackOrderScreen({this.reqID});
  final String reqID;
  static const String id = 'TrackOrderScreen';
  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  FirebaseDatabase db = FirebaseDatabase.instance;

  DatabaseReference dbRef;

  String mockOrderID = '01032';
  String orderStatus = 'Pending';
  bool isProssesed = false;
  bool isAssigned = false;
  Color processColor;
  Color processLineColor;
  Color assignedColor;
  Color assignedLineColor;
  void cancelOrder() {
    //track by orderID
    db.reference().child('cargicReq').child('${widget.reqID}').remove();
    print('order canceld');
  }

  void cancelRideRequestOnTimeOut() {
    Timer(
      const Duration(minutes: 5),
      () {
        if (!isAssigned) {
          cancelOrder();
        }
      },
    );
    print('no Cargic available!, request time out ');
  }

  serviceTracking() {
    String requestID = widget.reqID;
    var reqStatus =
        db.reference().child('cargicReq').child('$requestID').child('status');
    print(reqStatus.once());
    Timer(Duration(seconds: 2), () {
      setState(() {
        isProssesed = true;
      });
      if (isProssesed) {
        print('Processed');
        setState(() {
          processLineColor = CargicColors.willGreen;
          processColor = CargicColors.willGreen;
          Timer(Duration(seconds: 5), () {
            setState(() {
              isAssigned = true;
            });
            if (isAssigned) {
              print('Assigned');
              setState(() {
                assignedColor = CargicColors.willGreen;
                assignedLineColor = CargicColors.willGreen;
                orderStatus = 'Accepted';
              });
            }
          });
        });
      }
    });
  }

  @override
  void initState() {
    serviceTracking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order ${widget.reqID}'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TrackOrderTimeLine(
              serviceName: 'Engine Oil change',
              dateTime: 'Mon, 02 November 09:50pm',
              orderDeliveryAddress: '14, kandor ave. Krypton',
              priceToPay: 2200,
              orderStatus: orderStatus,
              orderProcessLinColor: processLineColor,
              orderProcessColor: processColor,
              orderAssignedLineColor: assignedLineColor,
              orderAssingnedColor: assignedColor,
              isAssigned: isAssigned,
              onTap: (isAssigned)
                  ? () {
                      print('Assingend, taking to map');
                      Navigator.of(context).pushNamed(TrackOrderMap.id);
                    }
                  : () {
                      print('No one Assingend');
                    },
            ),
            //if cant cancel accepted order (isAssigned bool)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 57, vertical: 45),
              child: CandyButton(
                title: 'Cancel Order',
                titleColor: CargicColors.smoothGray,
                buttonColor: CargicColors.plainWhite,
                onPressed: () {
                  //delete from DB
                  cancelOrder();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => NavigationScreen()),
                      (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
