import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonSheetModel extends StatelessWidget {
  const ButtonSheetModel({super.key, required this.txt, required this.color, this.colorBorder, this.colorTxt});
  final String txt;
  final Color color;
  final Color? colorBorder;
  final Color? colorTxt;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: colorBorder ?? color, width: 1.w),
        ),
        child: TextButton(
            onPressed: () {
               Navigator.of(context).pop();
            },
            child: Text(
              txt,
              style: TextStyle(color:colorTxt ?? Colors.white, fontSize: 15.sp),
            )));
  }
}
