// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_client.g.dart';

@RestApi()
abstract class PaymentClient {
  factory PaymentClient(Dio dio, {String? baseUrl}) = _PaymentClient;

  @POST('/api/Payment')
  Future<void> postApiPayment({
    @Query('orderNumber') String? orderNumber,
    @Query('amount') double? amount,
    @Query('description') String? description,
  });

  @GET('/api/Payment')
  Future<void> getApiPayment({
    @Query('orderId') String? orderId,
  });

  @POST('/api/Payment/ChangeOrderStatus')
  Future<void> postApiPaymentChangeOrderStatus({
    @Query('orderId') String? orderId,
  });

  @GET('/api/Payment/GetLastOrderCerticate')
  Future<void> getApiPaymentGetLastOrderCerticate({
    @Query('orderId') String? orderId,
  });
}
