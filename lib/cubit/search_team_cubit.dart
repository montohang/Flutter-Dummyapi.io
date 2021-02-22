import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_thesportdb/models/models.dart';
import 'package:flutter_thesportdb/services/services.dart';

part 'search_team_state.dart';

class SearchTeamCubit extends Cubit<SearchTeamState> {
  SearchTeamCubit() : super(SearchTeamInitial());

  Future<void> searchTeam(String keyword) async {
    emit(SearchTeamLoading());
    try {
      ApiReturnValue<List<Teams>> result =
          await TeamServices.searchTeam(keyword);
      if (result.value != null) {
        emit(SearchTeamLoaded(teams: result.value));
      } else {
        emit(SearchTeamFailed(message: result.message));
      }
    } catch (e) {
      emit(SearchTeamFailed(message: e.toString()));
    }
  }
}
