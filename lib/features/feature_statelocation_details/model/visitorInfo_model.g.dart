// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitorInfo_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitorInformationAdapter extends TypeAdapter<VisitorInformation> {
  @override
  final int typeId = 2;

  @override
  VisitorInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitorInformation(
      address: fields[0] as String?,
      openingHours: fields[1] as String?,
      entryFee: fields[2] as String?,
      contactInformation: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VisitorInformation obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.openingHours)
      ..writeByte(2)
      ..write(obj.entryFee)
      ..writeByte(3)
      ..write(obj.contactInformation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitorInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
