import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/browsing_data.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  test('removeCache', () async {
    var details = RemovalOptions();
    await chrome.browsingData.removeCache(details);
  });

  test('remove', () async {
    var details = RemovalOptions();
    await chrome.browsingData.remove(
      details,
      DataTypeSet(
          appcache: true,
          cache: true,
          cacheStorage: true,
          cookies: true,
          downloads: true,
          fileSystems: true,
          formData: true,
          history: true,
          indexedDB: true,
          localStorage: true,
          serverBoundCertificates: true,
          serviceWorkers: true,
          pluginData: true,
          passwords: true,
          webSQL: true),
    );
  });
}
