import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_sqlflite/features/create_task_feature/presentation/views_modes/add_task_cubit/add_task_states.dart';

class AddTaskCubit extends Cubit<AddTaskStates> {
  AddTaskCubit() : super(AddTaskInitialState());

  static AddTaskCubit get(context) => BlocProvider.of(context);

  void getDateFromUser() {}
}
