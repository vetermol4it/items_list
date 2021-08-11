import 'package:flutter/material.dart';
import 'package:items_list/presentation/styles/color_styles.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CustomButton({Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: ColorStyles.buttonColor,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black87,
          padding: EdgeInsets.zero,
        ),
        onPressed: onTap,
        child: Icon(
          icon,
          color: ColorStyles.textColor,
          size: 20,
        ),
      ),
    );
  }
}
