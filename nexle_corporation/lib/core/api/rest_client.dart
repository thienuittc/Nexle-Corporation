import 'package:dio/dio.dart';
import 'package:nexle_corporation/core/dto/users/user_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/category/category_dto.dart';
import '../dto/token/token_dto.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/categories")
  Future<List<CategoryDto>> getCategories({
    @Header('Authorization') required String token,
  });

  @POST("/auth/signup")
  Future<dynamic> signUp(
    @Body() UserDto model,
  );

  @POST("/auth/signin")
  Future<TokenDto> signIn(
    @Body() UserDto model,
  );
}
