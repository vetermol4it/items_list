import 'package:items_list/data/models/api_item.dart';
import 'package:items_list/domain/models/api_item.dart';

class ItemMapper{
  static Item fromApi(ApiItem apiModel) {
    return Item(
      id: apiModel.id,
      imageUrl: apiModel.imageUrl,
      title: apiModel.title,
    );
  }
}