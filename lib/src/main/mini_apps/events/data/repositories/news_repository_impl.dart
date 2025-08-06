import 'package:techara_merchant/src/main/mini_apps/events/data/datasourse/event_remote.dart';
import 'package:techara_merchant/src/main/mini_apps/events/domain/entities/events_entity.dart';
import 'package:techara_merchant/src/main/mini_apps/events/domain/repositories/news_repo.dart';

class EventsRepositoryImpl implements EventsRepository {
  EventsRemoteDataSource remote;

  EventsRepositoryImpl(this.remote);

  @override
  Future<List<EventEntity>> getEvents() {
    return remote.getEevents().then((newsModels) {
      return newsModels.map((model) => model.toEntity()).toList();
    });
  }
}
