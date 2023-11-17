import 'package:flutter/material.dart';
import 'package:nexle_corporation/ui/screens/category/category_screen.dart';
import 'package:nexle_corporation/ui/screens/register/register_screen.dart';

class MyRouter {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String register = '/register';
  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static PageRouteBuilder _buildRouteNavigation(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case register:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const RegisterScreen(),
        );
      case home:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const CategoryScreen(),
        );
      default:
        return _buildRouteNavigationWithoutEffect(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
