import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_sqlflite/core/functions/navigate_to.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views/create_task_view.dart';

class AppBarAndAddTask extends StatefulWidget {
  const AppBarAndAddTask({super.key, required this.selectDate});
  final DateTime selectDate;

  @override
  State<AppBarAndAddTask> createState() => _AppBarAndAddTaskState();
}

class _AppBarAndAddTaskState extends State<AppBarAndAddTask> {
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MMMM d, yyyy').format(widget.selectDate);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedDate,
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
            SizedBox(height: 5.h),
            Text(
              'Today',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 45.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color.fromARGB(255, 37, 77, 252)),
              child: TextButton(
                onPressed: () => navigateTo(context, const CreateTaskView()),
                child: Center(
                  child: Text(
                    '+ Add Task',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
