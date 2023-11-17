// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryDto {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  CategoryDto({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });
  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
