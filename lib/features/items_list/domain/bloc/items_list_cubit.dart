import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:items_list/features/items_list/domain/bloc/items_list_state.dart';
import 'package:items_list/features/items_list/domain/repository/I_items_list_repository.dart';

@injectable
class ItemsListCubit extends Cubit<ItemsListState> {
  ItemsListCubit(this._repository) : super(ItemsListState());

  final IItemsListRepository _repository;

  void deleteItem(String itemId) async {
    final items = _repository.deleteItem(itemId);
    emit(ItemsListState(items: items));
  }

  void addItem() async {
    final items = _repository.addItem();
    emit(ItemsListState(items: items));
  }
}
