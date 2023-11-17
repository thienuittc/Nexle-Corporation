import 'package:json_annotation/json_annotation.dart';
part 'error_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorDetailsDto {
  final int statusCode;
  final String message;

  ErrorDetailsDto({
    required this.statusCode,
    required this.message,
  });

  factory ErrorDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorDetailsDtoToJson(this);
}
