

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class StatusDatabase{
  StatusDatabase._privateConstructor();
  static final StatusDatabase instance = StatusDatabase._privateConstructor();
  static Database? statusDatabase;
  static const statusDatabaseName = "tap_to_sync_db";
  static const statusTableName = 'TapSync';
  static const statusTableId = "tapSyncTableId";
  static const statusDateTime = "statusDateTime";
  static const statusRandomNumber = "statusRandomNumber";
  static const statusSeconds = "statusSeconds";
  static const tapStatus = 'tapSyncStatus';

  Future<Database> get database async => statusDatabase ??= await createDatabase();

  Future<Database> createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, '$statusDatabaseName');
    var database = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return database;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $statusTableName ($statusTableId INTEGER PRIMARY KEY AUTOINCREMENT,$statusDateTime TEXT,$statusRandomNumber INTEGER,$statusSeconds INTEGER,$tapStatus INTEGER)");
    print("Created tables");
  }

  Future<int> saveRecords(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(statusTableName, row);
  }

  Future<List<Map<String,dynamic>>> getAllRecords(int selectedGameMode) async{
    Database db = await instance.database;
    if(selectedGameMode==1){
      return await db.rawQuery('SELECT * FROM $statusTableName WHERE $tapStatus = 1 ORDER BY $statusTableId DESC');
    }
    else if(selectedGameMode == 2){
      return await db.rawQuery('SELECT * FROM $statusTableName WHERE $tapStatus = 2 ORDER BY $statusTableId DESC');
    }
    else{
      return await db.rawQuery('SELECT * FROM $statusTableName ORDER BY $statusTableId DESC');
    }
  }

}