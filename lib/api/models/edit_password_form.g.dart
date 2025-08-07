// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_password_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditPasswordForm _$EditPasswordFormFromJson(Map<String, dynamic> json) =>
    EditPasswordForm(
      password: json['Password'] as String?,
      newPassword: json['NewPassword'] as String?,
    );

Map<String, dynamic> _$EditPasswordFormToJson(EditPasswordForm instance) =>
    <String, dynamic>{
      'Password': instance.password,
      'NewPassword': instance.newPassword,
    };
