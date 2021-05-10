part of 'search_team_cubit.dart';

abstract class SearchTeamState extends Equatable {
  const SearchTeamState();

  @override
  List<Object> get props => [];
}

class SearchTeamInitial extends SearchTeamState {}

class SearchTeamLoading extends SearchTeamState {}

class SearchTeamLoaded extends SearchTeamState {
  final List<Teams> teams;
  SearchTeamLoaded({
    this.teams,
  });

  @override
  List<Object> get props => [this.teams];

  SearchTeamLoaded copyWith({
    List<Teams> teams,
  }) {
    return SearchTeamLoaded(
      teams: teams ?? this.teams,
    );
  }
}

class SearchTeamFailed extends SearchTeamState {
  final String message;
  SearchTeamFailed({
    this.message,
  });
  @override
  List<Object> get props => [message];
}
