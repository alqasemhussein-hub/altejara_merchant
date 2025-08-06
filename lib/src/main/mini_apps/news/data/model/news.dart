import 'package:techara_merchant/src/main/mini_apps/news/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({
    required super.source,
    required super.title,

    required super.description,
    required super.publishedAt,
    super.postImage,
    super.isBreaking = false,
    super.categories = const [],
    required super.images,
    required super.sourceImage,
  });

  NewsEntity toEntity() {
    return NewsEntity(
      title: title,
      source: source,
      description: description,
      publishedAt: publishedAt,
      isBreaking: isBreaking,
      categories: categories,
      postImage: postImage,
      images: images,
      sourceImage: sourceImage,
    );
  }
}
