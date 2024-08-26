import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_sqlflite/core/database_sevice/database_helper.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/data/model/task_model.dart';
import 'package:task_manager_sqlflite/features/database_services_cubit/database_services_states.dart';

class DatabaseServicesCubit extends Cubit<DatabaseServicesStates> {
  DatabaseServicesCubit() : super(DatabaseServicesInitial());

  static DatabaseServicesCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  void setColorIndex(int index) {
    selectedIndex = index;
    emit(AddTaskColorState());
  }

  //insert tasks
  Future<void> addTask(TaskModel model) async {
    emit(AddTaskLoadingState());
    DatabaseHelper.insertData(model).then((value) {
      getTasks();
      emit(AddTaskSuccessState(rowIndex: value));
    }).catchError((error) {
      emit(AddTaskErrorState(message: error.toString()));
    });
  }

  //get tasks
  List<TaskModel> tasks = [];

  void getTasks() async {
    DatabaseHelper.getData("select * from tasks").then((value) {
      tasks.clear();
      tasks.addAll(value.map((e) => TaskModel.fromMap(e)));
      emit(GetTasksSuccessState(tasks: tasks));
    }).catchError((error) {
      emit(GetTasksErrorState(message: error.toString()));
    });
  }

  //delete tasks
  void deleteTask({required TaskModel task}) {
    emit(DeleteTasksLoadingState());
    DatabaseHelper.deleteData(task).then((value) {
      getTasks();
      emit(DeleteTasksSuccessState(id: value));
    }).catchError((error) {
      emit(DeleteTasksErrorState(message: error.toString()));
    });
  }

  void updateTask({required TaskModel task}) {
    emit(UpdateTaskLoadingState());
    DatabaseHelper.updateData(task).then((value) {
      getTasks();
      emit(UpdateTaskSuccessState());
    }).catchError((error) {
      emit(UpdateTaskErrorState(message: error.toString()));
    });
  }

  DateTime selectedDate = DateTime.now();
  void setDate({required DateTime date}) {
    selectedDate = date;
    getTasks();
    emit(const SetDateState());
  }
}
