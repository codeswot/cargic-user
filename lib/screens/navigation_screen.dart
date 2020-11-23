import 'dart:io';
import 'package:cargic_user/screens/cart_screen.dart';
import 'package:cargic_user/screens/home_screen.dart';
import 'package:cargic_user/screens/ninja_screen.dart';
import 'package:cargic_user/screens/profile_screen.dart';
import 'package:cargic_user/screens/side_nav/side_navigation.dart';
import 'package:cargic_user/utils/cargic_icons_icons.dart';
import 'package:cargic_user/utils/cargic_secondary_icons_icons.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:cargic_user/widgets/app_bar_button.dart';
import 'package:cargic_user/widgets/cargic_brand_name.dart';
import 'package:cargic_user/widgets/cute_bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  static const String id = 'NavigationScreen';
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  bool isUpComing = true;
  indexController() {
    print(_selectedIndex);
  }

  static List<Widget> _screens = <Widget>[
    HomeScreen(),
    CartScreen(),
    NinjaScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CargicColors.faintWhite,
      drawer: CargicSideNav(),
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: (_selectedIndex == 1) ? 140 : 70,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CargicBrandName(),
        ),
        actions: (_selectedIndex == 3)
            ? [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Icon(Icons.more_vert, size: 22),
                ),
              ]
            : [],
        bottom: (_selectedIndex == 1)
            ? PreferredSize(
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppBarButton(
                        buttonTitle: 'Upcoming',
                        buttonColor: (isUpComing == true)
                            ? CargicColors.brandBlue
                            : CargicColors.plainWhite,
                        titleColor: (isUpComing == true)
                            ? CargicColors.plainWhite
                            : CargicColors.pitchBlack,
                        onTap: () {
                          setState(() {
                            isUpComing = true;
                            //fetch upcomin
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      AppBarButton(
                        buttonTitle: 'Completed',
                        buttonColor: (isUpComing == true)
                            ? CargicColors.plainWhite
                            : CargicColors.brandBlue,
                        titleColor: (isUpComing == true)
                            ? CargicColors.pitchBlack
                            : CargicColors.plainWhite,
                        onTap: () {
                          setState(() {
                            isUpComing = false;
                            //fetch completed
                          });
                        },
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(75.0),
              )
            : PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(),
              ),
      ),
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 50,
          margin: EdgeInsets.only(
              left: 10, right: 10, bottom: (Platform.isAndroid) ? 10.5 : 2.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: CargicColors.cosmicShadow,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
            color: CargicColors.plainWhite,
          ),
          child: CuteBottomNav(
            gap: 10,
            selectedIndex: _selectedIndex,
            mainAxisAlignment: MainAxisAlignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6.0),
            duration: Duration(milliseconds: 800),
            activeColor: CargicColors.hopeBlue,
            color: CargicColors.smoothGray,
            iconSize: 21,
            tabs: [
              CuteNavButton(
                icon: CargicSecondaryIcons.home,
                iconSize: 19,
                text: 'Home',
              ),
              CuteNavButton(
                icon: CargicIcons.cart_icon,
                text: 'Cart',
              ),
              CuteNavButton(
                icon: CargicIcons.ninja_icon,
                text: 'Ninja',
              ),
              CuteNavButton(
                icon: CargicIcons.user_icon,
                text: 'Profile',
              ),
            ],
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                indexController();
              });
            },
          ),
        ),
      ),
    );
  }
}
