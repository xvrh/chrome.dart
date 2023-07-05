library simple_http_client_test;

import 'dart:async';
import 'dart:io';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../src/simple_http_client.dart';
import 'simple_http_client_test.mocks.dart';

@GenerateMocks([HttpClient, HttpClientRequest, HttpClientResponse])
void main() => defineTests();

void defineTests() {
  group('SimpleHttpClient', () {
    late SimpleHttpClient simpleClient;
    MockHttpClient mockClient;
    late MockHttpClientRequest mockRequest;
    MockHttpClientResponse mockResponse;
    late List<String> html;

    setUp(() {
      mockClient = new MockHttpClient();
      mockRequest = new MockHttpClientRequest();
      mockResponse = new MockHttpClientResponse();

      when(mockClient.getUrl(any)).thenAnswer((_) async => mockRequest);
      when(mockRequest.done).thenAnswer((_) => new Future(() => mockResponse));
      when(mockRequest.close()).thenAnswer((_) => Future.value(mockResponse));
      when(mockResponse.transform(any)).thenAnswer((_) async* {
        yield html.join('\n');
      });

      simpleClient = new SimpleHttpClient(client: mockClient);
    });

    test('returns string', () async {
      var testString = 'this is some great testHtml';
      html = [testString];

      expect(await simpleClient.getHtmlAtUri(Uri.parse('example.com')),
          testString);
    });
  });
}
