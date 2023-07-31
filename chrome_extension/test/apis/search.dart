import 'dart:async';
import 'dart:typed_data';

import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/search.dart';
import 'package:chrome_apis/tabs.dart' as tabs;

void main() => setup(_tests);

void _tests(TestContext context) {
  test('query', () async {
    late StreamSubscription subscription;
    subscription = chrome.tabs.onCreated.listen(expectAsync1((e) {
      subscription.cancel();
    }));
    await chrome.search.query(
        QueryInfo(text: 'who is the rabbit?', disposition: Disposition.newTab));
  });
}
