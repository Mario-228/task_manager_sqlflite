import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AppBarAndAddTask extends StatefulWidget {
  const AppBarAndAddTask({super.key, required this.selectDate});
  final  DateTime selectDate;

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
            const Icon(FontAwesomeIcons.moon),
            SizedBox(height: 5.h),
            Text(
              formattedDate,
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
            SizedBox(height: 5.h),
            Text(
              'Today',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: const NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp0yV6t8Z9z0a6qI0oN1mCmZdX5rHf6mB2uQ&usqp=CAU'),
            ),
            SizedBox(height: 8.h),
            Container(
              height: 45.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color.fromARGB(255, 37, 77, 252)),
              child: TextButton(
                onPressed: () {
                  
                },
                
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
