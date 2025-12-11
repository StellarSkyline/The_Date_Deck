
import 'package:date_deck/feature/home/core/network/NetworkClient.dart';
import 'package:date_deck/feature/home/data/model/date.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'NetworkClient_test.mocks.dart';
import 'TestHelper.dart';

void main() {
  group('Repo getActive Test', () {
    test('Repo Get Active Dates Success', () async {
      final client = MockHttpClient();
      when(client.get(Uri.https(baseUrl,'/active.json')))
          .thenAnswer((_) async => http.Response(mockData, 200));

      expect(await HomeRepository(myNetworkClient: NetworkClient(client: client)).getActiveDates(), isA<List<Date>>());
    });

    test('Repo Get Active Dates Fail', () {
      final client = MockHttpClient();
      when(client.get(Uri.https(baseUrl,'/active.json')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(HomeRepository(myNetworkClient: NetworkClient(client: client)).getActiveDates(), throwsException);
    });
  });
}