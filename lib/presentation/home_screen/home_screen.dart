import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:items_list/main.dart';

import 'package:items_list/domain/bloc/item_generator_bloc.dart';

import 'package:items_list/presentation/styles/color_styles.dart';
import 'package:items_list/presentation/home_screen/widgets/custom_button.dart';
import 'package:items_list/presentation/home_screen/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _itemGeneratorBloc = getIt<ItemGeneratorBloc>();

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
                onTap: ()=> _itemGeneratorBloc.add(
                  ItemGeneratorBlocAddItemEvent(),
                ),
              ),
            )
          ],
        ),
        body: const _Body(),
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

  final _itemGeneratorBloc = getIt<ItemGeneratorBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _itemGeneratorBloc,
      builder: (context, state) {
        if (state is ItemGeneratorBlocReadyState) {
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


