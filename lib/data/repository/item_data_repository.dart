import 'package:injectable/injectable.dart';
import 'package:items_list/data/api/api_util.dart';
import 'package:items_list/domain/models/item.dart';
import 'package:items_list/domain/repository/item_repository.dart';

@Injectable(as: ItemRepository)
class ItemDataRepository implements ItemRepository {
  final ApiUtil _apiUtil;

  ItemDataRepository(this._apiUtil);

  @override
  Item generateItem() {
    return _apiUtil.generateItem();
  }

  @override
  List<Item> generateItemsList() {
    return _apiUtil.generateItemsList();
  }
}
