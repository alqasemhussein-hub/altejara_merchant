part of 'profile_cubit.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState remoteState,
    UserDataResponse? userData,
  }) = _Initial;
}
