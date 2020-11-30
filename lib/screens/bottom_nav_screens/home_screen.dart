import 'package:cargic_user/screens/cargic_services/car_wash/car_wash_screen.dart';
import 'package:cargic_user/screens/change_location_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/banner_ads.dart';
import 'package:cargic_user/widgets/car_info_dash.dart';
import 'package:cargic_user/widgets/location_card.dart';
import 'package:cargic_user/widgets/service_button_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CargicColors.faintWhite,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarInfoDash(
                  //car info from DB
                  //if return from DB as null, set
                  //properties to null
                  // carName: 'Honda Accord',
                  // carLogo: CarLogos.honda,
                  // fuelType: 'Electric',
                  ),
              //Banner ads
              CargicBannerAds(
                banners: [
                  CargicAds(ads: 'images/banner1.svg'),
                  CargicAds(ads: 'images/banner1.svg'),
                  CargicAds(ads: 'images/banner1.svg'),
                  CargicAds(ads: 'images/banner1.svg'),
                  CargicAds(ads: 'images/banner1.svg'),
                ],
              ),
              //Location Button
              LocationCard(
                // location: '',
                onTap: () {
                  Navigator.of(context).pushNamed(ChangeLocationScreen.id);
                },
              ),
              // Features Button Card
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: ServicesButtonCard(
                            serviceName: 'Car Wash',
                            serviceIcon: 'images/car_wash.svg',
                            serviceArrowColor: CargicColors.faintingGrey,
                            onTap: () {
                              Navigator.of(context).pushNamed(CarWashScreen.id);
                            },
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Flexible(
                          child: ServicesButtonCard(
                            serviceName: 'Car Service',
                            serviceIcon: 'images/car_service.svg',
                            serviceArrowColor: CargicColors.faintingGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Flexible(
                          child: ServicesButtonCard(
                            serviceName: 'Registeration Renewal',
                            serviceIcon: 'images/car_register_renew.svg',
                            serviceArrowColor: CargicColors.faintingGrey,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Flexible(
                          child: ServicesButtonCard(
                            serviceName: 'Car Upgrade',
                            secondNameInfo: '(Modification)',
                            serviceIcon: 'images/car_upgrade.svg',
                            serviceArrowColor: CargicColors.faintingGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            child: ServicesButtonCard(
                              serviceName: 'Car Parts',
                              serviceIcon: 'images/car_wash.svg',
                              serviceArrowColor: CargicColors.faintingGrey,
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Flexible(
                          child: Container(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
