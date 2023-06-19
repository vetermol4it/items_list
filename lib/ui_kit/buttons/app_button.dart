import 'package:flutter/material.dart';
import 'package:items_list/ui_kit/styles/color_styles.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorStyles.buttonColor,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: ColorStyles.textColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
