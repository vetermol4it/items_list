import 'package:items_list/features/items_list/domain/models/item.dart';

class ItemsListState {
  final List<Item> items;

  ItemsListState({this.items = const []});
}
