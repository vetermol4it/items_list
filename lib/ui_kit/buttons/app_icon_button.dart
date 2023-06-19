import 'package:flutter/material.dart';
import 'package:items_list/ui_kit/styles/color_styles.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        color: ColorStyles.buttonColor,
        child: Icon(
          icon,
          color: ColorStyles.textColor,
          size: 20,
        ),
      ),
    );
  }
}
