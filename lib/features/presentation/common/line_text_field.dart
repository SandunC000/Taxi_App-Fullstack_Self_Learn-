import 'package:flutter/material.dart';
import 'package:taxi_app/core/util/app_colors.dart';

class LineTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? right;

  const LineTextField(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller,
      this.keyboardType,
      required this.obscureText,
      this.right});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: TColor.primaryText, fontSize: 16),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            style: TextStyle(color: TColor.primaryText, fontSize: 18),
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              suffixIcon: right,
              hintStyle: TextStyle(
                color: TColor.placeholder,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
