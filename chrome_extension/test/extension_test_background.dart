import 'dart:async';
import 'dart:js_interop';
import 'package:test/test.dart';

import 'test_context_menus.dart';
import 'test_tabs.dart';

void main() async {
  // steps:
  //  - extension_test: compile this file with dart2js, ddc & possibly wasm/flutter
  //  - put the result in a temporary folder with the manifest
  //  - Connect to puppeteer from the test here (that will allow to make some verification on the correctness?).
  //  -

  isReady = true;
  startFunction = () {
    group('chrome.tabs', testTabs, timeout: Timeout(Duration(seconds: 5)));
    group('chrome.context_menus', testContextMenus);
  }.toJS;
}

@JS()
@staticInterop
external bool isReady;

@JS()
@staticInterop
external JSFunction? startFunction;
