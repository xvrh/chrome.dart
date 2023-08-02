import 'dart:js_interop';

import 'package:chrome_apis/runtime.dart';

void main() {
  chrome.runtime.onMessage.listen((event) {
    event.sendResponse({'response': event.message});

    "Check when this handler returns true, we can send the response later. We need to create"
        "a special EventStream with a 'listenWithReturn'";
  });
}
