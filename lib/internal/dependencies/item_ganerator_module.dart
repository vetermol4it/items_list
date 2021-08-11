import 'package:items_list/domain/bloc/item_generator_bloc.dart';
import 'package:items_list/internal/dependencies/repository_module.dart';

class ItemGeneratorModule{
  static ItemGeneratorBloc itemGeneratorBloc(){
    return ItemGeneratorBloc(RepositoryModule.itemRepository());
  }
}