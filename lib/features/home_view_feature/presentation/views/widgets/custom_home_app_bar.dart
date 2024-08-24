import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/dark_mode_cubit/dark_mode_cubit.dart';
import 'package:task_manager_sqlflite/features/home_view_feature/presentation/views_models/notification_cubit/notification_cubit.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.nightlight_round),
        onPressed: () async {
          BlocProvider.of<NotificationCubit>(context).displayNotification(
              title: "Theme changed",
              body: !DarkModeCubit.get(context).isDark ? "Dark" : "Light");
          await DarkModeCubit.get(context).changeThemeMode();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
        const SizedBox(
          width: 10.0,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
