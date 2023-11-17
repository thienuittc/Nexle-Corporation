import 'package:get_it/get_it.dart';
import 'package:nexle_corporation/core/services/implements/auth_service.dart';
import 'package:nexle_corporation/core/services/implements/category_service.dart';
import 'package:nexle_corporation/core/services/interfaces/iauth_service.dart';
import 'package:nexle_corporation/core/services/interfaces/icategory_service.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IAuthService>(() => AuthService());
  locator.registerLazySingleton<ICategoryService>(() => CategoryService());
}
