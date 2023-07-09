import 'chrome.dart';

final _Runtime = ChromeRuntime._();

extension ChromeChromeRuntimeExtension on Chrome {
  ChromeRuntime get Runtime => _Runtime;
}

class ChromeRuntime {
  ChromeRuntime._();
}
