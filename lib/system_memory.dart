import 'chrome.dart';

final _SystemMemory = ChromeSystemMemory._();

extension ChromeChromeSystemMemoryExtension on Chrome {
  ChromeSystemMemory get SystemMemory => _SystemMemory;
}

class ChromeSystemMemory {
  ChromeSystemMemory._();
}
