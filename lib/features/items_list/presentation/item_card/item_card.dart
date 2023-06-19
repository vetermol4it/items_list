import 'package:flutter/material.dart';
import 'package:items_list/features/items_list/domain/models/item.dart';
import 'package:items_list/features/items_list/presentation/item_card/item_card_image.dart';
import 'package:items_list/features/items_list/presentation/item_card/item_card_title.dart';
import 'package:items_list/ui_kit/buttons/app_icon_button.dart';
import 'package:items_list/ui_kit/styles/color_styles.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final Function(String) onItemDeleteButtonTap;

  const ItemCard({
    super.key,
    required this.item,
    required this.onItemDeleteButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.width / 2,
      color: ColorStyles.backgroundColor,
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: ItemCardTitle(title: item.title),
          ),
          Align(
            alignment: Alignment.topRight,
            child: AppIconButton(
              icon: Icons.delete_outline,
              onTap: () => onItemDeleteButtonTap(item.id),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ItemCardImage(imageUrl: item.imageUrl),
          )
        ],
      ),
    );
  }
}
