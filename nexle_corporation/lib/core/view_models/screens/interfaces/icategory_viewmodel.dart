import 'package:flutter/cupertino.dart';
import 'package:nexle_corporation/core/ui_models/category_ui_model.dart';

abstract class ICategoryViewModel implements ChangeNotifier {
  List<CategoryUIModel> get categories;
  Future<void> init();
  void selectCategory(String id);
}
