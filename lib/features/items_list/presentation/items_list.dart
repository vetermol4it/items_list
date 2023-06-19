import 'package:flutter/material.dart';
import 'package:items_list/features/items_list/domain/models/item.dart';
import 'package:items_list/features/items_list/presentation/item_card/item_card.dart';

class ItemsList extends StatelessWidget {
  final List<Item> items;
  final Function(int) onItemDeleteButtonTap;

  const ItemsList({
    Key? key,
    required this.items,
    required this.onItemDeleteButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) => ItemCard(
        item: items[index],
        onItemDeleteButtonTap: onItemDeleteButtonTap,
      ),
    );
  }
}
