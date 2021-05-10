part of 'services.dart';

class SportsServices {
  static Future<ApiReturnValue<List<SportsModel>>> getSports(
      {http.Client client}) async {
    client ??= http.Client();

    var requestURL = baseUrlSport;

    var response = await client.get(requestURL);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service sport : $data');

    List<SportsModel> sports = (data['sports'] as Iterable)
        .map((e) => SportsModel.fromJson(e))
        .toList();
    return ApiReturnValue(value: sports);
  }
}
