part of 'models.dart';

class LeagueModel extends Equatable {
  final String id;
  final String sport;
  final String name;
  final String currSeason;
  final String formed;
  final String dateFirstEvent;
  final String urlWebsite;
  final String urlFacebook;
  final String urlTwitter;
  final String urlYoutube;
  final String description;
  final String fanArt1;
  final String fanArt2;
  final String fanArt3;
  final String fanArt4;
  final String banner;
  final String badge;
  final String logo;
  final String poster;
  final String trophy;

  LeagueModel({
    this.id,
    this.sport,
    this.name,
    this.currSeason,
    this.formed,
    this.dateFirstEvent,
    this.urlWebsite,
    this.urlFacebook,
    this.urlTwitter,
    this.urlYoutube,
    this.description,
    this.fanArt1,
    this.fanArt2,
    this.fanArt3,
    this.fanArt4,
    this.banner,
    this.badge,
    this.logo,
    this.poster,
    this.trophy,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        id: json['idLeague'],
        sport: json['strSport'],
        name: json['strLeague'],
        currSeason: json['strCurrentSeason'],
        formed: json['intFormedYear'],
        dateFirstEvent: json['dateFirstEvent'],
        urlWebsite: json['strWebsite'],
        urlFacebook: json['strFacebook'],
        urlTwitter: json['strTwitter'],
        urlYoutube: json['strYoutube'],
        description: json['strDescriptionEN'],
        fanArt1: json['strFanart1'],
        fanArt2: json['strFanart2'],
        fanArt3: json['strFanart3'],
        fanArt4: json['strFanart4'],
        banner: json['strBanner'],
        badge: json['strBadge'],
        logo: json['strLogo'],
        poster: json['strPoster'],
        trophy: json['strTrophy'],
      );

  @override
  List<Object> get props => [
        id,
        sport,
        name,
        currSeason,
        formed,
        dateFirstEvent,
        urlWebsite,
        urlFacebook,
        urlTwitter,
        urlYoutube,
        description,
        fanArt1,
        fanArt2,
        fanArt3,
        fanArt4,
        banner,
        badge,
        logo,
        poster,
        trophy,
      ];
}
