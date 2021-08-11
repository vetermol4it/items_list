
import 'package:items_list/data/repository/item_data_repository.dart';
import 'package:items_list/domain/repository/item_repository.dart';
import 'package:items_list/internal/dependencies/api_module.dart';

class RepositoryModule {
  static ItemRepository itemRepository() {
    return ItemDataRepository(ApiModule.apiUtil());
  }
}