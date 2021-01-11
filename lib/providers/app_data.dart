import 'package:cargic_user/models/back_end_model/address_model.dart';

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

    notifyListeners();
  }

  //for services
  String serviceName;
  String servicePrice;
  String serviceType;
  saveService({String name, String type, String price}) {
    notifyListeners();
  }

  //sned to database
  Map<String, dynamic> serviceReqMap;
  sendServiceRequest({
    //service details
    String serviceType,
    String serviceName,
    String date,
    String time,
    String price,
    //user details
    String userName,
    String userEmail,
    String userPhone,
    String userAddress,
    //car details
    String vehicleType,
    String vehicleName,
    String vehicleModel,
    String vehicleManufactureYear,
    String vehicleFuelType,
  }) {
    Map<String, dynamic> serviceReq = {
      "serviceType": serviceType,
      "serviceName": serviceName,
      "date": date,
      "time": time,
      "price": price,
      "user": {
        "name": userName,
        "email": userEmail,
        "phone": userPhone,
        "address": userAddress,
      },
      "carDetails": {
        "vehicleType": vehicleType,
        "vehicleName": vehicleName,
        "vehicleModel": vehicleModel,
        "vehicleManufactureYear": vehicleManufactureYear,
        "vehicleFuelType": vehicleFuelType,
      },
    };
    serviceReqMap = serviceReq;
    notifyListeners();
  }
}
