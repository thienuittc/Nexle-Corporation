import 'package:nexle_corporation/core/dto/users/user_dto.dart';

abstract class IAuthService {
  Future<bool> signIn(UserDto user);
  Future<bool> signUp(UserDto user);
}
