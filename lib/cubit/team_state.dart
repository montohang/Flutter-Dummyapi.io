part of 'team_cubit.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object> get props => [];
}

class TeamInitial extends TeamState {}

class TeamLoaded extends TeamState {
  final List<Teams> teams;

  TeamLoaded(this.teams);

  @override
  List<Object> get props => [teams];

  TeamLoaded copyWith({
    List<Teams> teams,
  }) {
    return TeamLoaded(
      teams ?? this.teams,
    );
  }
}

class TeamLoadingFailed extends TeamState {
  final String message;

  TeamLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
