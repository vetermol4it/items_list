import 'package:items_list/features/items_list/domain/models/item.dart';

abstract class IItemsListRepository {
  List<Item> addItem();

  List<Item> deleteItem(String itemId);
}
