import 'package:flutter/material.dart';
import 'package:items_list/domain/models/item.dart';
import 'package:items_list/presentation/home_screen/widgets/custom_button.dart';
import 'package:items_list/presentation/styles/app_icons.dart';
import 'package:items_list/presentation/styles/color_styles.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onDelete;

  const ItemCard({
    Key? key,
    required this.item,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardHeight = MediaQuery.of(context).size.width / 2;
    return Container(
      width: double.maxFinite,
      height: cardHeight,
      color: ColorStyles.backgroundColor,
      padding: EdgeInsets.all(8),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: _getText(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CustomButton(
              icon: AppIcons.trash,
              onTap: onDelete,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _getImage(cardHeight - 64),
          )
        ],
      ),
    );
  }

  Widget _getImage(double size){
    return Image.network(
      item.imageUrl,
      height: size,
      width: size,
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
    );
  }

  Widget _getText(){
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Text(
        item.title,
        style: TextStyle(
          fontSize: 14,
          color: ColorStyles.textColor,
        ),
      ),
    );
  }
}
