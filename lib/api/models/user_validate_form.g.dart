// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_validate_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserValidateForm _$UserValidateFormFromJson(Map<String, dynamic> json) =>
    UserValidateForm(
      email: json['Email'] as String?,
      phoneNumber: json['PhoneNumber'] as String?,
    );

Map<String, dynamic> _$UserValidateFormToJson(UserValidateForm instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'PhoneNumber': instance.phoneNumber,
    };
