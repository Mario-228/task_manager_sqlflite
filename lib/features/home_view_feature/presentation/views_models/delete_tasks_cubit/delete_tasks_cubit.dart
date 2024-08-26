import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_sqlflite/core/database_sevice/database_helper.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/data/model/task_model.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/delete_tasks_cubit/delete_tasks_states.dart';

class DeleteTasksCubit extends Cubit<DeleteTasksStates> {
  DeleteTasksCubit() : super(DeleteTasksInitialState());
  static DeleteTasksCubit get(context) => BlocProvider.of(context);
  void deleteTask({required TaskModel task}) {
    emit(DeleteTasksLoadingState());
    DatabaseHelper.deleteData(task).then((value) {
      emit(DeleteTasksSuccessState(id: value));
    }).catchError((error) {
      emit(DeleteTasksErrorState(message: error.toString()));
    });
  }
}
