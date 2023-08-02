import 'dart:async';

import 'package:checks/checks.dart';
import 'package:chrome_apis/src/internal_helpers.dart';
import 'package:test/test.dart';
import 'package:web/web.dart' as web;
import '../../runner/runner_client.dart';
import 'package:chrome_apis/runtime.dart';
import 'package:chrome_apis/tabs.dart' as tabs;

void main() => setup(_tests);

void _tests(TestContext context) {
  test('getURL', () async {
    var url = chrome.runtime.getURL('page.html');
    check(url)
      ..endsWith('page.html')
      ..startsWith('chrome-extension://');
  });

  test('getManifest', () async {
    var manifest = chrome.runtime.getManifest();
    check(manifest)
      ..['manifest_version'].equals(3)
      ..['version'].equals('2.0');
    check(manifest['background'] as Map).containsKey('service_worker');
    check(manifest['permissions'] as List).contains('tabs');
  });

  test('sendMessage string to content script', () async {
    var [tab] = await chrome.tabs
        .query(tabs.QueryInfo(active: true, lastFocusedWindow: true));

    var response = await chrome.tabs.sendMessage(tab.id!, 'My message', null);

    check(response as Map).deepEquals({'response': 'My message'});
  });

  test('sendMessage complex to content script', () async {
    var [tab] = await chrome.tabs
        .query(tabs.QueryInfo(active: true, lastFocusedWindow: true));
    var response =
        await chrome.tabs.sendMessage(tab.id!, {'a': 1, 'b': true}, null);

    check(response as Map).deepEquals({
      'response': {'a': 1, 'b': true}
    });
  });
}
