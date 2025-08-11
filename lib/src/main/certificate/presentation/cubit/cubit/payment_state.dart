part of 'payment_cubit.dart';

@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState remoteStatus,
    PaymentResponse? paymentResponse,
    String? errorMessage,
  }) = _Initial;
}
