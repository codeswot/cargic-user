import 'dart:async';

import 'package:cargic_user/screens/cargic_services/car_services_order_screens/track_order_map.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:cargic_user/widgets/track_order_timeline.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TrackOrderScreen extends StatefulWidget {
  TrackOrderScreen({this.reqID, this.orderID});
  final String reqID;
  final String orderID;
  static const String id = 'TrackOrderScreen';
  @override
  _TrackOrderScreenState createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  FirebaseDatabase db = FirebaseDatabase.instance;
  String orderStatus = 'pending';
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

  DatabaseReference dataBaseRef = FirebaseDatabase().reference();
  void cancelRideRequestOnTimeOut() {
    Timer(
      const Duration(hours: 12),
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

    db.reference().child('cargicReq/$requestID/status').once().then(
      (DataSnapshot snapshot) {
        if (snapshot.value != null) {
          if (snapshot.value == 'accepted') {
            Timer(Duration(seconds: 1), () {
              setState(() {
                isProssesed = true;
              });
              if (isProssesed) {
                setState(() {
                  processLineColor = CargicColors.willGreen;
                  processColor = CargicColors.willGreen;
                  Timer(Duration(seconds: 2), () {
                    setState(() {
                      isAssigned = true;
                    });
                    if (isAssigned) {
                      setState(() {
                        assignedColor = CargicColors.willGreen;
                        assignedLineColor = CargicColors.willGreen;
                        orderStatus = snapshot.value.toString();
                      });
                    }
                  });
                });
              }
            });
          }
        }
      },
    );
    // print(reqStatus.once());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    serviceTracking();

    return Scaffold(
      appBar: AppBar(
        title: Text('Order ${widget.orderID}'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder(
                stream:
                    db.reference().child('cargicReq/${widget.reqID}').onValue,
                builder: (context, snap) {
                  if (snap.data != null) {
                    return TrackOrderTimeLine(
                      serviceName: snap.data.snapshot.value['serviceName'],
                      dateTime: snap.data.snapshot.value['formattedDate'],
                      orderDeliveryAddress: snap.data.snapshot.value['user']
                          ['address'],
                      priceToPay:
                          double.parse(snap.data.snapshot.value['price']),
                      orderStatus: snap.data.snapshot.value['status'],
                      orderProcessLinColor: processLineColor,
                      orderProcessColor: processColor,
                      orderAssignedLineColor: assignedLineColor,
                      orderAssingnedColor: assignedColor,
                      isAssigned: isAssigned,
                      onTap: (orderStatus == 'accepted')
                          ? () {
                              print('Assingend, taking to map');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TrackOrderMap(
                                      orderID: widget.orderID,
                                      reqID: widget.reqID),
                                ),
                              );
                            }
                          : () {
                              print('No one Assingend');
                            },
                    );
                  }
                  return CircularProgressIndicator();
                }),

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
