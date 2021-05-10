part of 'services.dart';

class EventServices {
  static Future<ApiReturnValue<List<EventsModel>>> getEvents(String id,
      {http.Client client}) async {
    client ??= http.Client();

    Map<String, String> queryParams = {'id': id};

    String queryString = Uri(queryParameters: queryParams).query;

    var requestUrl = baseUrlEvent + '?' + queryString;

    var response = await client.get(requestUrl);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again :(');
    }

    var data = jsonDecode(response.body);

    print('data dari service event : $data');

    List<EventsModel> events = (data['events'] as Iterable)
        .map((e) => EventsModel.fromJson(e))
        .toList();
    return ApiReturnValue(value: events);
  }
}
