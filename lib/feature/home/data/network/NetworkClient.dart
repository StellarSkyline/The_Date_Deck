import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';

class NetworkClient {
  //Added Dependency injection for client for mock testing
  final Client _client;

  NetworkClient({required Client client}) : _client = client;
  final baseUrl = 'the-date-deck-5bd88-default-rtdb.firebaseio.com';

  Future<Response> get(String category) async {
    final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
    final querey = {'auth': idToken};

    final uri = Uri.https(baseUrl, '/$category.json', querey);
    final response = await _client.get(uri);

    //handle error here
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Network Error');
    }
  }

  Future<Response> patch(String body, String category, String length) async {
    final idToken = await FirebaseAuth.instance.currentUser?.getIdToken();

    final querey = {'auth': idToken};

    final uri = Uri.https(baseUrl, '/$category/$length.json', querey);
    final response = await _client.patch(uri, body: body);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Network Error');
    }
  }
}
