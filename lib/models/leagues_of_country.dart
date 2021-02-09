part of 'models.dart';

class LeaguesOfCountry extends Equatable {
  final String id;
  final String name;
  final String formedYear;
  final String division;
  final String season;
  final String badge;

  LeaguesOfCountry({
    this.id,
    this.name,
    this.formedYear,
    this.division,
    this.season,
    this.badge,
  });

  factory LeaguesOfCountry.fromJson(Map<String, dynamic> json) =>
      LeaguesOfCountry(
          id: json['idLeague'],
          name: json['strLeague'],
          formedYear: json['intFormedYear'],
          division: json['strDivision'],
          season: json['strCurrentSeason'],
          badge: json['strBadge']);

  @override
  List<Object> get props => [id, name, formedYear, division, season, badge];
}
