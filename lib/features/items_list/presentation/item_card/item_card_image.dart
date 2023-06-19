import 'package:flutter/material.dart';
import 'package:items_list/ui_kit/styles/color_styles.dart';

class ItemCardImage extends StatelessWidget {
  final String imageUrl;

  const ItemCardImage({super.key, required this.imageUrl});

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
