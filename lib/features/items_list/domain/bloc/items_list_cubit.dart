import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:items_list/features/items_list/domain/bloc/items_list_state.dart';
import 'package:items_list/features/items_list/domain/repository/I_items_list_repository.dart';

@injectable
class ItemsListCubit extends Cubit<ItemsListState> {
  ItemsListCubit(this._repository) : super(ItemsListInitialState());

  final IItemsListRepository _repository;

  void fetchItems() {
    final items = _repository.getItems();
    emit(ItemsListReadyState(items));
  }

  void deleteItem(String itemId) async {
    final items = _repository.deleteItem(itemId);
    emit(ItemsListReadyState(items));
  }

  void addItem() async {
    final items = _repository.addItem();
    emit(ItemsListReadyState(items));
  }
}
