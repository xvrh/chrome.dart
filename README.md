# chrome_apis

A library for accessing the `chrome.*` [APIs](https://developer.chrome.com/docs/extensions/reference/) available in Chrome extensions.
This allows to build Chrome extension with Dart/Flutter and to interop with the native APIs easily with a high-level type-safe interface.

The JS interop is build on top of `dart:js_interop` (static interop) which make it ready for future WASM compilation. 

## Using the library

```dart
import 'package:chrome_apis/alarms.dart';
import 'package:chrome_apis/power.dart';
import 'package:chrome_apis/storage.dart';

void main() async {
  // Use the chrome.power API
  chrome.power.requestKeepAwake(Level.display);

  // Use the chrome.storage API
  await chrome.storage.sync.set({'mykey': 'value'});
  var values = await chrome.storage.sync.get(null /* all */);
  print(values['mykey']);

  // Use the chrome.alarms API
  await chrome.alarms.create('MyAlarm', AlarmCreateInfo(delayInMinutes: 2));
}
```

### Chrome extension in Flutter

[See example]()

### Available APIs

- `package:chrome_apis/accessibility_features.dart` ([Doc](), [API reference]())

## Documentation

* [Chrome Extensions API reference](https://developer.chrome.com/docs/extensions/reference/)
* See [examples](https://github.com/xvrh/chrome.dart/tree/master/chrome_apis/example/)