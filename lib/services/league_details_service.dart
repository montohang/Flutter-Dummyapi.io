part of 'services.dart';

class LeagueDetailService {
  static Future<ApiReturnValue<List<LeagueModel>>> getLeague(String leagueID,
      {http.Client client}) async {
    client ??= http.Client();

    Map<String, String> queryParams = {'id': leagueID};

    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = baseUrlLeagueDetails + '?' + queryString;

    var response = await client.get(requestUrl);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service league details : $data');

    List<LeagueModel> league = (data['leagues'] as Iterable)
        .map((e) => LeagueModel.fromJson(e))
        .toList();
    return ApiReturnValue(value: league);
  }
}
