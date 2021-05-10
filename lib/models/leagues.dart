part of 'models.dart';

class League extends Equatable {
  final String id;
  final String name;
  final String sport;

  League({this.id, this.name, this.sport});

  factory League.fromJson(Map<String, dynamic> json) => League(
      id: json['idLeague'], name: json['strLeague'], sport: json['strSport']);

  @override
  List<Object> get props => [id, name, sport];
}

List<League> mockLeagues = [
  League(
    id: "4617",
    name: "Albanian Superliga",
    sport: "1",
  )
];
