import 'dart:typed_data';

import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/devtools_panels.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  test('create', () async {
    await Future.delayed(const Duration(minutes: 3));
    var panel = await chrome.devtools.panels.create('My panel', 'icon.png', 'index.html');
    await panel.createStatusBarButton('icon2.png', 'Tooltip', false);
  });

  //test('create sidebar', () async {
  //  var sidebar = await chrome.devtools.panels.elements.createSidebarPane('My panel');
  //   sidebar.setHeight('100px');
  //});
}
