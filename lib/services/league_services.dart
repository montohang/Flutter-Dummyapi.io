part of 'services.dart';

class LeagueServices {
  /// servis untuk mendapatkan data liga berdasarkan kategori
  static Future<ApiReturnValue<List<League>>> getLeagues(
      {http.Client client}) async {
    client ??= http.Client();

    // var endpointUrl = baseUrl;

    // Map<String, String> queryParams = {'s': 'Soccer'};

    // String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = baseUrlLeague;

    var response = await client.get(requestUrl);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service league : $data');

    List<League> leagues =
        (data['leagues'] as Iterable).map((e) => League.fromJson(e)).toList();
    return ApiReturnValue(value: leagues);
  }

  /// servis untuk mendapatkan data liga berdasarkan category dan negara
  static Future<ApiReturnValue<List<League>>> getLeaguesOfCountry(
      String countryName,
      {http.Client client}) async {
    client ??= http.Client();

    Map<String, String> queryParams = {'c': countryName};

    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = baseUrlLeague + '?' + queryString;

    var response = await client.get(requestUrl);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service getLeaguesOfCountry : $data');

    List<League> leagues = data['countrys'] == null
        ? null
        : (data['countrys' as Iterable])
            .map((e) => League.fromJson(e))
            .toList();

    return ApiReturnValue(
        value: leagues,
        message: data['countrys'] == null ? "League not found" : '');
  }
}
