import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:nexle_corporation/core/dto/users/user_dto.dart';
import 'package:nexle_corporation/core/utils/token_utils.dart';
import 'package:nexle_corporation/core/view_models/screens/interfaces/iauth_viewmodel.dart';
import 'package:nexle_corporation/global/locator.dart';
import 'package:nexle_corporation/global/router.dart';

import '../../../services/interfaces/iauth_service.dart';

class AuthViewModel with ChangeNotifier implements IAuthViewModel {
  final IAuthService _iAuthService = locator<IAuthService>();

  Future<void> signIn(String email, String password) async {
    await _iAuthService.signIn(UserDto(email: email, password: password));
  }

  @override
  Future<void> signUp(String email, String password) async {
    await EasyLoading.show();
    final result =
        await _iAuthService.signUp(UserDto(email: email, password: password));
    if (result) {
      await signIn(email, password);
      await EasyLoading.showSuccess("Success");
      Get.offNamed(MyRouter.home);
    }
  }

  @override
  Future<void> init() async {
    var token = await TokenUtils.getToken();
    if (token != null) {
      Get.offNamed(MyRouter.home);
    }
  }
}
