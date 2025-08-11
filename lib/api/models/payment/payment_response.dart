import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_response.g.dart';

@JsonSerializable()
class PaymentResponse {
  const PaymentResponse({this.errorCode, this.orderId, this.formUrl});

  factory PaymentResponse.fromJson(Map<String, Object?> json) =>
      _$PaymentResponseFromJson(json);

  final int? errorCode;
  final String? orderId;
  final String? formUrl;

  Map<String, Object?> toJson() => _$PaymentResponseToJson(this);
}
