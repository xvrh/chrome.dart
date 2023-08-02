import 'dart:typed_data';

import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../../runner/runner_client.dart';
import 'package:chrome_apis/permissions.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  test('getAll', () async {
    var permissions = await chrome.permissions.getAll();
    "need access to the list";
  });
}
