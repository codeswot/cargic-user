import 'dart:async';

import 'package:cargic_user/helpers/authentication_helper.dart';
import 'package:cargic_user/helpers/geofire_helper.dart';
import 'package:cargic_user/helpers/location_helper.dart';
import 'package:cargic_user/models/back_end_model/nearby_ninjas.dart';
import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/screens/auth_screens/login_with_email_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/utils/global_variables.dart';
import 'package:cargic_user/widgets/brand_logo.dart';
import 'package:cargic_user/widgets/candy_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class LoginMethodScreen extends StatefulWidget {
  static const String id = 'LoginMethodScreen';

  @override
  _LoginMethodScreenState createState() => _LoginMethodScreenState();
}

class _LoginMethodScreenState extends State<LoginMethodScreen> {
  LocationHelper _locationHelper = LocationHelper();
  AuthHelper _authHelper = AuthHelper();
  bool nearbyDriverKeyLoaded = false;
  Geolocator _geolocator = Geolocator();

  getVheicleInfo() async {
    await Provider.of<AppData>(context, listen: false).updateUserVehicle();
  }

  void startGeoFire() {
    Geofire.initialize('ninjasAvailable');
    Geofire.queryAtLocation(
            currentPosition.latitude, currentPosition.longitude, 19)
        .listen((map) {
      print(map);
      if (map != null) {
        var callBack = map['callBack'];
        print('position $currentPosition');
        //latitude will be retrieved from map['latitude']
        //longitude will be retrieved from map['longitude']

        switch (callBack) {
          case Geofire.onKeyEntered:
            NearbyNinjas nearbyNinjas = NearbyNinjas();
            nearbyNinjas.key = map['key'];
            nearbyNinjas.latitude = map['latitude'];
            nearbyNinjas.longitude = map['longitude'];
            FireHelper.nearbyNinjaList.add(nearbyNinjas);
            print('nearby Ninja==> $nearbyNinjas');
            if (nearbyDriverKeyLoaded) {
              // updateDriversMap();
            }
            // keysRetrieved.add(map["key"]);
            break;

          case Geofire.onKeyExited:
            // keysRetrieved.remove(map["key"]);
            FireHelper().removeFromList(key: map['key']);
            // updateDriversMap();

            break;

          case Geofire.onKeyMoved:
            // Update your key's location
            NearbyNinjas nearbyNinjas = NearbyNinjas();
            nearbyNinjas.key = map['key'];
            nearbyNinjas.latitude = map['latitude'];
            nearbyNinjas.longitude = map['longitude'];
            // FireHelper.nearbyDriverList.add(nearbyDriver);
            FireHelper().updateNearbyNinjas(nearbyNinjas);
            // updateDriversMap();

            break;

          case Geofire.onGeoQueryReady:
            // All Intial Data is loaded
            nearbyDriverKeyLoaded = true;
            // updateDriversMap();

            break;
        }
      }
    });
  }

  getUserPosition() async {
    Position position = await _geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    // confirm location
    await _locationHelper.findCoordAddress(currentPosition, context);
    startGeoFire();
  }

  @override
  Widget build(BuildContext context) {
    getUserPosition();
    getVheicleInfo();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BrandLogo(),
            Container(
              margin: EdgeInsets.only(left: 49.5, right: 49.5),
              child: Text(
                'By login to our service your data will be saved and accessible from different devices',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.all(30.0),
              padding: EdgeInsets.only(
                left: 27.0,
                right: 27.0,
                top: 52.0,
                bottom: 52.0,
              ),
              decoration: BoxDecoration(
                color: CargicColors.plainWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8.0,
                    offset: Offset(0, 4.0),
                    color: CargicColors.cosmicShadow,
                  ),
                ],
              ),
              child: Column(
                children: [
                  CandyButton(
                    buttonColor: CargicColors.plainWhite,
                    titleColor: CargicColors.smoothGray,
                    iconColor: CargicColors.rageRed,
                    buttonIcon: 'images/google_icon.svg',
                    title: 'Login with Google',
                    onPressed: () {
                      _authHelper.signInWithGoogle();
                    },
                  ),
                  SizedBox(height: 32.0),
                  CandyButton(
                    buttonColor: CargicColors.hopeBlue,
                    titleColor: CargicColors.plainWhite,
                    iconColor: CargicColors.plainWhite,
                    buttonIcon: 'images/email_icon.svg',
                    title: 'Login with Email',
                    onPressed: () {
                      Navigator.of(context).pushNamed(LoginWithEmailScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
