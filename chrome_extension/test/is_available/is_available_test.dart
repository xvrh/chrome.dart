import 'package:test/test.dart';

import '../runner.dart';

void main() {
  test('chrome.*.isAvailable', () => runTests('test/check_available'));
}
