// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDetailsDto _$ErrorDetailsDtoFromJson(Map<String, dynamic> json) =>
    ErrorDetailsDto(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ErrorDetailsDtoToJson(ErrorDetailsDto instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
    };
