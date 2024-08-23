import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class DatePicackerr extends StatefulWidget {
  const DatePicackerr({super.key});

  @override
  State<DatePicackerr> createState() => _DatePicackerState();
}

class _DatePicackerState extends State<DatePicackerr> {
  DateTime _selectedDate = DateTime.now(); // Keep track of the selected date

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        // Center the DatePicker widget horizontally
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: DatePicker(
            DateTime.now(),
            height: 100,
            width: 68,
            initialSelectedDate: _selectedDate,
            selectionColor: const Color.fromARGB(221, 84, 150, 243),
            selectedTextColor: Colors.white,
            dateTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color:
                  _selectedDate == DateTime.now() ? Colors.white : Colors.grey,
            ),
            dayTextStyle: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w100,
              color:
                  _selectedDate == DateTime.now() ? Colors.white : Colors.grey,
            ),
            monthTextStyle: TextStyle(
              fontSize: 8,
              color:
                  _selectedDate == DateTime.now() ? Colors.white : Colors.grey,
            ),
            onDateChange: (date) {
              // Handle the date change here
              setState(() {
                _selectedDate = date;
              });
            },
          ),
        ),
      ),
    );
  }
}
