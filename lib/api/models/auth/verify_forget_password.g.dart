// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_forget_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyForgetPasswordForm _$VerifyForgetPasswordFormFromJson(
  Map<String, dynamic> json,
) => VerifyForgetPasswordForm(
  azberNum: json['AzbaraNumber'] as String?,
  code: json['Code'] as String?,
);

Map<String, dynamic> _$VerifyForgetPasswordFormToJson(
  VerifyForgetPasswordForm instance,
) => <String, dynamic>{
  'Code': instance.code,
  'AzbaraNumber': instance.azberNum,
};
