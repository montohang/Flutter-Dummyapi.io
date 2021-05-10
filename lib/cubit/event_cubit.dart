import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_thesportdb/models/models.dart';
import 'package:flutter_thesportdb/services/services.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());

  Future<void> getEvents(String id) async {
    ApiReturnValue<List<EventsModel>> result =
        await EventServices.getEvents(id);

    if (result.value != null) {
      if (state is EventLoaded) {
        emit((state as EventLoaded).copyWith(events: result.value));
      } else
        emit(EventLoaded(result.value));
    } else {
      emit(EventFailed(result.message));
    }
  }
}
