import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:labten/main.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient((_) async =>
          http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));
      expect(await fetchAlbum(client), isA<Album>());
    });
    });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient((_) async => http.Response('Not Found', 404));

    expect(fetchAlbum(client), throwsException);
  });
}
