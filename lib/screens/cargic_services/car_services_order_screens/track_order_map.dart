import 'dart:async';

import 'package:cargic_user/screens/cargic_services/car_services_order_screens/car_service_confirm_payment.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/cargicMaps.dart';
import 'package:cargic_user/widgets/request_service_provider_card.dart';
import 'package:flutter/material.dart';

class TrackOrderMap extends StatefulWidget {
  static const String id = 'TrackOrderMap';
  @override
  _TrackOrderMapState createState() => _TrackOrderMapState();
}

class _TrackOrderMapState extends State<TrackOrderMap> {
  String mockOrderID = '01032';
  String mockDashMessage = 'Musa Damu Accepted your Request';
  String eta = 'Arrival Time 30 Minutes';
  bool isArived = false;
  mockArived() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        isArived = true;
        mockDashMessage = 'Musa Damu has Arrived';
        eta = '';
      });
      if (isArived) {
        mockIsDone();
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

  @override
  void initState() {
    mockArived();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('order #$mockOrderID'),
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
                  profilePic:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2Q_rl8bK1OR7c9GxkWrEhrZdOIsmeIiHQUA&usqp=CAU',
                  serviceProviderName: 'Musa Damu',
                  serviceProviderDistance: 12.4,
                  serviceProviderAddedInfo: 'Professional Car Wash',
                  serviceProviderRating: 4.5,
                  secondaryButtonIcon: Icons.chat, //whatsapp
                  secondaryButtonTitle: 'Whatsapp',
                  onCallTap: () {
                    //send to dialer
                  },
                  onSecondaryTap: () {
                    //send to map or whatsapp
                  },
                )),
          ],
        ),
      ),
    );
  }
}
