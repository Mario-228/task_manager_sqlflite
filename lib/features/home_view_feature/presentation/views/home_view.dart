import 'package:flutter/material.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomHomeAppBar(),
      body: SplashViewBody(),
    );
  }
}
