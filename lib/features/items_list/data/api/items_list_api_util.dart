import 'package:injectable/injectable.dart';
import 'package:items_list/features/items_list/data/api/service/item_generator_service.dart';
import 'package:items_list/features/items_list/domain/models/item.dart';

//Mock class that imitating work of backend
@lazySingleton
class ItemsListApiUtil {
  final ItemGeneratorService _itemGeneratorService;

  ItemsListApiUtil(this._itemGeneratorService);

  final List<Item> _items = [];

  List<Item> getItems() {
    if (_items.isNotEmpty) return _items;

    final generatedItems = _itemGeneratorService.generateItemsList();
    for (var map in generatedItems) {
      _items.add(Item.fromMap(map));
    }

    return _items;
  }

  List<Item> addItem() {
    final map = _itemGeneratorService.generateItem();
    _items.insert(0, Item.fromMap(map));

    return _items;
  }

  List<Item> deleteItem(String itemId) {
    _items.removeWhere((element) => element.id == itemId);

    return _items;
  }
}
