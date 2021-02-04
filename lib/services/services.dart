import 'dart:convert';

import 'package:flutter_thesportdb/models/models.dart';
import 'package:http/http.dart' as http;

part 'league_services.dart';

String baseURL = 'https://www.thesportsdb.com/api/v1/json/1/all_leagues.php';
