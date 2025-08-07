part of 'login_cubit.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState state,
    @Default('') String errorMessage,
  }) = _Initial;
}
