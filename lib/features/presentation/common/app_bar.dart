import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backArrow;

  const MyAppBar({
    super.key,
    required this.title,
    required this.backArrow,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: backArrow? IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ) : null,
      centerTitle: true,
      title: Text(title,
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 25,
              fontWeight: FontWeight.w800)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
