import 'package:cargic_user/models/back_end_model/address_model.dart';
import 'package:cargic_user/models/back_end_model/user_vehicle_model.dart';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

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
  String vType;
  String vName;
  String vModel;
  String vYear;
  String vFuel;
  updateUserVehicle({String key, String value}) async {
    var box = await Hive.openBox('user-vehicle-box');
    // box.add(vehicle);
    box.put('$key', value);

    vType = box.get('type');
    vName = box.get('name');
    vModel = box.get('model');
    vYear = box.get('year');
    vFuel = box.get('fuel');

    // box.put('name', value.name);
    // box.put('model', value.model);
    // box.put('year', value.year);
    // box.put('fuel', value.fuel);

    notifyListeners();
  }
}
