import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get_it/get_it.dart';
import 'package:nexle_corporation/core/dto/error/error_dto.dart';

import '../constain.dart';
import '../core/api/rest_client.dart';
import 'global_data.dart';
import 'locator_dao.dart';
import 'locator_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => GlobalData());
  setupRestClient();
  registerDaoSingletons(locator);
  registerServiceSingletons(locator);
}

void setupRestClient() {
  var dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (error, handler) async {
        if (error.error is SocketException) {
          EasyLoading.showError("No internet!");
          handler.reject(error);
        } else {
          var errorDetails = ErrorDetailsDto.fromJson(error.response!.data);
          EasyLoading.showError(errorDetails.message);
          print(errorDetails.message);
          handler.next(error);
        }
      },
    ),
  );
  dio.options = BaseOptions(
    connectTimeout: const Duration(seconds: 15),
  );

  try {
    locator.registerLazySingleton(
      () => RestClient(dio, baseUrl: baseUrl),
      instanceName: "RestClient",
    );
  } catch (e) {
    // Future.wait([LoggerUtils.logException(e)]);
  }
}

RestClient getRestClient() {
  return locator.get<RestClient>(instanceName: 'RestClient');
}
