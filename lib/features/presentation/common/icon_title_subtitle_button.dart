import 'package:flutter/material.dart';

import '../../../core/util/app_colors.dart';

class IconTitleSubtitleButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final Icon icon;
  final VoidCallback onPressed;

  const IconTitleSubtitleButton(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          icon,
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 18,
                fontWeight: FontWeight.w800),
          ),
          Text(
            subTitle,
            style: TextStyle(
                color: TColor.secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
