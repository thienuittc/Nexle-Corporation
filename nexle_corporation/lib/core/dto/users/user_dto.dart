import 'package:json_annotation/json_annotation.dart';
part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDto {
  final String email;
  final String password;
  UserDto({
    required this.email,
    required this.password,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
