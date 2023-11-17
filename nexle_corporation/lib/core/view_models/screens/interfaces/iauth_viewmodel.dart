import 'package:flutter/material.dart';
import 'package:nexle_corporation/core/dto/users/user_dto.dart';

abstract class IAuthViewModel implements ChangeNotifier {
  Future<void> init();

  Future<void> signUp(String email, String password);
}
