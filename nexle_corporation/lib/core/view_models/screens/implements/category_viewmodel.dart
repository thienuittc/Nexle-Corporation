import 'package:flutter/cupertino.dart';
import 'package:nexle_corporation/core/dto/category/category_dto.dart';
import 'package:nexle_corporation/core/services/interfaces/icategory_service.dart';

import 'package:nexle_corporation/global/locator.dart';

import '../../../ui_models/category_ui_model.dart';
import '../interfaces/icategory_viewmodel.dart';

class CategoryViewModel with ChangeNotifier implements ICategoryViewModel {
  final ICategoryService _iCategoryService = locator<ICategoryService>();
  List<CategoryUIModel> _categories = [];
  @override
  // TODO: implement categories
  List<CategoryUIModel> get categories => _categories;

  @override
  Future<void> init() async {
    var categoriesDto = await _iCategoryService.getCategories();
    _categories = categoriesDto
        .map((e) => CategoryUIModel(
            categoryId: e.id,
            createdAt: e.createdAt,
            updatedAt: e.updatedAt,
            name: e.name))
        .toList();
    notifyListeners();
  }

  @override
  void selectCategory(String id) {
    var category = _categories.firstWhere((element) => element.id == id);
    category.isSelected = !category.isSelected;
    notifyListeners();
  }
}
