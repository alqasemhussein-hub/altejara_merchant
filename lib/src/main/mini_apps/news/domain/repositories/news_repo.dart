import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getNews();
}
