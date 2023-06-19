import 'package:injectable/injectable.dart';
import 'package:items_list/features/items_list/data/api/items_list_api_util.dart';
import 'package:items_list/features/items_list/domain/models/item.dart';
import 'package:items_list/features/items_list/domain/repository/I_items_list_repository.dart';

@Injectable(as: IItemsListRepository)
class ItemsListRepository implements IItemsListRepository {
  final ItemsListApiUtil _apiUtil;

  ItemsListRepository(this._apiUtil);

  @override
  List<Item> getItems() => _apiUtil.getItems();

  @override
  List<Item> addItem() => _apiUtil.addItem();

  @override
  List<Item> deleteItem(String itemId) => _apiUtil.deleteItem(itemId);
}
