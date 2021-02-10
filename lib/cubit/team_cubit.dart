import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_thesportdb/models/models.dart';
import 'package:flutter_thesportdb/services/services.dart';

part 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit() : super(TeamInitial());

  Future<void> getTeams(String leagueName) async {
    ApiReturnValue<List<Teams>> result =
        await TeamServices.getTeams(leagueName);

    if (result.value != null) {
      emit(TeamLoaded(result.value));
    } else {
      emit(TeamLoadingFailed(result.message));
    }
  }
}
