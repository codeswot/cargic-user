import 'dart:async';
import 'dart:io';

import 'package:cargic_user/helpers/location_helper.dart';
import 'package:cargic_user/screens/cargic_services/car_services_order_screens/car_service_confirm_payment.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/cargicMaps.dart';
import 'package:cargic_user/widgets/request_service_provider_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
  String message = 'Hello';
  double ninjaRating;

  double getReqInfo() {
    DatabaseReference cargicReqNinjaInfoRef = FirebaseDatabase()
        .reference()
        .child('cargicReq/${widget.reqID}/ninjaInfo');
    cargicReqNinjaInfoRef.once().then((ninjaInfo) {
      if (ninjaInfo != null) {
        setState(() {
          ninjaName = ninjaInfo.value['ninjaName'].toString();
          ninjaPhone = ninjaInfo.value['phone'].toString();
          ninjaRating = double.parse(ninjaInfo.value['rating']);
          orderID = widget.orderID;
        });
      }
    });

    print(ninjaRating);
    return ninjaRating;
  }

  getDirection() {}

  String mockDashMessage = '';
  String eta = 'Arrival Time 30 Minutes';
  bool isArived = false;
  mockArived() {
    getReqInfo();
    Timer(Duration(seconds: 5), () {
      setState(() {
        isArived = true;
        mockDashMessage = '$ninjaName  has Arrived';
        eta = '';
      });
      if (isArived) {
        // mockIsDone();
      }
    });
  }

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
    mockArived();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mockArived();
    getReqInfo();

    return Scaffold(
      appBar: AppBar(
        title: Text('order $orderID'),
        bottom: PreferredSize(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$mockDashMessage',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: CargicColors.brandBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '$eta', //show Arival Time DATETIME for later booking
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
            CargicMap(),
            Align(
              alignment: Alignment.topCenter,
              //add some animation for fade, transition
              child: Container(
                width: double.infinity,
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
