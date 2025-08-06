import 'package:techara_merchant/src/main/mini_apps/events/domain/entities/events_entity.dart';

class EventModel extends EventEntity {
  EventModel({
    required super.title,
    required super.description,
    super.imageUrls = const [],
    required super.startDate,
    required super.endDate,
    required super.location,
    required super.source,
    super.categories = const [],
    super.ticketsPoints = const [],
  });

  EventEntity toEntity() {
    return EventEntity(
      title: title,
      description: description,
      imageUrls: imageUrls,
      startDate: startDate,
      endDate: endDate,
      location: location,
      source: source,
      categories: categories,
      ticketsPoints: ticketsPoints,
    );
  }
}
