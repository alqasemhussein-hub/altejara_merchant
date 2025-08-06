part of 'news_cubit.dart';

@freezed
abstract class NewsState with _$NewsState {
  const factory NewsState.initial({
    List<NewsEntity>? news,
    List<NewsEntity>? breakingNews,
    DataFailed? error,
    @Default(RemoteDataState.ideal) RemoteDataState remoteDataState,
  }) = _Initial;
}
