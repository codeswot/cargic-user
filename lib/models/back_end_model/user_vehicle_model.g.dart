// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vehicle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserVehicleAdapter extends TypeAdapter<UserVehicle> {
  @override
  final int typeId = 0;

  @override
  UserVehicle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserVehicle(
      name: fields[1] as String,
      model: fields[2] as String,
      type: fields[0] as String,
      fuel: fields[4] as String,
      year: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserVehicle obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.fuel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserVehicleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
