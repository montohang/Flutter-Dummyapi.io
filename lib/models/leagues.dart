part of 'models.dart';

class League extends Equatable {
  final String id;
  final String name;
  final String division;
  final String sport;
  final String season;
  final String badge;

  League(
      {this.id, this.name, this.division, this.sport, this.season, this.badge});

  factory League.fromJson(Map<String, dynamic> json) => League(
      id: json['idLeague'],
      name: json['strLeague'],
      division: json['strDivision'],
      sport: json['strSport'],
      season: json['strCurrentSeason'],
      badge: json['strBadge']);

  @override
  List<Object> get props => [id, name, division, season, badge];
}

List<League> mockLeagues = [
  League(
      id: "4617",
      name: "Albanian Superliga",
      division: "1",
      season: "2020-2021",
      badge:
          "https://www.thesportsdb.com/images/media/league/badge/6my1u31578828133.png"),
];
