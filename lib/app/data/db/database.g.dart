// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabaseAdapter extends TypeAdapter<Database> {
  @override
  final int typeId = 0;

  @override
  Database read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Database()
      ..id = fields[0] as int?
      ..name = fields[1] as String?
      ..price = fields[2] as int?
      ..namePrice = fields[3] as String?
      ..date = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, Database obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.namePrice)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DatabasePengeluaranAdapter extends TypeAdapter<DatabasePengeluaran> {
  @override
  final int typeId = 1;

  @override
  DatabasePengeluaran read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabasePengeluaran()
      ..id = fields[0] as int?
      ..name = fields[1] as String?
      ..price = fields[2] as int?
      ..namePrice = fields[3] as String?
      ..date = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, DatabasePengeluaran obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.namePrice)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabasePengeluaranAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataCurrencyAdapter extends TypeAdapter<DataCurrency> {
  @override
  final int typeId = 2;

  @override
  DataCurrency read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataCurrency()..nameCurency = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, DataCurrency obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.nameCurency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataCurrencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
