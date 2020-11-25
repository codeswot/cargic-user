import 'package:cargic_user/screens/payment_screens/add_cards_screen.dart';
import 'package:cargic_user/screens/payment_screens/cards_screen.dart';
import 'package:cargic_user/screens/bottom_nav_screens/home_screen.dart';
import 'package:cargic_user/screens/side_nav/login_with_email_screen.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/screens/side_nav/onboarding_screen.dart';
import 'package:cargic_user/screens/side_nav/register_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> appRoute = {
  HomeScreen.id: (context) => HomeScreen(),
  NavigationScreen.id: (context) => NavigationScreen(),
  OnBoardingScreen.id: (context) => OnBoardingScreen(),
  LoginWithEmailScreen.id: (context) => LoginWithEmailScreen(),
  RegisterScreen.id: (context) => RegisterScreen(),
  CardScreen.id: (context) => CardScreen(),
  AddCards.id: (context) => AddCards(),
};
