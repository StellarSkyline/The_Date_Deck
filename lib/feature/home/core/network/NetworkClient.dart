import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

class NetworkClient {
  //Added Dependency injection for client for mock testing
  final Client _client;
  NetworkClient({required Client client}): _client = client;
  final baseUrl = 'the-date-deck-5bd88-default-rtdb.firebaseio.com';

  Future<Response> get(String category) async {
    final uri = Uri.https(baseUrl, '/$category.json');
    final response = await _client.get(uri);

    //handle error here
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Network Error');
    }
  }

  Future<Response> patch(String body, String category, String length) async {
    final uri = Uri.https(baseUrl, '/$category/$length.json');
    final response = await _client.patch(uri, body: body);

    if(response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Network Error');
    }

  }
}
