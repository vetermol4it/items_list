import 'package:flutter/material.dart';
import 'package:items_list/ui_kit/styles/color_styles.dart';

class ItemCardTitle extends StatelessWidget {
  final String title;

  const ItemCardTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: ColorStyles.textColor,
        ),
      ),
    );
  }
}
