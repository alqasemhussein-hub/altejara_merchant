import 'package:techara_merchant/src/main/mini_apps/news/data/datasourse/news_remote.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_entity.dart';
import 'package:techara_merchant/src/main/mini_apps/news/domain/repositories/news_repo.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource remote;

  NewsRepositoryImpl(this.remote);

  @override
  Future<List<NewsEntity>> getNews() {
    return remote.getNews().then((newsModels) {
      return newsModels.map((model) => model.toEntity()).toList();
    });
  }
}
