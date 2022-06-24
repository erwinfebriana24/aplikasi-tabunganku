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
}

class DatabaseManager {
  static Box<Database> getAllDatabase() => Hive.box<Database>('database');
  static Box<DatabasePengeluaran> getAllDatabasePengeluaran() =>
      Hive.box<DatabasePengeluaran>('database_pengeluaran');
}
