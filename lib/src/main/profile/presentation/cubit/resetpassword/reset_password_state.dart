part of 'reset_password_cubit.dart';

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState remoteDataState,
  }) = _Initial;
}
