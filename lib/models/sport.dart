part of 'models.dart';

class SportsModel extends Equatable {
  final String sportID;
  final String sportName;
  final String sportThumbnail;
  final String sportDescription;

  SportsModel({
    this.sportID,
    this.sportName,
    this.sportThumbnail,
    this.sportDescription,
  });

  factory SportsModel.fromJson(Map<String, dynamic> sportsJson) => SportsModel(
        sportID: sportsJson['idSport'],
        sportName: sportsJson['strSport'],
        sportThumbnail: sportsJson['strSportThumb'],
        sportDescription: sportsJson['strSportDescription'],
      );

  @override
  List<Object> get props => [];
}
