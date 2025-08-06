part of 'event_cubit.dart';

@freezed
abstract class EventState with _$EventState {
  const factory EventState.initial({
    List<EventEntity>? events,
    DataFailed? error,
    @Default(RemoteDataState.ideal) RemoteDataState remoteDataState,
  }) = _Initial;
}
