import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/data/model/task_model.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views/widgets/todo_listview/build_bottom_sheet.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views/widgets/todo_listview/task_details.dart';

class TodolIstviewItem extends StatelessWidget {
  const TodolIstviewItem({super.key, required this.model});
  final TaskModel model;
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
            builder: (context) => BuildBottomSheet(
              model: model,
            ),
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
              TaskDetails(
                  title: model.title!,
                  time: "${model.startTime} - ${model.endTime}",
                  description: model.note!),
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
}
