import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_sqlflite/features/home/presentaion/widgets/app_bar_and_add_task.dart';
import 'package:task_manager_sqlflite/features/home/presentaion/widgets/date_picker.dart';
import 'package:task_manager_sqlflite/features/home/presentaion/widgets/todo_listview/todo_listview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DateTime _selectedDate = DateTime.now();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 AppBarAndAddTask(selectDate:_selectedDate,),
                SizedBox(height: 10.h),
                DatePickerr(
                  selectedDate: _selectedDate,
                ),
                SizedBox(height: 10.h),
                const TodoListview()
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
