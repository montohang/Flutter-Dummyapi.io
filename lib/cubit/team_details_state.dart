part of 'team_details_cubit.dart';

abstract class TeamDetailsState extends Equatable {
  const TeamDetailsState();

  @override
  List<Object> get props => [];
}

class TeamDetailsInitial extends TeamDetailsState {}

class TeamDetailsLoaded extends TeamDetailsState {
  final List<Team> team;

  TeamDetailsLoaded(this.team);

  @override
  List<Object> get props => [team];

  TeamDetailsLoaded copyWith({
    List<Teams> teams,
  }) {
    return TeamDetailsLoaded(
      teams ?? this.team,
    );
  }
}

class TeamDetailsFailed extends TeamDetailsState {
  final String message;

  TeamDetailsFailed(this.message);

  @override
  List<Object> get props => [message];
}
