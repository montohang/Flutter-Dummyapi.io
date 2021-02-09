part of 'league_cubit.dart';

abstract class LeagueState extends Equatable {
  const LeagueState();

  @override
  List<Object> get props => [];
}

class LeagueInitial extends LeagueState {}

class LeagueLoaded extends LeagueState {
  final List<League> leagues;

  LeagueLoaded(this.leagues);

  @override
  List<Object> get props => [leagues];

  LeagueLoaded copyWith({
    List<League> leagues,
  }) {
    return LeagueLoaded(
      leagues ?? this.leagues,
    );
  }
}

class LeagueLoadingFailed extends LeagueState {
  final String message;

  LeagueLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
