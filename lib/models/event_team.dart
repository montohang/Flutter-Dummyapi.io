part of 'models.dart';

class EventTeamModel extends Equatable {
  final String id;
  final String eventName;
  final String season;
  final String home;
  final String away;
  final String round;
  final String homeScore;
  final String awayScore;
  final String date;
  final String venue;
  final String thumb;
  final String status;

  EventTeamModel(
      {this.id,
      this.eventName,
      this.season,
      this.home,
      this.away,
      this.round,
      this.homeScore,
      this.awayScore,
      this.date,
      this.venue,
      this.thumb,
      this.status});

  factory EventTeamModel.fromJson(Map<String, dynamic> json) => EventTeamModel(
      id: json['idEvent'],
      eventName: json['strEvent'],
      season: json['strSeason'],
      home: json['strHomeTeam'],
      away: json['strAwayTeam'],
      round: json['intRound'],
      homeScore: json['intHomeScore'],
      awayScore: json['intAwayScore'],
      date: json['dateEvent'],
      venue: json['strVenue'],
      thumb: json['strThumb'],
      status: json['strStatus']);

  @override
  List<Object> get props => [
        id,
        eventName,
        season,
        home,
        away,
        round,
        homeScore,
        awayScore,
        date,
        venue,
        thumb,
        status
      ];
}
