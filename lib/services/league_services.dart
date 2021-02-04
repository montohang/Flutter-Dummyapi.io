part of 'services.dart';

class LeagueServices {
  static Future<ApiReturnValue<List<League>>> getLeagues(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL;

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service : $data');

    List<League> leagues =
        (data['leagues'] as Iterable).map((e) => League.fromJson(e)).toList();
    return ApiReturnValue(value: leagues);
  }
}
