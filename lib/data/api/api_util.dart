import 'package:injectable/injectable.dart';
import 'package:items_list/data/api/service/item_generator_service.dart';
import 'package:items_list/domain/models/item.dart';

@lazySingleton
class ApiUtil {
  static const _itemsKey = 'items';

  final ItemGeneratorService _itemGeneratorService;

  ApiUtil(this._itemGeneratorService);

  List<Item> getItemsList() {
    final map = _itemGeneratorService.generateItemsList();
    final List itemsMaps = map[_itemsKey];
    List<Item> result = [];
    for (var map in itemsMaps) {
      result.add(Item.fromMap(map));
    }
    return result;
  }

  Item getItem() {
    final map = _itemGeneratorService.generateItem();
    return Item.fromMap(map);
  }
}
