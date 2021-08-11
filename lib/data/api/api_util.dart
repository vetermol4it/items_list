import 'package:items_list/data/api/service/item_generator_service.dart';
import 'package:items_list/data/models/api_item.dart';

class ApiUtil {
  static const _items_key = 'items';

  final ItemGeneratorService _itemGeneratorService;

  ApiUtil(this._itemGeneratorService);

  List<ApiItem> generateItemsList() {
    final map = _itemGeneratorService.generateItemsList();
    final List itemsMaps = map[_items_key];
    List<ApiItem> result = [];
    itemsMaps.forEach((element) {
      result.add(ApiItem.fromMap(element));
    });
    return result;
  }

  ApiItem generateItem() {
    final map = _itemGeneratorService.generateItem();
    return ApiItem.fromMap(map);
  }
}