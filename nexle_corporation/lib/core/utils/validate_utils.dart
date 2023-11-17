// import '../../translation/strings.dart';

class ValidateUtils {
  static String? validateEmail(String value) {
    if (value.trim().isEmpty) {
      return 'The password is required';
    } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
      return 'The password is required';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'The password is required';
    } else if (value.length < 6 || value.length > 18) {
      return 'The password must be between 6-18 characters';
    }
    return null;
  }

  static String evaluatePasswordStrength(String password) {
    if (password.isEmpty) {
      return '';
    }

    if (password.length < 6 || password.length > 18) {
      return '';
    }

    int strengthLevel = 0;
    if (RegExp(r'[a-z]').hasMatch(password) &&
        RegExp(r'[A-Z]').hasMatch(password)) {
      strengthLevel++;
    }
    if (RegExp(r'[0-9]').hasMatch(password)) {
      strengthLevel++;
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      strengthLevel++;
    }

    switch (strengthLevel) {
      case 0:
        return 'Weak';
      case 1:
        return 'Fair';
      case 2:
        return 'Good';
      case 3:
        return 'Strong';
      default:
        return 'Weak';
    }
  }
}
