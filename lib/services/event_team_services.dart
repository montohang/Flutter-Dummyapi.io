part of 'services.dart';

class EventTeamServices {
  static Future<ApiReturnValue<List<EventTeamModel>>> getEventTeam(String id,
      {http.Client client}) async {
    client ??= http.Client();

    Map<String, String> queryParams = {'id': id};

    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = baseUrlEventTeam + '?' + queryString;

    var response = await client.get(requestUrl);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service event team : $data');

    List<EventTeamModel> events = (data['results'] as Iterable)
        .map((e) => EventTeamModel.fromJson(e))
        .toList();
    return ApiReturnValue(value: events);
  }
}
