import 'package:items_list/data/api/api_util.dart';
import 'package:items_list/data/mapper/item_mapper.dart';
import 'package:items_list/domain/models/item.dart';
import 'package:items_list/domain/repository/item_repository.dart';

class ItemDataRepository extends ItemRepository {

  final ApiUtil _apiUtil;

  ItemDataRepository(this._apiUtil);

  @override
  Item generateItem() {
    final apiModel = _apiUtil.generateItem();
    return ItemMapper.fromApi(apiModel);
  }

  @override
  List<Item> generateItemsList() {
    final apiModelsList = _apiUtil.generateItemsList();
    List<Item> result = [];
    apiModelsList.forEach((element) {
      result.add(ItemMapper.fromApi(element));
    });
    return result;
  }
}