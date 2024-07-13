// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralResponse _$GeneralResponseFromJson(Map<String, dynamic> json) =>
    GeneralResponse(
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GeneralResponseToJson(GeneralResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
    };
