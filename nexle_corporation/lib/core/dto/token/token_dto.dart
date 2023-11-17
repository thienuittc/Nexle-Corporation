import 'package:json_annotation/json_annotation.dart';
part 'token_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenDto {
  final String accessToken;
  TokenDto({
    required this.accessToken,
  });

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);
}
