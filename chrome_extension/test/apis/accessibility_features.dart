import 'package:checks/checks.dart';
import 'package:chrome_apis/types.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/accessibility_features.dart';

void main() => setup(_tests);

void _tests() {
  test('largeCursor', () async {
    var largeCursor =
        await chrome.accessibilityFeatures.animationPolicy.get(GetDetails());
    check(largeCursor.value).equals('allowed');
    check(largeCursor.incognitoSpecific).equals(null);
  });
}
