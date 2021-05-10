import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_thesportdb/models/models.dart';
import 'package:flutter_thesportdb/services/services.dart';

part 'league_details_state.dart';

class LeagueDetailsCubit extends Cubit<LeagueDetailsState> {
  LeagueDetailsCubit() : super(LeagueDetailsInitial());

  Future<void> getLeague(String leagueID) async {
    ApiReturnValue<List<LeagueModel>> result =
        await LeagueDetailService.getLeague(leagueID);

    if (result.value != null) {
      emit(LeagueDetailsLoaded(result.value));
    } else {
      emit(LeagueDetailsFailed(result.message));
    }
  }
}
