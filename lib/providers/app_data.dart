import 'package:cargic_user/models/back_end_model/address_model.dart';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class AppData extends ChangeNotifier {
  //save user info
  String userName;
  String userEmail;
  String userPhone;
  String userID;
  getUserInfo({
    String name,
    String email,
    String phone,
    String iD,
  }) {
    userName = name;
    userEmail = email;
    userPhone = phone;
    userID = iD;
    notifyListeners();
  }

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

  //book for Later
  String bookTime;
  var bookDate;
  String bookTypeOfDay;
  saveBookLaterInfo({
    var date,
    String time,
    String dayType,
  }) {
    bookTime = time;
    bookDate = bookDate;
    bookTypeOfDay = dayType;
    notifyListeners();
  }

  //for services
  String serviceName;
  String servicePrice;
  String serviceType;
  String serviceDiscount = '';

  saveService({
    String name,
    String type,
    String price,
    String discount,
  }) {
    serviceName = name;
    servicePrice = price;
    serviceType = type;
    serviceDiscount = discount;
    notifyListeners();
  }

  //sned to database
  Map<String, dynamic> serviceReqMap;
  sendServiceRequest({
    String orderID,
    String status,
    //service details
    String serviceType,
    String serviceName,
    String date,
    String time,
    String formattedDate,
    String price,
    String serviceDiscount,
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
    double lat,
    double lng,
  }) {
    Map<String, dynamic> serviceReq = {
      "orderID": orderID,
      "serviceType": serviceType,
      "serviceName": serviceName,
      "date": date,
      "time": time,
      "formattedDate": formattedDate,
      "price": price,
      "serviceDiscount": serviceDiscount,
      "user": {
        "name": userName,
        "email": userEmail,
        "phone": userPhone,
        "address": userAddress,
        "lat": lat,
        "lng": lng,
      },
      "carDetails": {
        "vehicleType": vehicleType,
        "vehicleName": vehicleName,
        "vehicleModel": vehicleModel,
        "vehicleManufactureYear": vehicleManufactureYear,
        "vehicleFuelType": vehicleFuelType,
      },
      "status": status,
    };
    serviceReqMap = serviceReq;
    print(serviceReqMap);
    notifyListeners();
  }
}
