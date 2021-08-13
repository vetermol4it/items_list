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
    return SizedBox(
      width: 32,
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black87,
          padding: EdgeInsets.zero,
          backgroundColor: ColorStyles.buttonColor,
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
