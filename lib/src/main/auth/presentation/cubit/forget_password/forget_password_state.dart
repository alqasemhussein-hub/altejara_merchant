part of 'forget_password_cubit.dart';

@freezed
abstract class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState remoteDataState,
    String? errorMessage,
    String? response,
  }) = _Initial;
}
