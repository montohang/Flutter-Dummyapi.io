import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_thesportdb/models/models.dart';
import 'package:flutter_thesportdb/services/services.dart';

part 'sport_state.dart';

class SportCubit extends Cubit<SportState> {
  SportCubit() : super(SportInitial());

  Future<void> getSports() async {
    emit(SportLoading());
    try {
      ApiReturnValue<List<SportsModel>> result =
          await SportsServices.getSports();
      if (result.value != null) {
        emit(SportLoaded(sports: result.value));
      } else {
        emit(SportFailed(message: result.message));
      }
    } catch (e) {
      emit(SportFailed(message: e.toString()));
    }
  }
}
