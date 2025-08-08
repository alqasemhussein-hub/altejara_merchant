part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial({
    @Default(RemoteDataState.ideal) RemoteDataState state,
    HomeDataResponse? homeData,
  }) = _Initial;
}
