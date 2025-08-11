import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:techara_merchant/api/models/payment/payment_response.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/network/dio_client.dart';
import 'package:techara_merchant/src/core/network/error_model.dart';
import 'package:techara_merchant/utils/injector.dart';

class PaymentDataSource {
  Future<DataState<PaymentResponse>> getPaymentUrl({
    required String orderId,
    required double amount,
  }) async {
    try {
      final result = await getIt<ApiClient>()
          .instance(null)
          .payment
          .postApiPayment(
            orderNumber: orderId,
            amount: amount.toInt(),
            description: orderId,
          );

      final json = jsonDecode(result);

      if (!(json as Map<String, dynamic>).containsKey('formUrl')) {
        return DataFailed(
          ErrorResponseModel(
            statusCode: 500,
            reason: 'لا توجد قيمة لهذا الطلب',
          ),
        );
      }
      return DataSuccess(
        (PaymentResponse(
          errorCode: 0,
          formUrl: json['formUrl'],
          orderId: orderId,
        )),
      );
    } on DioException catch (e) {
      return DataFailed(
        ErrorResponseModel(
          statusCode: e.response?.statusCode ?? 500,
          reason: e.message ?? 'Unknown error',
        ),
      );
    }
  }
}
