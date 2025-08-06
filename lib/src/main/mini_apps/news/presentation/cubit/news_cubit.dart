import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/network/error_model.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_entity.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/repositories/news_repo.dart';

part 'news_cubit.freezed.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository repository;

  NewsCubit(this.repository) : super(const NewsState.initial());

  Future<void> getNews() async {
    emit(state.copyWith(remoteDataState: RemoteDataState.loading));
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    try {
      final news = await repository.getNews();
      List<NewsEntity> breakingNews = [];
      List<NewsEntity> oldNews = [];
      if (news.isNotEmpty) {
        breakingNews = news.where((e) => e.isBreaking == true).toList();
      }
      if (news.isNotEmpty) {
        oldNews = news.where((e) => e.isBreaking == false).toList();
      }
      emit(
        state.copyWith(
          news: oldNews,

          breakingNews: breakingNews,
          remoteDataState: RemoteDataState.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          remoteDataState: RemoteDataState.error,
          error: DataFailed(
            ErrorResponseModel(statusCode: 400, reason: e.toString()),
          ),
        ),
      );
    }
  }
}
