import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_sqlflite/core/database_sevice/database_constants.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/data/model/task_model.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await intialDatabase();
      return _database;
    }
  }

  static Future<Database> intialDatabase() async {
    Database db = await openDatabase(await DatabaseConstants.path,
        version: 1, onCreate: onCreate);
    return db;
  }

  static FutureOr<void> onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE ${DatabaseConstants.taskTableName} 
        (id INTEGER PRIMARY KEY,
         ${DatabaseConstants.taskTitleColumnName} TEXT,
          ${DatabaseConstants.taskNoteColumnName} TEXT ,
           ${DatabaseConstants.taskDateColumnName} TEXT ,
            ${DatabaseConstants.taskStartTimeColumnName} TEXT ,
             ${DatabaseConstants.taskEndTimeColumnName} TEXT ,
              ${DatabaseConstants.taskRemindColumnName} INTEGER ,
               ${DatabaseConstants.taskRepeatColumnName} TEXT ,
                ${DatabaseConstants.taskColorColumnName} INTEGER ,
                 ${DatabaseConstants.taskIsCompletedColumnName} INTEGER );''');

    print("database created");
  }

  static Future<int> insertData(TaskModel task) async {
    Database? db = await database;
    return db!.insert(DatabaseConstants.taskTableName, task.toMap());
  }

  static Future<int> updateData(TaskModel model) async {
    Database? db = await database;
    return db!.update(DatabaseConstants.taskTableName, model.toMap(),
        where: 'id=${model.id}');
  }

  static Future<int> deleteData(TaskModel task) async {
    Database? db = await database;
    return db!.delete(DatabaseConstants.taskTableName, where: "id=${task.id}");
  }

  static Future<List<Map<String, Object?>>> getData(String query) async {
    Database? db = await database;
    return db!.rawQuery(query);
  }
}
