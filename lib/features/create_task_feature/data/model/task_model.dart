// enum Remind {
//   Five_minutes_earlier,
//   ten_minutes_earlier,
//   fifteen_minutes_earlier,
//   twenty_minutes_earlier
// }

// enum Repeat { none, daily, weekly, monthly }

import 'package:task_manager_sqlflite/core/database_sevice/database_constants.dart';

class TaskModel {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  TaskModel({
    this.id,
    required this.title,
    required this.note,
    required this.isCompleted,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.remind,
    required this.repeat,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      DatabaseConstants.taskTitleColumnName: title,
      DatabaseConstants.taskNoteColumnName: note,
      DatabaseConstants.taskDateColumnName: date,
      DatabaseConstants.taskStartTimeColumnName: startTime,
      DatabaseConstants.taskEndTimeColumnName: endTime,
      DatabaseConstants.taskRemindColumnName: remind,
      DatabaseConstants.taskRepeatColumnName: repeat,
      DatabaseConstants.taskColorColumnName: color,
      DatabaseConstants.taskIsCompletedColumnName: isCompleted
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map[DatabaseConstants.taskTitleColumnName],
      note: map[DatabaseConstants.taskNoteColumnName],
      isCompleted: map[DatabaseConstants.taskIsCompletedColumnName],
      date: map[DatabaseConstants.taskDateColumnName],
      startTime: map[DatabaseConstants.taskStartTimeColumnName],
      endTime: map[DatabaseConstants.taskEndTimeColumnName],
      remind: map[DatabaseConstants.taskRemindColumnName],
      repeat: map[DatabaseConstants.taskRepeatColumnName],
      color: map[DatabaseConstants.taskColorColumnName],
    );
  }
// //transfer remind to string

//   static Remind? _parseRemind(String? remind) {
//     switch (remind) {
//       case 'fiveMinutesEarlier':
//         return Remind.Five_minutes_earlier;
//       case 'tenMinutesEarlier':
//         return Remind.ten_minutes_earlier;
//       case 'fifteenMinutesEarlier':
//         return Remind.fifteen_minutes_earlier;
//       case 'twentyMinutesEarlier':
//         return Remind.twenty_minutes_earlier;
//       default:
//         return null;
//     }
//   }

//transfer repeat to string
  // static Repeat? _parseRepeat(String? repeat) {
  //   switch (repeat) {
  //     case 'none':
  //       return Repeat.none;
  //     case 'daily':
  //       return Repeat.daily;
  //     case 'weekly':
  //       return Repeat.weekly;
  //     case 'monthly':
  //       return Repeat.monthly;
  //     default:
  //       return null;
  //   }
  // }

  @override
  String toString() {
    return 'TaskModel(title: $title, note: $note, time: $date, start_time: $startTime, end_time: $endTime, remind: $remind, repeat: $repeat)';
  }
}
