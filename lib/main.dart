import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_sqlflite/features/home/presentaion/home.dart';
import 'package:task_manager_sqlflite/features/splash_view_feature/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
    
      designSize:  const Size(360, 690),
      child:  MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
}
}