import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/runtime.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  test('getURL', () async {
    var url = chrome.runtime.getURL('page.html');
    check(url)
      ..endsWith('page.html')
      ..startsWith('chrome-extension://');
  });

  test('getManifest', () async {
    var manifest = chrome.runtime.getManifest();
    check(manifest)
      ..['manifest_version'].equals(3)
      ..['version'].equals('1.0');
    check(manifest['background'] as Map).containsKey('service_worker');
    check(manifest['permissions'] as List).contains('action');
  });
}
