import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RoundButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.maxFinite,
      elevation: 0,
      color: TColor.primary,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
          child: Text(title,
              style: TextStyle(
                color: TColor.primaryTextW,
                fontSize: 16,
              ))),
    );
  }
}
