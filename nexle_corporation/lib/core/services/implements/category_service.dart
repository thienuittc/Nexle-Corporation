import 'package:nexle_corporation/core/dto/category/category_dto.dart';
import 'package:nexle_corporation/core/services/interfaces/icategory_service.dart';
import 'package:nexle_corporation/global/locator.dart';

import '../../utils/token_utils.dart';

class CategoryService implements ICategoryService {
  @override
  Future<List<CategoryDto>> getCategories() async {
    List<CategoryDto> categories = [];
    var token = await TokenUtils.getToken();
    try {
      var result = await getRestClient().getCategories(token: token!);
      return result;
    } on Exception catch (e) {
      print(e);
    } finally {}
    return categories;
  }
}
