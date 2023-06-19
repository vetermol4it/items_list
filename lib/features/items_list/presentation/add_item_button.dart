import 'package:flutter/material.dart';
import 'package:items_list/ui_kit/buttons/app_button.dart';

class AddItemButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddItemButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: AppButton(
        icon: Icons.add,
        onTap: onTap,
      ),
    );
  }
}
