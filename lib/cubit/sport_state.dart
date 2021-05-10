part of 'sport_cubit.dart';

abstract class SportState extends Equatable {
  const SportState();

  @override
  List<Object> get props => [];
}

class SportInitial extends SportState {}

class SportLoading extends SportState {}

class SportLoaded extends SportState {
  final List<SportsModel> sports;

  SportLoaded({
    this.sports,
  });

  @override
  List<Object> get props => [this.sports];

  SportLoaded copyWith({
    List<SportsModel> sports,
  }) {
    return SportLoaded(
      sports: sports ?? this.sports,
    );
  }
}

class SportFailed extends SportState {
  final String message;
  SportFailed({
    this.message,
  });
  @override
  List<Object> get props => [message];
}
