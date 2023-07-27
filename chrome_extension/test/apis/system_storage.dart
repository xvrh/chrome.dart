import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/system_storage.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  test('getInfo', () async {
    var info = await chrome.system.storage.getInfo();
    check(info).isNotEmpty();
    check(info.first.name).isNotEmpty();
    check(info.first.capacity).isGreaterThan(0);
    check(info.first.type).isNotNull();
  });

  test('getAvailableCapacity', () async {
    var storages = await chrome.system.storage.getInfo();
    var firstStorage = storages.first;
    var capacity = await chrome.system.storage.getAvailableCapacity(firstStorage.id);
    check(capacity.id).equals(firstStorage.id);
    check(capacity.availableCapacity).isGreaterOrEqual(0);
  });
}
