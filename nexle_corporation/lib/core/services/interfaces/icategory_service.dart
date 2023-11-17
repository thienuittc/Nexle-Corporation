import 'package:nexle_corporation/core/dto/category/category_dto.dart';

abstract class ICategoryService {
  Future<List<CategoryDto>> getCategories();
}
