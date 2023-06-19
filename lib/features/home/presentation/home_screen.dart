import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:items_list/features/items_list/presentation/items_list.dart';
import 'package:items_list/ui_kit/styles/color_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorStyles.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorStyles.backgroundColor,
          title: Text(
            'homeScreenTitle'.tr(),
            style: const TextStyle(
              color: ColorStyles.textColor,
              fontSize: 20,
            ),
          ),
        ),
        body: const ItemsList(),
      ),
    );
  }
}
