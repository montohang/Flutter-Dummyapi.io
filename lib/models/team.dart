part of 'models.dart';

class Team extends Equatable {
  final String id;
  final String name;
  final String nameAlternate;
  final String formedYear;
  final String stadium;
  final String urlWebsite;
  final String urlTwitter;
  final String urlInstagram;
  final String urlYoutube;
  final String description;
  final String badge;
  final String jersey;

  Team({
    this.id,
    this.name,
    this.nameAlternate,
    this.formedYear,
    this.stadium,
    this.urlWebsite,
    this.urlTwitter,
    this.urlInstagram,
    this.urlYoutube,
    this.description,
    this.badge,
    this.jersey,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['idTeam'],
        name: json['strTeam'],
        nameAlternate: json['strAlternate'],
        formedYear: json['intFormedYear'],
        stadium: json['strStadium'],
        urlWebsite: json['strWebsite'],
        urlTwitter: json['strTwitter'],
        urlInstagram: json['strInstagram'],
        urlYoutube: json['strYoutube'],
        description: json['strDescriptionEN'],
        badge: json['strTeamBadge'],
        jersey: json['strTeamJersey'],
      );

  @override
  List<Object> get props => [
        id,
        name,
        nameAlternate,
        formedYear,
        stadium,
        urlWebsite,
        urlTwitter,
        urlInstagram,
        urlYoutube,
        description,
        badge,
        jersey
      ];
}
