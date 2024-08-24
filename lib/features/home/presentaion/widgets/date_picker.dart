import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerr extends StatefulWidget {
   DatePickerr({super.key, required this.selectedDate});
   DateTime selectedDate;

  @override
  State<DatePickerr> createState() => _DatePickerrState();
}

class _DatePickerrState extends State<DatePickerr> {
 
  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      height: 100.h,
      width: 60.w,
      initialSelectedDate: DateTime.now(),
      selectionColor: const Color.fromARGB(255, 37, 77, 252),
      selectedTextColor: Colors.white,
      dateTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: widget.selectedDate == DateTime.now() ? Colors.white : Colors.grey,
      ),
      dayTextStyle: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: widget.selectedDate == DateTime.now() ? Colors.white : Colors.grey,
      ),
      monthTextStyle: TextStyle(
        fontSize: 8.sp,
        color: widget.selectedDate == DateTime.now() ? Colors.white : Colors.grey,
      ),
      onDateChange: (date) {
        setState(() {
          widget.selectedDate = date;
        });
      },
    );
    
  }
}
