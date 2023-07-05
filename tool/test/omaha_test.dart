library omaha_test;

import 'dart:async';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../src/omaha.dart';
import '../src/simple_http_client.dart';
import 'omaha_test.mocks.dart';

@GenerateMocks([SimpleHttpClient])
void main() => defineTests();

void defineTests() {
  group('OmahaVersionExtractor', () {
    late OmahaVersionExtractor extractor;
    MockSimpleHttpClient client;
    late String html;

    setUp(() {
      client = new MockSimpleHttpClient();
      when(client.getHtmlAtUri(any)).thenAnswer((_) => new Future.value(html));
      extractor = new OmahaVersionExtractor(client: client);
    });

    test('correctly parses good, simple input', () async {
      var version = 'alpha';
      html = 'mac,stable,$version';

      expect(await extractor.stableVersion, version);
    });
  });
}
