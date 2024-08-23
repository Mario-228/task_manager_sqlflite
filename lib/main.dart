import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_sqlflite/core/cache_helper/cache_helper.dart';
import 'package:task_manager_sqlflite/core/constants/constants.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views/home_view.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/dark_mode_cubit/dark_mode_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  if (CacheHelper.getData(Constants.isDark) == null) {
    await CacheHelper.setData(Constants.isDark, false);
  }
  runApp(
    BlocProvider(
      create: (context) => DarkModeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, DarkModeStates>(
      builder: (context, state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: DarkModeCubit.get(context).isDark
            ? ThemeMode.dark
            : ThemeMode.light,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        home: const HomeView(),
      ),
    );
  }
}
