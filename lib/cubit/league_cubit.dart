import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_thesportdb/models/models.dart';
import 'package:flutter_thesportdb/services/services.dart';

part 'league_state.dart';

class LeagueCubit extends Cubit<LeagueState> {
  LeagueCubit() : super(LeagueInitial());

  Future<void> getLeagues() async {
    ApiReturnValue<List<League>> result = await LeagueServices.getLeagues();

    if (result.value != null) {
      emit(LeagueLoaded(result.value));
    } else {
      emit(LeagueLoadingFailed(result.message));
    }
  }
}
