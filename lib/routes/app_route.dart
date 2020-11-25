import 'package:cargic_user/screens/change_car_details_screens/add_new_vehicle_screen.dart';
import 'package:cargic_user/screens/change_car_details_screens/change_vehicle_screen.dart';
import 'package:cargic_user/screens/change_car_details_screens/choose_vehicle_pops_screen.dart';
import 'package:cargic_user/screens/payment_screens/add_cards_screen.dart';
import 'package:cargic_user/screens/payment_screens/cards_screen.dart';
import 'package:cargic_user/screens/bottom_nav_screens/home_screen.dart';
import 'package:cargic_user/screens/auth_screens/login_with_email_screen.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/screens/auth_screens/onboarding_screen.dart';
import 'package:cargic_user/screens/auth_screens/register_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> appRoute = {
  HomeScreen.id: (context) => HomeScreen(),
  NavigationScreen.id: (context) => NavigationScreen(),
  OnBoardingScreen.id: (context) => OnBoardingScreen(),
  LoginWithEmailScreen.id: (context) => LoginWithEmailScreen(),
  RegisterScreen.id: (context) => RegisterScreen(),
  CardScreen.id: (context) => CardScreen(),
  AddCards.id: (context) => AddCards(),
  AddVehicleScreen.id: (context) => AddVehicleScreen(),
  ChangeVehicleScreen.id: (context) => ChangeVehicleScreen(),
  ChooseVehiclePropsScreen.id: (context) => ChooseVehiclePropsScreen(),
};
