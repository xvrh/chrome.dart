import 'package:checks/checks.dart';
import 'package:chrome_apis/system_display.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  test('getInfo singleUnified: true', () async {
    var units =
        await chrome.system.display.getInfo(GetInfoFlags(singleUnified: true));
    check(units).length.equals(1);
    check(units.first.name).isNotNull();
    check(units.first.id).isNotNull();
    check(units.first.displayZoomFactor).isGreaterThan(0);
    "Need access to bound properties";
    check(units.first.workArea).isNotNull();
    check(units.first.dpiX).isNotNull();
    check(units.first.dpiY).isNotNull();
    check(units.first.hasAccelerometerSupport).isNotNull();
    check(units.first.hasTouchSupport).isNotNull();
    check(units.first.availableDisplayZoomFactors).isNotEmpty();
  });

  test('getInfo singleUnified: false', () async {
    var units = await chrome.system.display.getInfo(GetInfoFlags());
    check(units).length.isGreaterOrEqual(1);
  });
}
