import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:items_list/features/items_list/domain/bloc/items_list_state.dart';
import 'package:items_list/features/items_list/domain/models/item.dart';
import 'package:items_list/features/items_list/domain/repository/I_items_list_repository.dart';

@injectable
class ItemsListCubit extends Cubit<ItemsListState> {
  ItemsListCubit(this._repository) : super(ItemsListInitialState());

  final IItemsListRepository _repository;

  List<Item> _items = [];

  void fetchItems() {
    _items = List.from(_repository.getItemsList().reversed);
    emit(ItemsListReadyState(_items));
  }

  void deleteItem(int itemId) async {
    _items.removeWhere((element) => element.id == itemId);
    emit(ItemsListReadyState(_items));
  }

  void addItem() async {
    _items.insert(0, _repository.getItem());
    emit(ItemsListReadyState(_items));
  }
}
