import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_thesportdb/models/models.dart';
import 'package:flutter_thesportdb/services/services.dart';

part 'leagues_of_country_state.dart';

class LeaguesOfCountryCubit extends Cubit<LeaguesOfCountryState> {
  LeaguesOfCountryCubit() : super(LeaguesOfCountryInitial());

  Future<void> getLeaguesOfCountry(String id) async {
    ApiReturnValue<List<LeaguesOfCountry>> result =
        await LeagueOfCountryService.getLeaguesOfCountry(id);

    if (result.value != null) {
      emit(LeaguesOfCountryLoaded(result.value));
    } else {
      emit(LeaguesOfCountryLoadingFailed(result.message));
    }
  }
}
