import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_manager_sqlflite/features/home/presentaion/widgets/buttom.dart';

class TodolIstviewItem extends StatelessWidget {
  const TodolIstviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(0.r),
              ),
            ),
            builder: (context) => _buildBottomSheet(context),
          );
        },
        child: Container(
          padding: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color.fromARGB(255, 37, 77, 252),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  'Learn Flutter',
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.clock,
                      size: 15,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.w),
                    const Text(
                      '9:00 PM - 9.59 PM',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                const Text(
                  'We must learn flutter to improve our skills',
                  style: TextStyle(color: Colors.white),
                ),
              ]),
              const Spacer(),
              Container(
                width: 1.w,
                height: 50.h,
                color: Colors.white,
              ),
              SizedBox(width: 10.w),
              Transform.rotate(
                angle: -1.5708,
                child:
                    const Text('Todo', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ButtonSheetModel(
              txt: "Task Completed", color: Color.fromARGB(255, 37, 77, 252)),
          SizedBox(height: 10.h),
          const ButtonSheetModel(txt: "Delete Task", color: Colors.red),
          SizedBox(height: 20.h),
          const ButtonSheetModel(
            txt: "Close",
            color: Colors.white,
            colorBorder: Colors.grey,
            colorTxt:Colors.black,
          ),
        ],
      ),
    );
  }
}
