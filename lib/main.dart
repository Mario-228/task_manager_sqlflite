import 'package:flutter/material.dart';
import 'package:task_manager_sqlflite/core/cache_helper/cache_helper.dart';
import 'package:task_manager_sqlflite/core/constants/constants.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await CacheHelper.setData(Constants.isDark, false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = CacheHelper.getData(Constants.isDark) as bool;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const HomeView(),
    );
  }
}
