import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:items_list/ui_kit/styles/color_styles.dart';

class EmptyItemsPlaceholder extends StatelessWidget {
  const EmptyItemsPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'emptyListPlaceholder'.tr(),
        style: const TextStyle(
          fontSize: 24,
          color: ColorStyles.textColor,
        ),
      ),
    );
  }
}
