// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StateLocationAdapter extends TypeAdapter<StateLocation> {
  @override
  final int typeId = 1;

  @override
  StateLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StateLocation(
      locationname: fields[0] as String?,
      description: fields[1] as String,
      image: fields[2] as String,
      visitorInformation: (fields[3] as List).cast<VisitorInformation>(),
    );
  }

  @override
  void write(BinaryWriter writer, StateLocation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.locationname)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.visitorInformation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
