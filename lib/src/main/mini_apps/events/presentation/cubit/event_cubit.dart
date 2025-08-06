import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:techara_merchant/src/core/enums/general.dart';
import 'package:techara_merchant/src/core/network/data_state.dart';
import 'package:techara_merchant/src/core/network/error_model.dart';
import 'package:techara_merchant/src/main/mini_apps/events/domain/entities/events_entity.dart';
import 'package:techara_merchant/src/main/mini_apps/events/domain/repositories/news_repo.dart';

part 'event_cubit.freezed.dart';
part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final EventsRepository repository;
  EventCubit(this.repository) : super(const EventState.initial());
  Future<void> getEvents() async {
    emit(state.copyWith(remoteDataState: RemoteDataState.loading));

    try {
      final news = await repository.getEvents();
      emit(
        state.copyWith(events: news, remoteDataState: RemoteDataState.loaded),
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
