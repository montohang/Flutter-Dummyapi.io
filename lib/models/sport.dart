part of 'models.dart';

class Sport extends Equatable {
  final String idSport;
  final String strSport;
  final String strFormat;
  final String strSportThumb;

  Sport({this.idSport, this.strSport, this.strFormat, this.strSportThumb});

  factory Sport.fromJson(Map<String, dynamic> json) => Sport(
      idSport: json['idSport'],
      strSport: json['strSport'],
      strFormat: json['strFormat'],
      strSportThumb: json['strSportThumb']);

  @override
  List<Object> get props => [idSport, strSport, strFormat, strSportThumb];
}

List<Sport> mockSports = [
  Sport(
      idSport: "1",
      strSport: "Soccer",
      strFormat: "TeamvsTeam",
      strSportThumb: "https://www.thesportsdb.com/images/sports/soccer.jpg"),
  Sport(
      idSport: "2",
      strSport: "Motorsport",
      strFormat: "EventSport",
      strSportThumb:
          "https://www.thesportsdb.com/images/sports/motorsport.jpg"),
];
