import 'package:techara_merchant/src/main/mini_apps/events/domain/entities/events_entity.dart';

abstract class EventsRepository {
  Future<List<EventEntity>> getEvents();
}
