// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse(
      errorCode: (json['errorCode'] as num?)?.toInt(),
      orderId: json['orderId'] as String?,
      formUrl: json['formUrl'] as String?,
    );

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'orderId': instance.orderId,
      'formUrl': instance.formUrl,
    };
