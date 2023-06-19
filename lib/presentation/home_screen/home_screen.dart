import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:items_list/common/di/init_di.dart';
import 'package:items_list/domain/bloc/items_list_cubit.dart';
import 'package:items_list/domain/bloc/items_list_state.dart';
import 'package:items_list/presentation/home_screen/widgets/custom_button.dart';
import 'package:items_list/presentation/home_screen/widgets/item_card.dart';
import 'package:items_list/presentation/styles/color_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: CustomButton(
                icon: Icons.add,
                onTap: () => _itemsListCubit.addItem(),
              ),
            )
          ],
        ),
        body: BlocProvider.value(
          value: _itemsListCubit,
          child: const _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsListCubit, ItemsListState>(
      builder: (context, state) {
        if (state is ItemsListReadyState) {
          if (state.items.isEmpty) {
            return Center(
              child: Text(
                'emptyListPlaceholder'.tr(),
                style: const TextStyle(
                  fontSize: 24,
                  color: ColorStyles.textColor,
                ),
              ),
            );
          } else {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => ItemCard(
                item: state.items[index],
              ),
            );
          }
        } else {
          return Container(color: ColorStyles.backgroundColor);
        }
      },
    );
  }
}
