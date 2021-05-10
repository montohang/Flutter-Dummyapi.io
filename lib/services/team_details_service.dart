part of 'services.dart';

class TeamDetailsServices {
  static Future<ApiReturnValue<List<Team>>> getTeam(String idTeam,
      {http.Client client}) async {
    client ??= http.Client();

    Map<String, String> queryParams = {'id': idTeam};

    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = baseUrlTeamDetails + '?' + queryString;

    var response = await client.get(requestUrl);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service team detail : $data');

    List<Team> team =
        (data['teams'] as Iterable).map((e) => Team.fromJson(e)).toList();
    return ApiReturnValue(value: team);
  }
}
