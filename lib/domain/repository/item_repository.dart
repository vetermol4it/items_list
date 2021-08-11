import 'package:items_list/domain/models/item.dart';

abstract class ItemRepository{
  List<Item> generateItemsList();
  Item generateItem();
}