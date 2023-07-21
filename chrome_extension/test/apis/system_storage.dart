import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/system_storage.dart';

void main() => setup(_tests);

void _tests() {
  test('getInfo', () async {
    var info = await chrome.system.storage.getInfo();
    check(info).isNotEmpty();
    check(info.first.name).isNotEmpty();
    check(info.first.capacity).isGreaterThan(0);
    check(info.first.type).isNotNull();
  });
}
