import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_sqlflite/core/styles/styles.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views_modes/add_task_cubit/add_task_cubit.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views_modes/add_task_cubit/add_task_states.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<Color> colors = [
      Colors.blueAccent,
      Colors.red,
      Color.fromARGB(255, 210, 189, 0),
    ];
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Color", style: Styles.textStyle18),
            SizedBox(height: 10.h),
            BlocBuilder<AddTaskCubit, AddTaskStates>(
              builder: (context, state) => Row(
                children: List<Widget>.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        AddTaskCubit.get(context).setColorIndex(index);
                      },
                      child: CircleAvatar(
                        radius: 14.r,
                        backgroundColor: colors[index],
                        child: AddTaskCubit.get(context).selectedIndex == index
                            ? const Icon(
                                Icons.done,
                              )
                            : null,
                      ),
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
