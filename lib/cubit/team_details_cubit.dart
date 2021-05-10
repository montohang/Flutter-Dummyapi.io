import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_thesportdb/models/models.dart';
import 'package:flutter_thesportdb/services/services.dart';

part 'team_details_state.dart';

class TeamDetailsCubit extends Cubit<TeamDetailsState> {
  TeamDetailsCubit() : super(TeamDetailsInitial());

  Future<void> getTeam(String idTeam) async {
    ApiReturnValue<List<Team>> result =
        await TeamDetailsServices.getTeam(idTeam);

    if (result.value != null) {
      emit(TeamDetailsLoaded(result.value));
    } else {
      emit(TeamDetailsFailed(result.message));
    }
  }
}
