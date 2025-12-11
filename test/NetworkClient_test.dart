import 'package:date_deck/feature/home/core/network/NetworkClient.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'NetworkClient_test.mocks.dart';
import 'TestHelper.dart';

@GenerateMocks([], customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {

  group('Network Client Test GET', () {
    test('get Date Success', () async {
      final client = MockHttpClient();
      when(client.get(Uri.https(baseUrl,'/active.json')))
          .thenAnswer((_) async => http.Response(mockData, 200));

      expect(await NetworkClient(client: client).get('active'), isA<http.Response>());
    });

    test('get Date Fail', () {
      final client = MockHttpClient();
      when(
        client.get(Uri.https(baseUrl, '/active.json')),
      ).thenAnswer((_) async => http.Response('Not Found', 404));
      expect(NetworkClient(client: client).get('active'), throwsException);
    });

  });

}
