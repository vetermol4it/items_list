import 'package:items_list/data/api/api_util.dart';
import 'package:items_list/data/api/service/item_generator_service.dart';

class ApiModule{
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(ItemGeneratorService());
    }
    return _apiUtil!;
  }
}