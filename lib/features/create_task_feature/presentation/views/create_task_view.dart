import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views/widgets/create_task_view_body.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views/widgets/custom_task_view_app_bar.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views_modes/add_task_cubit/add_task_cubit.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTaskViewAppBar(),
      body: BlocProvider(
        create: (context) => AddTaskCubit(),
        child: const CreateTaskViewBody(),
      ),
    );
  }
}
