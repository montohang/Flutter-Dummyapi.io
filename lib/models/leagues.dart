part of 'models.dart';

class League extends Equatable {
  final String id;
  final String league;
  final String sport;
  final String leagueAlternate;

  League({this.id, this.league, this.sport, this.leagueAlternate});

  factory League.fromJson(Map<String, dynamic> json) => League(
      id: json['idLeague'],
      league: json['strLeague'],
      sport: json['strSport'],
      leagueAlternate: json['strLeagueAlternate']);

  @override
  List<Object> get props => [id, league, sport, leagueAlternate];
}

List<League> mockLeagues = [
  League(
      id: "1",
      league: "Premiere League",
      sport: "Soccer",
      leagueAlternate: "ulululu"),
  League(
      id: "2",
      league: "Premiere League",
      sport: "Soccer",
      leagueAlternate: "ulululu"),
  League(
      id: "3",
      league: "Premiere League",
      sport: "Soccer",
      leagueAlternate: "ulululu")
];
