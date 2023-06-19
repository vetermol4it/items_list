import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:items_list/domain/models/item.dart';
import 'package:items_list/domain/repository/item_repository.dart';

@injectable
class ItemsListBloc extends Bloc<ItemsListEvent, ItemsListState> {
  ItemsListBloc(this._repository) : super(ItemsListInitialState()) {
    on<ItemsListInitialEvent>(_initialEventHandler);
    on<ItemsListDeleteItemEvent>(_deleteEventHandler);
    on<ItemsListAddItemEvent>(_addItemEventHandler);
    add(ItemsListInitialEvent());
  }

  final ItemRepository _repository;

  List<Item> _items = [];

  FutureOr<void> _initialEventHandler(event, emit) async {
    _items = List.from(_repository.getItemsList().reversed);
    emit(ItemsListReadyState(_items));
  }

  FutureOr<void> _deleteEventHandler(event, emit) async {
    _items.removeWhere((element) => element.id == event.itemId);
    emit(ItemsListReadyState(_items));
  }

  FutureOr<void> _addItemEventHandler(event, emit) async {
    _items.insert(0, _repository.getItem());
    emit(ItemsListReadyState(_items));
  }
}

abstract class ItemsListEvent {}

class ItemsListInitialEvent extends ItemsListEvent {}

class ItemsListAddItemEvent extends ItemsListEvent {}

class ItemsListDeleteItemEvent extends ItemsListEvent {
  final int itemId;

  ItemsListDeleteItemEvent(this.itemId);
}

abstract class ItemsListState {}

class ItemsListInitialState extends ItemsListState {}

class ItemsListReadyState extends ItemsListState {
  final List<Item> items;

  ItemsListReadyState(this.items);
}
