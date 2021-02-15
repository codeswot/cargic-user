import 'package:cargic_user/models/back_end_model/nearby_ninjas.dart';

class FireHelper {
  static List<NearbyNinjas> nearbyNinjaList = [];
  removeFromList({String key}) {
    int index = nearbyNinjaList.indexWhere((element) => element.key == key);
    nearbyNinjaList.removeAt(index);
  }

  updateNearbyNinjas(NearbyNinjas ninja) {
    int index =
        nearbyNinjaList.indexWhere((element) => element.key == ninja.key);
    nearbyNinjaList[index].longitude = ninja.longitude;
    nearbyNinjaList[index].latitude = ninja.latitude;
  }
}
//
