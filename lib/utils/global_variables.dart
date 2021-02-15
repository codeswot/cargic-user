import 'package:cargic_user/models/back_end_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';

String nigerianCurrency = '₦';
int cartItemMock = 99;
User currentFirebaseUser;
Position currentPosition;

UserModel currentUserInfo;
String serverToken =
    'AAAAYe0oy4Y:APA91bHKoyn0qhaaIk5Dr2DtsWEKlOG7_8EE2YpM0kTOTNxA8KWRxaXDfvQ9-rOHJ9IuCtHPfMPRz5BmQjRdBP3GoUAxVRqDk3rl5EY-iNr8zIb8_x9uYdCuaVkB3vh3TMMV4L1bRzls';
