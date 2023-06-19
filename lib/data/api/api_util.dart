import 'package:injectable/injectable.dart';
import 'package:items_list/data/api/service/item_generator_service.dart';
import 'package:items_list/data/models/api_item.dart';

@lazySingleton
class ApiUtil {
  static const _itemsKey = 'items';

  final ItemGeneratorService _itemGeneratorService;

  ApiUtil(this._itemGeneratorService);

  List<ApiItem> generateItemsList() {
    final map = _itemGeneratorService.generateItemsList();
    final List itemsMaps = map[_itemsKey];
    List<ApiItem> result = [];
    for (var map in itemsMaps) {
      result.add(ApiItem.fromMap(map));
    }
    return result;
  }

  ApiItem generateItem() {
    final map = _itemGeneratorService.generateItem();
    return ApiItem.fromMap(map);
  }
}
