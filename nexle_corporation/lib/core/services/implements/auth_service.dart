import 'package:nexle_corporation/core/dto/users/user_dto.dart';
import '../../../global/locator.dart';
import '../../utils/token_utils.dart';
import '../interfaces/iauth_service.dart';

class AuthService implements IAuthService {
  @override
  Future<bool> signIn(UserDto user) async {
    try {
      var result = await getRestClient().signIn(user);
      TokenUtils.saveToken('Bearer ${result.accessToken}');
      return true;
    } on Exception catch (e) {
      print(e);
    } finally {}
    return false;
  }

  @override
  Future<bool> signUp(UserDto registerAccountDto) async {
    try {
      var a = await getRestClient().signUp(registerAccountDto);
      return true;
    } on Exception catch (e) {
      print(e);
    } finally {}
    return false;
  }
}
