import 'dart:convert';

import 'package:flutter_thesportdb/models/models.dart';
import 'package:http/http.dart' as http;

part 'league_services.dart';
part 'sport_services.dart';

String baseLeagueURL =
    'https://www.thesportsdb.com/api/v1/json/1/all_leagues.php';
String baseSportURL =
    'https://www.thesportsdb.com/api/v1/json/1/all_sports.php';
