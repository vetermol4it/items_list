import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:items_list/domain/bloc/item_generator_bloc.dart';
import 'package:items_list/domain/models/item.dart';

import 'package:items_list/internal/dependencies/item_ganerator_module.dart';
import 'package:items_list/presentation/home_screen/widgets/custom_button.dart';
import 'package:items_list/presentation/home_screen/widgets/item_card.dart';
import 'package:items_list/presentation/styles/app_icons.dart';

import 'package:items_list/presentation/styles/color_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _bloc = ItemGeneratorModule.itemGeneratorBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyles.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorStyles.backgroundColor,
          appBar: AppBar(
            backgroundColor: ColorStyles.backgroundColor,
            title: Text(
              'homeScreenTitle'.tr(),
              style: TextStyle(
                color: ColorStyles.textColor,
                fontSize: 20
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: SizedBox(
                  child: CustomButton(
                    icon: Icons.add,
                    onTap: ()=> _bloc.add(ItemGeneratorBlocAddItemEvent()),
                  ),
                ),
              )
            ],
          ),
          body: _getBody(),
        ),
      ),
    );
  }

  Widget _getBody(){
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is ItemGeneratorBlocReadyState) {
          if (state.items.isEmpty) {
            return Center(
              child: Text(
                'emptyListPlaceholder'.tr(),
                style: TextStyle(
                  fontSize: 24,
                  color: ColorStyles.textColor,
                ),
              ),
            );
          } else {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: (state.items.length/2).round(),
                itemBuilder: (context,index) {
                  final items = List.from(state.items.reversed);
                  final leftItem = ItemCard(
                    item: items[index*2],
                    onDelete: ()=> _bloc.add(ItemGeneratorBlocDeleteItemEvent(items[index*2].id)),
                  );
                  final rightItem = index <= items.length/2 - 1 ? ItemCard(
                    item: items[index*2 + 1],
                    onDelete: ()=> _bloc.add(ItemGeneratorBlocDeleteItemEvent(items[index*2+1].id)),
                  ) : SizedBox(width: MediaQuery.of(context).size.width/2,);
                  return Row(
                    children: [
                      Expanded(child: leftItem),
                      Expanded(child: rightItem),
                    ],
                  );
                }
            );
          }
        } else {
          return Container(color: ColorStyles.backgroundColor);
        }
      },
    );
  }
}

