import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 0)
class Database extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? price;
  @HiveField(3)
  String? namePrice;
  @HiveField(4)
  String? date;
}

@HiveType(typeId: 1)
class DatabasePengeluaran extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? price;
  @HiveField(3)
  String? namePrice;
  @HiveField(4)
  String? date;
}
@HiveType(typeId: 2)
class DataCurrency extends HiveObject {
  @HiveField(0)
  String? nameCurency;
}

class DatabaseManager {
  static Box<Database> getAllDatabase() => Hive.box<Database>('database');
  static Box<DatabasePengeluaran> getAllDatabasePengeluaran() =>
      Hive.box<DatabasePengeluaran>('database_pengeluaran');
  static Box<DataCurrency> getDataCurrency() => Hive.box('data_currency');
}
