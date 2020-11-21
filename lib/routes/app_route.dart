import 'package:cargic_user/screens/home_screen.dart';
import 'package:cargic_user/screens/login_with_email_screen.dart';
import 'package:cargic_user/screens/navigation_screen.dart';
import 'package:cargic_user/screens/onboarding_screen.dart';
import 'package:cargic_user/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> appRoute = {
  HomeScreen.id: (context) => HomeScreen(),
  NavigationScreen.id: (context) => NavigationScreen(),
  OnBoardingScreen.id: (context) => OnBoardingScreen(),
  LoginWithEmailScreen.id: (context) => LoginWithEmailScreen(),
  RegisterScreen.id: (context) => RegisterScreen(),
};
