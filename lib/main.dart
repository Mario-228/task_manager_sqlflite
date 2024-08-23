import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager_sqlflite/features/login/presentation/login.dart';
//import 'package:task_manager_sqlflite/features/login/presentation/widgets/DataPicker.dart';

//import 'package:task_manager_sqlflite/features/splash_view_feature/presentation/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login page',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const DatePicackerr(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
