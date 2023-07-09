import 'chrome.dart';
export 'chrome.dart';

final _systemCpu = ChromeSystemCpu._();

extension ChromeChromeSystemCpuExtension on Chrome {
  ChromeSystemCpu get systemCpu => _systemCpu;
}

class ChromeSystemCpu {
  ChromeSystemCpu._();
}
