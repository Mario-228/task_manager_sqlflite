import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.nightlight_round),
        onPressed: () {},
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
