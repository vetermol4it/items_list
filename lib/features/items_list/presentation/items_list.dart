import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:items_list/common/di/init_di.dart';
import 'package:items_list/features/items_list/domain/bloc/items_list_cubit.dart';
import 'package:items_list/features/items_list/domain/bloc/items_list_state.dart';
import 'package:items_list/features/items_list/presentation/empty_items_placeholder.dart';
import 'package:items_list/features/items_list/presentation/item_card/item_card.dart';
import 'package:items_list/ui_kit/buttons/app_button.dart';
import 'package:items_list/ui_kit/styles/color_styles.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({
    super.key,
  });

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  final _cubit = getIt<ItemsListCubit>();

  @override
  void initState() {
    _cubit.fetchItems();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ItemsListCubit, ItemsListState>(
            bloc: _cubit,
            builder: (context, state) {
              if (state is ItemsListReadyState) {
                if (state.items.isEmpty) {
                  return const EmptyItemsPlaceholder();
                } else {
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.items.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                      item: state.items[index],
                      onItemDeleteButtonTap: (itemId) => _cubit.deleteItem(itemId),
                    ),
                  );
                }
              }

              return const SizedBox.expand();
            },
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          color: ColorStyles.secondaryBackgroundColor,
          child: AppButton(
            title: 'addItemButton'.tr(),
            onTap: () => _cubit.addItem(),
          ),
        )
      ],
    );
  }
}
