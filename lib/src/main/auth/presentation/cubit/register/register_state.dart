part of 'register_cubit.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState remoteDataState,
    String? errorMessage,
  }) = _Initial;
}
