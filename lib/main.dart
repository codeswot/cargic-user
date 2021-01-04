import 'package:cargic_user/providers/app_data.dart';
import 'package:cargic_user/routes/app_route.dart';
import 'package:cargic_user/screens/auth_screens/onboarding_screen.dart';
import 'package:cargic_user/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:cargic_user/models/back_end_model/user_vehicle_model.dart';
import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    options: Platform.isIOS || Platform.isMacOS
        ? FirebaseOptions(
            appId: '1:420590701446:ios:2511b31141e5a860dd3a07',
            apiKey: 'AIzaSyCW54Ie6o_v9IYOHAjVSsKkPqQ_QZcTC4g',
            projectId: 'cargicapp',
            messagingSenderId: '420590701446',
            databaseURL: 'https://cargicapp.firebaseio.com',
          )
        : FirebaseOptions(
            appId: '1:420590701446:android:bc04a7c1609075bddd3a07',
            apiKey: 'AIzaSyDfHWBVIpzsSYpWWgeYRih4rKBppNk3LgE',
            messagingSenderId: '420590701446', //'297855924061',
            projectId: 'cargicapp',
            databaseURL: 'https://cargicapp.firebaseio.com',
          ),
  );
  print('fireBase App Name =>${app.name}');
  var appDir = await getApplicationDocumentsDirectory();
  var path = appDir.path;
  Hive.init(path);
  Hive.registerAdapter(UserVehicleAdapter());
  var box = await Hive.openBox('vehicle-box');
  print(box.name);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Cargic',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            // centerTitle: false,
            textTheme: TextTheme(
                headline6: TextStyle(
              color: CargicColors.hoodwinkGrey,
              fontWeight: FontWeight.w600,
            )),
            color: CargicColors.plainWhite,
            iconTheme: IconThemeData(
              color: CargicColors.smoothGray,
              size: 39.0,
            ),
          ),
          primaryColor: CargicColors.brandBlue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Niramit',
        ),
        //TODO: check if userLogin is available // HomeScreen or OnBoardingScreen
        initialRoute: OnBoardingScreen.id,
        routes: appRoute,
      ),
    );
  }
}
