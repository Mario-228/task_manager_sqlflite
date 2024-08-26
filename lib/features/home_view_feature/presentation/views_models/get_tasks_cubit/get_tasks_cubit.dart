import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_sqlflite/core/database_sevice/database_helper.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/data/model/task_model.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/get_tasks_cubit/get_tasks_states.dart';

class GetTasksCubit extends Cubit<GetTasksStates> {
  GetTasksCubit() : super(GetTasksInitialState());

  static GetTasksCubit get(context) => BlocProvider.of(context);
  List<TaskModel> tasks = [];

  void getTasks() async {
    emit(GetTasksLoadingState());
    DatabaseHelper.getData("select * from tasks").then((value) {
      tasks.addAll(value.map((e) => TaskModel.fromMap(e)));
      emit(GetTasksSuccessState(tasks: tasks));
    }).catchError((error) {
      emit(GetTasksErrorState(message: error.toString()));
    });
  }
}
