part of 'services.dart';

class TeamServices {
  static Future<ApiReturnValue<List<Teams>>> getTeams(String leagueName,
      {http.Client client}) async {
    client ??= http.Client();

    Map<String, String> queryParams = {'l': leagueName};

    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = baseUrlTeam + '?' + queryString;

    var response = await client.get(requestUrl);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service team : $data');

    List<Teams> teams =
        (data['teams'] as Iterable).map((e) => Teams.fromJson(e)).toList();
    return ApiReturnValue(value: teams);
  }

  static Future<ApiReturnValue<List<Teams>>> searchTeam(String keyword,
      {http.Client client}) async {
    client ??= http.Client();

    Map<String, String> queryParams = {'t': keyword};

    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = searchUrlTeam + '?' + queryString;

    var response = await client.get(requestUrl);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari search team : $data');

    List<Teams> teams = data['teams'] == null
        ? null
        : (data['teams'] as Iterable).map((e) => Teams.fromJson(e)).toList();
    return ApiReturnValue(
        value: teams, message: data['teams'] == null ? "Team not found" : '');
  }
}
