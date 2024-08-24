import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_sqlflite/features/home/presentaion/widgets/todo_listview/todol_istview_item.dart';

class TodoListview extends StatelessWidget {
  const TodoListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
      return Padding(
        padding:  EdgeInsets.only(bottom: 10.h),
        child: const TodolIstviewItem(),
      );
    });
  }
}