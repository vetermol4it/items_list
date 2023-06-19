import 'package:items_list/domain/models/item.dart';

abstract class ItemsListState {}

class ItemsListInitialState extends ItemsListState {}

class ItemsListReadyState extends ItemsListState {
  final List<Item> items;

  ItemsListReadyState(this.items);
}
