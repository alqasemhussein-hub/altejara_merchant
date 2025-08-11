part of 'otp_bloc.dart';

@freezed
abstract class OtpState with _$OtpState {
  const factory OtpState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState state,
    String? errorMessage,
    String? idetifyer,
    @Default(60) int remainingTime,
  }) = _Initial;
}
