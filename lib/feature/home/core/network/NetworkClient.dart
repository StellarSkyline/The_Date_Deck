import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

class NetworkClient {
  final baseUrl = 'the-date-deck-5bd88-default-rtdb.firebaseio.com';

  Future<Response> get(String category) async {
    final uri = Uri.https(baseUrl, '/$category.json');
    final response = await http.get(uri);

    //handle error here
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Network Error');
    }
  }

  Future<Response> patch(String body, String category, String length) async {
    final uri = Uri.https(baseUrl, '/$category/$length.json');
    final response = await http.patch(uri, body: body);

    if(response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Network Error');
    }

  }
}
