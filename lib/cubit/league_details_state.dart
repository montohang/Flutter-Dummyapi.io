part of 'league_details_cubit.dart';

abstract class LeagueDetailsState extends Equatable {
  const LeagueDetailsState();

  @override
  List<Object> get props => [];
}

class LeagueDetailsInitial extends LeagueDetailsState {}

class LeagueDetailsLoading extends LeagueDetailsState {}

class LeagueDetailsLoaded extends LeagueDetailsState {
  final List<LeagueModel> league;

  LeagueDetailsLoaded(this.league);

  @override
  List<Object> get props => [league];

  LeagueDetailsLoaded copyWith({
    List<LeagueModel> league,
  }) {
    return LeagueDetailsLoaded(
      league ?? this.league,
    );
  }
}

class LeagueDetailsFailed extends LeagueDetailsState {
  final String message;

  LeagueDetailsFailed(this.message);

  @override
  List<Object> get props => [message];
}
