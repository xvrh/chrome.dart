import 'chrome.dart';

final _SystemCpu = ChromeSystemCpu._();

extension ChromeChromeSystemCpuExtension on Chrome {
  ChromeSystemCpu get SystemCpu => _SystemCpu;
}

class ChromeSystemCpu {
  ChromeSystemCpu._();
}
