import 'dart:convert';

import 'package:flutter_thesportdb/models/models.dart';
import 'package:http/http.dart' as http;

part 'league_services.dart';
part 'league_of_country_services.dart';
part 'sport_services.dart';

String baseUrl =
    'https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php';
