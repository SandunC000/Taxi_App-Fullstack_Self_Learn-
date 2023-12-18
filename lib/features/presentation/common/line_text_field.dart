import 'package:flutter/material.dart';

class LineTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final TextEditingController? keyboardType;
  const LineTextField({super.key, required this.title, required this.hintText, this.controller, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
