import 'package:sqflite/sqflite.dart';

abstract class DatabaseConstants {
  static Future<String> get path async {
    String databasePath = await getDatabasesPath();
    return "$databasePath/task_manager.db";
  }

  static const String taskTableName = "tasks";

  static const String taskTitleColumnName = "title";
  static const String taskNoteColumnName = "note";
  static const String taskDateColumnName = "date";
  static const String taskStartTimeColumnName = "start_time";
  static const String taskEndTimeColumnName = "end_time";
  static const String taskRemindColumnName = "remind";
  static const String taskRepeatColumnName = "repeat";
  static const String taskColorColumnName = "color";
  static const String taskIsCompletedColumnName = "is_completed";
}
