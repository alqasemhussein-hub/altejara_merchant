class NewsEntity {
  final String sourceImage;
  final String source;
  String title;
  String description;
  String? postImage;
  DateTime publishedAt;
  bool isBreaking;
  List<CategoryEntity> categories;
  List<String> images;
  NewsEntity({
    required this.title,
    required this.description,
    required this.source,
    required this.images,
    this.postImage,
    required this.publishedAt,
    this.isBreaking = false,
    this.categories = const [],
    required this.sourceImage,
  });
}

class CategoryEntity {
  final String name;
  final String color;
  CategoryEntity({required this.name, required this.color});
}
