import 'dart:async';

import 'package:checks/checks.dart';
import 'package:checks/context.dart';
import 'package:puppeteer/puppeteer.dart';
import 'package:test/test.dart';
import 'package:chrome_apis/tabs.dart';
import '../runner_client.dart';
import 'package:async/async.dart';

void main() => runTests(_tests);

void _tests(TestContext context) {
  test('connect to puppeteer', () async {
    var onNewTab = chrome.tabs.onCreated.first;

    var browser =
        await puppeteer.connect(browserWsEndpoint: context.puppeteerUrl);
    var page = await browser.newPage();
    await onNewTab;

    var onRemovedTab = chrome.tabs.onRemoved.first;
    await page.close();
    await onRemovedTab;
  });

  test('use static assets server', () async {
    var browser =
        await puppeteer.connect(browserWsEndpoint: context.puppeteerUrl);

    var completer = Completer();
    chrome.tabs.onUpdated.listen((event) {
      print("Title ${event.changeInfo.title}");
      if (event.changeInfo.title == 'Simple page') {
        completer.complete();
      }
    });

    var page = await browser.newPage();
    await page.goto(context.staticPath('assets/simple_page.html'));

    await completer.future;
    //print('Dispatched: ${onTabUpdated.eventsDispatched}');
//
    //while (await onTabUpdated.hasNext) {
    //  var onUpdated = await onTabUpdated.next;
    //  if (onUpdated.changeInfo.title == 'Simple page') {
    //    break;
    //  }
    //}
  }, solo: true);
}
