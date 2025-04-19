// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StateModelAdapter extends TypeAdapter<StateModel> {
  @override
  final int typeId = 0;

  @override
  StateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StateModel(
      stateName: fields[0] as String,
      imageUrl: fields[1] as String?,
      stateDescription: fields[2] as String?,
      locations: (fields[3] as List).cast<StateLocation>(),
    );
  }

  @override
  void write(BinaryWriter writer, StateModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.stateName)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.stateDescription)
      ..writeByte(3)
      ..write(obj.locations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
