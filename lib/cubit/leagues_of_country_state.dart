part of 'leagues_of_country_cubit.dart';

abstract class LeaguesOfCountryState extends Equatable {
  const LeaguesOfCountryState();

  @override
  List<Object> get props => [];
}

class LeaguesOfCountryInitial extends LeaguesOfCountryState {}

class LeaguesOfCountryLoaded extends LeaguesOfCountryState {
  final List<LeaguesOfCountry> leaguesOfCountry;

  LeaguesOfCountryLoaded(
    this.leaguesOfCountry,
  );

  @override
  List<Object> get props => [leaguesOfCountry];

  LeaguesOfCountryLoaded copyWith({
    List<LeaguesOfCountry> leaguesOfCountry,
  }) {
    return LeaguesOfCountryLoaded(
      leaguesOfCountry ?? this.leaguesOfCountry,
    );
  }
}

class LeaguesOfCountryLoadingFailed extends LeaguesOfCountryState {
  final String message;

  LeaguesOfCountryLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
