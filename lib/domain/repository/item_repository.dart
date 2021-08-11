import 'package:items_list/domain/models/api_item.dart';

abstract class ItemRepository{
  List<Item> generateItemsList();
  Item generateItem();
}