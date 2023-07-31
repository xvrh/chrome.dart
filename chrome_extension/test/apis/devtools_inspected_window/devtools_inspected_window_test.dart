import 'package:test/test.dart';

import '../../runner.dart';

void main() {
  test('chrome.devtools.inspectedWindow', () {
    return runTests(
      'test/apis/devtools_inspected_window',
      devtools: true,
      afterBrowserOpen: (browser) async {
        var page = await browser.newPage();
        await page.goto('https://dart.dev');
      },
    );
  });
}
