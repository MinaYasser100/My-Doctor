// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrugModelAdapter extends TypeAdapter<DrugModel> {
  @override
  final int typeId = 0;

  @override
  DrugModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrugModel(
      setId: fields[0] as String?,
      splVersion: fields[1] as int?,
      publishedDate: fields[2] as String?,
      title: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DrugModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.setId)
      ..writeByte(1)
      ..write(obj.splVersion)
      ..writeByte(2)
      ..write(obj.publishedDate)
      ..writeByte(3)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrugModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
