import 'package:hive/hive.dart';

part 'user_vehicle_model.g.dart';

@HiveType()
class UserVehicle {
  @HiveField(0)
  final String type; //eg truck

  @HiveField(1)
  final String name; //eg honda

  @HiveField(2)
  final String model; //eg honda city

  @HiveField(3)
  final String year; //eg 2012

  @HiveField(4)
  final String fuel; //eg petrol

  UserVehicle({this.name, this.model, this.type, this.fuel, this.year});
}
