import 'dart:typed_data';

import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../../runner/runner_client.dart';
import 'package:chrome_apis/notifications.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  test('create', () async {
    var id = await chrome.notifications.create(
        'myid',
        NotificationOptions(
            type: TemplateType.basic,
            iconUrl: 'icon.png',
            message: 'Message',
            title: 'Text'));
    check(id).equals('myid');
  }, skip: 'Cannot make the permission working yet');
}
