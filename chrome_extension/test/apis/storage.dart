import 'package:checks/checks.dart';
import 'package:chrome_apis/storage.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  tearDown(() async {
    await chrome.storage.sync.clear();
  });

  test('sync', () async {
    "chrome.storage.sync.MAX_ITEMS;";
    var storage = chrome.storage.sync;
    await storage.set({'key': 'value', 1: 2, true: false, null: null});

    var one = await storage.get(['key']);
    check(one).length.equals(1);
    check(one).containsKey('key');
    check(one)['key'].equals('value');
  });
}
