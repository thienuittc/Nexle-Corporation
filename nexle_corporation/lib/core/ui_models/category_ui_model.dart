import 'package:uuid/uuid.dart';

class CategoryUIModel {
  final String id = const Uuid().v4();
  int categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  bool isSelected;

  CategoryUIModel({
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.isSelected = false,
  });
}
