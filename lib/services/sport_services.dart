part of 'services.dart';

class SportServices {
  static Future<ApiReturnValue<List<Sport>>> getSports(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseSportURL;

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service : $data');

    List<Sport> sports =
        (data['sports'] as Iterable).map((e) => Sport.fromJson(e)).toList();

    return ApiReturnValue(value: sports);
  }
}
