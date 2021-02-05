import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_thesportdb/models/models.dart';
import 'package:flutter_thesportdb/services/services.dart';

part 'sport_state.dart';

class SportCubit extends Cubit<SportState> {
  SportCubit() : super(SportInitial());

  Future<void> getSports() async {
    ApiReturnValue<List<Sport>> result = await SportServices.getSports();

    if (result.value != null) {
      emit(SportLoaded(result.value));
    } else {
      emit(SportLoadingFailed(result.message));
    }
  }
}
