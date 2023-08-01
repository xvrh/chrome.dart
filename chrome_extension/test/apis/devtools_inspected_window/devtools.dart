import 'package:checks/checks.dart';
import 'package:puppeteer/puppeteer.dart';
import 'package:test/test.dart';

import 'package:chrome_apis/devtools_inspected_window.dart';

import '../../runner_client.dart';

void main() => runTests(_tests);

void _tests(TestContext context) {
  test('tabId', () async {
    var tabId = await chrome.devtools.inspectedWindow.tabId;
    check(tabId).isGreaterThan(0);
  });

  test('getResources', () async {
    var resources = await chrome.devtools.inspectedWindow.getResources();
    check(resources).isNotEmpty();
    check(resources.first.url).isNotEmpty();
    print("Resource ${resources.first.url}");

    var content = await resources.first.getContent();
    print("Got content ${content.content.length}");

    print("Will eval agag");
    try {
      var result = await chrome.devtools.inspectedWindow
          // .eval("console.log('from test')", EvalOptions());
          .eval("true", null);
      print('After eval');
      await Future.delayed(const Duration(milliseconds: 100));
      print(result.result);
      print(result.exceptionInfo?.isError);
      print(result.exceptionInfo?.isException);
      print(result.exceptionInfo?.value);
      print(result.exceptionInfo?.code);
      print(result.exceptionInfo?.description);
      print(result.exceptionInfo?.details);
      print("Will connect to ${context.puppeteerUrl}");
    } catch (e) {
      print("Error $e");
    }
    return;
    //var browser =
    //    await puppeteer.connect(browserWsEndpoint: context.puppeteerUrl);
    //print("After connect");
    //var page = await browser.newPage();
    //await page.bringToFront();
    //await page.goto('https://google.com');
//
    //var resources = await chrome.devtools.inspectedWindow.getResources();
    //check(resources).isNotEmpty();
    //check(resources.first.url).isNotEmpty();
    //print("Resource ${resources.first.url}");
//
    //var content = await resources.first.getContent();
    //print("Content $content");
  });
}
