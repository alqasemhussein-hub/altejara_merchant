import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/api/models/payment/payment_response.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/main/certificate/datastource/payment_datsource.dart';

part 'payment_cubit.freezed.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentState.initial());
  PaymentDataSource paymentDataSource = PaymentDataSource();
  getPaymentDetails({required String orderId, required double amount}) async {
    emit(state.copyWith(remoteStatus: RemoteDataState.loading));
    final result = await paymentDataSource.getPaymentUrl(
      orderId: orderId,
      amount: amount,
    );
    if (result is DataFailed) {
      emit(
        state.copyWith(
          remoteStatus: RemoteDataState.error,
          errorMessage: result.error?.reason ?? 'حدث خطأ أثناء تحميل البيانات',
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        remoteStatus: RemoteDataState.loaded,
        paymentResponse: result.data,
      ),
    );
    emit(
      state.copyWith(
        remoteStatus: RemoteDataState.ideal,
        paymentResponse: result.data,
      ),
    );
  }
}
