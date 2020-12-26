import 'dart:async';
import 'package:cargic_user/widgets/bouncing_ripple_loader.dart';
import 'package:cargic_user/widgets/cargicMaps.dart';
import 'package:cargic_user/widgets/map_cancel_button.dart';
import 'package:cargic_user/widgets/request_service_provider_card.dart';
import 'package:cargic_user/widgets/service_request_dash.dart';
import 'package:flutter/material.dart';

class ServiceRequestMap extends StatefulWidget {
  static const String id = 'ServiceRequestMap';
  @override
  _ServiceRequestMapState createState() => _ServiceRequestMapState();
}

class _ServiceRequestMapState extends State<ServiceRequestMap> {
  String title = 'Requesting Car Upgrade \n (Modification)..';
  String information =
      'Please wait while we search for the nearest available car upgrade';
  bool isReqFailed = false;
  bool isReqSuccess = false;
  @override
  void initState() {
    mockRequest();
    super.initState();
  }

  mockRequest() {
    ///handles request, if failed or success
    Timer(Duration(seconds: 15), () {
      setState(() {
        title = 'KHAZ Customs Accepted\n your request ';
        information = 'Follow the map Direction to the service providers ';
        isReqFailed = false;
        isReqSuccess = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            CargicMap(),
            Align(
              alignment: Alignment.topCenter,
              //add some animation for fade, transition
              child: ServiceRequestDash(
                title: title,
                isRetry: isReqFailed, //controll riple and stuff
                information: information,
                failedInfo:
                    'Car Upgraders are not available. Please cancel request and try again Or Retry',
              ),
            ),
            Container(
              child: (isReqSuccess) //use bool for now
                  ? Container()
                  : Positioned.fill(
                      child: BouncingRippleLoader(),
                    ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: (isReqSuccess)
                    ? //use bool for now
                    RequestedServiceProviderCard(
                        //stream builder
                        profilePic:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2Q_rl8bK1OR7c9GxkWrEhrZdOIsmeIiHQUA&usqp=CAU',
                        serviceProviderName: 'KHAZ Customs',
                        serviceProviderDistance: 12.4,
                        serviceProviderAddedInfo:
                            'Plot 38, Mechanic Village Ajah lagos',
                        serviceProviderRating: 4.5,
                        secondaryButtonIcon: Icons.directions,
                        onCallTap: () {
                          //send to dialer
                        },
                        onSecondaryTap: () {
                          //send to map or whatsapp
                        },
                      )
                    : MapCancelButton(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
