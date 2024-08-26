import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/data/model/task_model.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views/widgets/buttom.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/delete_tasks_cubit/delete_tasks_cubit.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/delete_tasks_cubit/delete_tasks_states.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/get_tasks_cubit/get_tasks_states.dart';

class BuildBottomSheet extends StatelessWidget {
  const BuildBottomSheet({
    super.key,
    required this.model,
  });
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DeleteTasksCubit()),
        BlocProvider(create: (context) => GetTasksCubit()),
      ],
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonSheetModel(
              onPressed: () => Navigator.pop(context),
              txt: "Task Completed",
              color: const Color.fromARGB(255, 37, 77, 252),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<DeleteTasksCubit, DeleteTasksStates>(
              builder: (context, state) =>
                  BlocBuilder<GetTasksCubit, GetTasksStates>(
                builder: (context, state) => ButtonSheetModel(
                  onPressed: () {
                    DeleteTasksCubit.get(context).deleteTask(task: model);
                    BlocProvider.of<GetTasksCubit>(context).getTasks();
                    Navigator.pop(context);
                  },
                  txt: "Delete Task",
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ButtonSheetModel(
              onPressed: () => Navigator.pop(context),
              txt: "Close",
              color: Colors.white,
              colorBorder: Colors.grey,
              colorTxt: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
