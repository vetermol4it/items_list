import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:items_list/common/di/init_di.dart';
import 'package:items_list/features/items_list/domain/bloc/items_list_cubit.dart';
import 'package:items_list/features/items_list/domain/bloc/items_list_state.dart';
import 'package:items_list/features/items_list/presentation/add_item_button.dart';
import 'package:items_list/features/items_list/presentation/empty_items_placeholder.dart';
import 'package:items_list/features/items_list/presentation/items_list.dart';
import 'package:items_list/ui_kit/styles/color_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _itemsListCubit = getIt<ItemsListCubit>();

  @override
  void initState() {
    _itemsListCubit.fetchItems();
    super.initState();
  }

  @override
  void dispose() {
    _itemsListCubit.close();
    super.dispose();
  }

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
          actions: [
            AddItemButton(
              onTap: () => _itemsListCubit.addItem(),
            ),
          ],
        ),
        body: BlocBuilder<ItemsListCubit, ItemsListState>(
          bloc: _itemsListCubit,
          builder: (context, state) {
            if (state is ItemsListReadyState) {
              if (state.items.isEmpty) {
                return const EmptyItemsPlaceholder();
              } else {
                return ItemsList(
                  items: state.items,
                  onItemDeleteButtonTap: (itemId) => context.read<ItemsListCubit>().deleteItem(itemId),
                );
              }
            }

            return Container(color: ColorStyles.backgroundColor);
          },
        ),
      ),
    );
  }
}
