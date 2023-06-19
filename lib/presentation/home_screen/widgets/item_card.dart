import 'package:flutter/material.dart';
import 'package:items_list/common/di/init_di.dart';
import 'package:items_list/domain/bloc/items_list_bloc.dart';
import 'package:items_list/domain/models/item.dart';
import 'package:items_list/presentation/home_screen/widgets/custom_button.dart';
import 'package:items_list/presentation/styles/app_icons.dart';
import 'package:items_list/presentation/styles/color_styles.dart';

class ItemCard extends StatefulWidget {
  final Item item;

  const ItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  final _itemGeneratorBloc = getIt<ItemsListBloc>();

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
            child: _CardTitle(title: widget.item.title),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CustomButton(
              icon: AppIcons.trash,
              onTap: () {
                _itemGeneratorBloc.add(ItemsListDeleteItemEvent(widget.item.id));
              },
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _CardImage(imageUrl: widget.item.imageUrl),
          )
        ],
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final String imageUrl;

  const _CardImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: Icon(
              Icons.history,
              color: ColorStyles.textColor.withOpacity(0.3),
            ),
          );
        },
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final String title;
  const _CardTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: ColorStyles.textColor,
        ),
      ),
    );
  }
}
