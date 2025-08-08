part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState state,
    String? errorMessage,
    String? idetifyer,
  }) = _Initial;
}
