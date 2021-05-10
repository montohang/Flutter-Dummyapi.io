import 'dart:convert';

import 'package:flutter_thesportdb/models/models.dart';
import 'package:http/http.dart' as http;

part 'sport_services.dart';
part 'country_services.dart';
part 'league_services.dart';
part 'league_details_service.dart';
part 'team_services.dart';
part 'team_details_service.dart';
part 'event_services.dart';
part 'event_team_services.dart';

String baseURL = 'https://www.thesportsdb.com/api/v1/json/1/';

String countryLeagueURL = 'search_all_leagues.php?c=';

String baseUrlLeague =
    'https://www.thesportsdb.com/api/v1/json/1/all_leagues.php';

String baseUrlLeagueDetails =
    'https://www.thesportsdb.com/api/v1/json/1/lookupleague.php';

String baseUrlSport =
    'https://www.thesportsdb.com/api/v1/json/1/all_sports.php';

String baseUrlTeam =
    'https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php';

String baseUrlTeamDetails =
    'https://www.thesportsdb.com/api/v1/json/1/lookupteam.php';

String baseUrlEvent =
    'https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php';

String baseUrlEventTeam =
    'https://www.thesportsdb.com/api/v1/json/1/eventslast.php';

String searchUrlTeam =
    'https://www.thesportsdb.com/api/v1/json/1/searchteams.php';
