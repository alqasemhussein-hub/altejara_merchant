// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginError _$LoginErrorFromJson(Map<String, dynamic> json) => LoginError(
  statusCode: (json['statusCode'] as num?)?.toInt(),
  message: json['message'] as String?,
  content: json['content'] as String?,
);

Map<String, dynamic> _$LoginErrorToJson(LoginError instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'content': instance.content,
    };
