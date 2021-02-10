import 'dart:convert';

import 'package:flutter_thesportdb/models/models.dart';
import 'package:http/http.dart' as http;

part 'league_services.dart';
part 'team_services.dart';

String baseUrlLeague =
    'https://www.thesportsdb.com/api/v1/json/1/all_leagues.php';

String baseUrlTeam =
    'https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php';
