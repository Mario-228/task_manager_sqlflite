import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views/widgets/buttom.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            colorTxt: Colors.black,
          ),
        ],
      ),
    );
  }
}
