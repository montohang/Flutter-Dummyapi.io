part of 'sport_cubit.dart';

abstract class SportState extends Equatable {
  const SportState();

  @override
  List<Object> get props => [];
}

class SportInitial extends SportState {}

class SportLoaded extends SportState {
  final List<Sport> sports;

  SportLoaded(this.sports);

  @override
  List<Object> get props => [sports];
}

class SportLoadingFailed extends SportState {
  final String message;

  SportLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
