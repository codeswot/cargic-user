import 'package:cargic_user/models/back_end_model/address_model.dart';
import 'package:flutter/foundation.dart';

class AppData extends ChangeNotifier {
  //save user info
  updateUserInfo() {}
  //for location
  // double locationLng;
  // double locationLat;
  Address userAdress;

  updateUserAddress(Address address) async {
    userAdress = address;
    notifyListeners();
  }
  //for car details
}
