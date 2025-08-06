class EventEntity {
  String title;
  String description;
  List<String> imageUrls;
  DateTime startDate;
  DateTime endDate;
  String location;
  String source;
  List<String> categories;
  List<String> ticketsPoints;
  EventEntity({
    required this.title,
    required this.description,
    this.imageUrls = const [],
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.source,
    this.categories = const [],
    this.ticketsPoints = const [],
  });
}
