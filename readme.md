# chrome.dart

[![Build Status](https://travis-ci.org/dart-gde/chrome.dart.svg?branch=master)](https://travis-ci.org/dart-gde/chrome.dart)

A library for accessing the `chrome.*` APIs available in Chrome extensions.

## Installing

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  chrome:
```

## Using the library

```dart
import 'package:chrome/chrome_app.dart' as chrome;

void main() {
  chrome.runtime.getPlatformInfo().then((Map m) {
    print(m.toString());
  });
}
```

### Chrome extension in Flutter

[See example]

Also, see the [FAQ](https://github.com/dart-gde/chrome.dart/wiki/FAQ).

## Documentation
Documentation is available at:

* [Chrome Apps
  API](http://www.dartdocs.org/documentation/chrome/latest/index.html#chrome/chrome_app)
* [Chrome Extensions
  API](http://www.dartdocs.org/documentation/chrome/latest/index.html#chrome/chrome_ext)

