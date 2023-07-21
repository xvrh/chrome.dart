import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/browsing_data.dart';

void main() => setup(_tests);

void _tests() {
  test('removeCache', () async {
    var details = RemovalOptions();
    await chrome.browsingData.removeCache(details);
  });
}