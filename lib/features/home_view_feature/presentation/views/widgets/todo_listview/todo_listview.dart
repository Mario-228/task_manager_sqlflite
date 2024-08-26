import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views/widgets/todo_listview/todol_istview_item.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/get_tasks_cubit/get_tasks_states.dart';

class TodoListview extends StatelessWidget {
  const TodoListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTasksCubit, GetTasksStates>(
      builder: (context, state) {
        if (state is GetTasksSuccessState) {
          return ListView.builder(
              itemCount: state.tasks.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: TodolIstviewItem(model: state.tasks[index]),
                );
              });
        } else if (state is GetTasksErrorState) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
