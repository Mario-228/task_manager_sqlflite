import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_sqlflite/core/cache_helper/cache_helper.dart';
import 'package:task_manager_sqlflite/core/constants/constants.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/dark_mode_cubit/dark_mode_states.dart';

class DarkModeCubit extends Cubit<DarkModeStates> {
  DarkModeCubit() : super(DarkModeInitialState());
  static DarkModeCubit get(context) => BlocProvider.of(context);
  bool isDark = CacheHelper.getData(Constants.isDark) as bool;

  Future<void> changeThemeMode() async {
    isDark = !isDark;
    await CacheHelper.setData(Constants.isDark, isDark);
    emit(DarkModeChangeState(isDark: isDark));
  }
}
