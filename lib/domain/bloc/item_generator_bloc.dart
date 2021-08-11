import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:items_list/domain/models/api_item.dart';
import 'package:items_list/domain/repository/item_repository.dart';

class ItemGeneratorBloc extends Bloc<ItemGeneratorBlocEvent,ItemGeneratorBlocState> {
  ItemGeneratorBloc(this._repository) : super(ItemGeneratorBlocInitialState()){
    add(ItemGeneratorBlocInitialEvent());
  }

  final ItemRepository _repository;

  List<Item> _items = [];

  @override
  Stream<ItemGeneratorBlocState> mapEventToState(ItemGeneratorBlocEvent event) async* {
    if (event is ItemGeneratorBlocInitialEvent){
      _items = _repository.generateItemsList();
      yield ItemGeneratorBlocReadyState(_items);
    } else if (event is ItemGeneratorBlocDeleteItemEvent) {
      _items.removeWhere((element) => element.id == event.itemId);
      yield ItemGeneratorBlocReadyState(_items);
    } else if (event is ItemGeneratorBlocAddItemEvent) {
      _items.add(_repository.generateItem());
      yield ItemGeneratorBlocReadyState(_items);
    }
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