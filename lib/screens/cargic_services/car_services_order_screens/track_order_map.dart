import 'dart:async';

import 'package:cargic_user/screens/cargic_services/car_services_order_screens/car_service_confirm_payment.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/request_service_provider_card.dart';
import 'package:cargic_user/widgets/track_order_timeline.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackOrderMap extends StatefulWidget {
  TrackOrderMap({this.orderID, this.reqID});
  final String orderID;
  final String reqID;
  static const String id = 'TrackOrderMap';
  @override
  _TrackOrderMapState createState() => _TrackOrderMapState();
}

class _TrackOrderMapState extends State<TrackOrderMap> {
  String orderID = '';
  String ninjaName = '';
  String ninjaPhone = '';
  double ninjaRating;
  String orderStatus = 'pending';
  bool isProssesed = false;
  bool isAssigned = false;
  Color processColor;
  Color processLineColor;
  Color assignedColor;
  Color assignedLineColor;
  FirebaseDatabase db = FirebaseDatabase.instance;

  getReqInfo() {
    DatabaseReference cargicReqNinjaInfoRef = FirebaseDatabase()
        .reference()
        .child('cargicReq/${widget.reqID}/ninjaInfo');
    cargicReqNinjaInfoRef.once().then((DataSnapshot ninjaInfo) {
      if (ninjaInfo != null) {
        setState(() {
          ninjaName = ninjaInfo.value['ninjaName'].toString();
          ninjaPhone = ninjaInfo.value['phone'].toString();
          ninjaRating = double.parse(ninjaInfo.value['rating']);
          orderID = widget.orderID.toString();
        });
      }
    });

    print(widget.reqID);
    return ninjaRating;
  }

  bool isArived = false;
  mockIsDone() {
    Timer(Duration(seconds: 7), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => NavigationScreen(),
          ),
          (route) => false);
      Navigator.pushNamed(context, ConfirmPaymentScreen.id);
    });
  }

  Future<void> _makePhoneCall(String phone) async {
    if (await canLaunch('tel:$phone')) {
      await launch('tel:$phone');
    } else {
      throw 'Could not launch $phone';
    }
  }

  _whatsapp(String phone) async {
    var whatsappUrl = "whatsapp://send?phone=$phone";
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : print(
            "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }

  @override
  void initState() {
    getReqInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getReqInfo();

    return Scaffold(
      appBar: AppBar(
        title: Text('order ${widget.orderID}'),
        bottom: PreferredSize(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ninja\n $ninjaName',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: CargicColors.brandBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '', //show Arival Time DATETIME for later booking
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style:
                      TextStyle(fontSize: 14, color: CargicColors.hoodwinkGrey),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(100),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            // CargicMap(),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Flexible(
                    flex: 4,
                    child: StreamBuilder(
                        stream: db
                            .reference()
                            .child('cargicReq/${widget.reqID}')
                            .onValue,
                        builder: (context, snap) {
                          if (snap.data != null) {
                            return Column(
                              children: [
                                SizedBox(height: 15),
                                TimelineTile(
                                  alignment: TimelineAlign.manual,
                                  lineXY: 0.1,
                                  indicatorStyle: const IndicatorStyle(
                                    width: 15,
                                    color: CargicColors.willGreen,
                                    padding: EdgeInsets.all(4),
                                  ),
                                  endChild: const TrackOrderTimeLineInfo(
                                    title: 'Ninja Accepted',
                                    message: 'Ninja Will Arrive Soon.',
                                  ),
                                  beforeLineStyle: const LineStyle(
                                    color: CargicColors.willGreen,
                                  ),
                                ),
                                TimelineTile(
                                  alignment: TimelineAlign.manual,
                                  lineXY: 0.1,
                                  indicatorStyle: const IndicatorStyle(
                                    width: 15,
                                    color: CargicColors.willGreen,
                                    padding: EdgeInsets.all(4),
                                  ),
                                  endChild: const TrackOrderTimeLineInfo(
                                    title: 'Ninja Arrived',
                                    message: 'Ninja has Arrive.',
                                  ),
                                  beforeLineStyle: const LineStyle(
                                    color: CargicColors.willGreen,
                                  ),
                                ),
                                TimelineTile(
                                  alignment: TimelineAlign.manual,
                                  lineXY: 0.1,
                                  indicatorStyle: const IndicatorStyle(
                                    width: 15,
                                    color: CargicColors.willGreen,
                                    padding: EdgeInsets.all(4),
                                  ),
                                  endChild: const TrackOrderTimeLineInfo(
                                    title: 'Ninja started work',
                                    message: 'Ninja Has started working.',
                                  ),
                                  beforeLineStyle: const LineStyle(
                                    color: CargicColors.willGreen,
                                  ),
                                ),
                                TimelineTile(
                                  alignment: TimelineAlign.manual,
                                  lineXY: 0.1,
                                  indicatorStyle: const IndicatorStyle(
                                    width: 15,
                                    color: CargicColors.willGreen,
                                    padding: EdgeInsets.all(4),
                                  ),
                                  endChild: const TrackOrderTimeLineInfo(
                                    title: 'Ninja Done',
                                    message: 'Ninja finished the work.',
                                  ),
                                  beforeLineStyle: const LineStyle(
                                    color: CargicColors.willGreen,
                                  ),
                                ),
                              ],
                            );
                          }
                          return CircularProgressIndicator();
                        }),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child:
                    //use bool for now
                    RequestedServiceProviderCard(
                  //stream builder
                  profilePic: '',
                  serviceProviderName: ninjaName,
                  serviceProviderDistance: 12.4,
                  serviceProviderAddedInfo: 'Cargic Ninja',
                  serviceProviderRating: getReqInfo(),
                  secondaryButtonIcon: Icons.chat, //whatsapp
                  secondaryButtonTitle: 'Whatsapp',
                  onCallTap: () {
                    //send to dialer
                    _makePhoneCall(ninjaPhone);
                  },
                  onSecondaryTap: () {
                    //send to map or whatsapp
                    _whatsapp(ninjaPhone);
                    // _whatsapp2(ninjaPhone);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
