import 'chrome.dart';
export 'chrome.dart';

final _systemMemory = ChromeSystemMemory._();

extension ChromeChromeSystemMemoryExtension on Chrome {
  ChromeSystemMemory get systemMemory => _systemMemory;
}

class ChromeSystemMemory {
  ChromeSystemMemory._();

  /// Get physical memory information.
  void getInfo() => throw UnimplementedError();
}
