import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_thesportdb/models/models.dart';
import 'package:flutter_thesportdb/services/services.dart';

part 'event_team_state.dart';

class EventTeamCubit extends Cubit<EventTeamState> {
  EventTeamCubit() : super(EventTeamInitial());

  Future<void> getEventTeam(String id) async {
    ApiReturnValue<List<EventTeamModel>> result =
        await EventTeamServices.getEventTeam(id);

    if (result.value != null) {
      emit(EventTeamLoaded(result.value));
    } else {
      emit(EventTeamFailed(result.message));
    }
  }
}
