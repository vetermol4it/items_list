import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:items_list/domain/repository/item_repository.dart';
import 'package:items_list/domain/models/item.dart';

class ItemGeneratorBloc extends Bloc<ItemGeneratorBlocEvent,ItemGeneratorBlocState> {
  ItemGeneratorBloc(this._repository) : super(ItemGeneratorBlocInitialState()){
    on<ItemGeneratorBlocInitialEvent>(_initialEventHandler);
    on<ItemGeneratorBlocDeleteItemEvent>(_deleteEventHandler);
    on<ItemGeneratorBlocAddItemEvent>(_addItemEventHandler);
    add(ItemGeneratorBlocInitialEvent());
  }

  final ItemRepository _repository;

  List<Item> _items = [];

  FutureOr<void> _initialEventHandler (event, emit) async {
    _items = List.from(_repository.generateItemsList().reversed);
    emit(ItemGeneratorBlocReadyState(_items));
  }

  FutureOr<void> _deleteEventHandler (event, emit) async {
    _items.removeWhere((element) => element.id == event.itemId);
    emit(ItemGeneratorBlocReadyState(_items));
  }

  FutureOr<void> _addItemEventHandler (event, emit) async {
    _items.insert(0, _repository.generateItem());
    emit(ItemGeneratorBlocReadyState(_items));
  }
}

abstract class ItemGeneratorBlocEvent{}
class ItemGeneratorBlocInitialEvent extends ItemGeneratorBlocEvent{}
class ItemGeneratorBlocAddItemEvent extends ItemGeneratorBlocEvent{}
class ItemGeneratorBlocDeleteItemEvent extends ItemGeneratorBlocEvent{
  final int itemId;

  ItemGeneratorBlocDeleteItemEvent(this.itemId);
}

abstract class ItemGeneratorBlocState{}
class ItemGeneratorBlocInitialState extends ItemGeneratorBlocState{}
class ItemGeneratorBlocReadyState extends ItemGeneratorBlocState{
  final List<Item> items;

  ItemGeneratorBlocReadyState(this.items);
}