part of 'services.dart';

class LeagueOfCountryService {
  static Future<ApiReturnValue<List<LeaguesOfCountry>>> getLeaguesOfCountry(
      String id,
      {http.Client client}) async {
    client ??= http.Client();

    Map<String, String> queryParams = {'c': id, 's': 'Soccer'};

    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = baseUrl + '?' + queryString;

    var response = await client.get(requestUrl);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service league of country : $data');

    List<LeaguesOfCountry> leagues = (data['countrys'] as Iterable)
        .map((e) => LeaguesOfCountry.fromJson(e))
        .toList();
    return ApiReturnValue(value: leagues);
  }
}
