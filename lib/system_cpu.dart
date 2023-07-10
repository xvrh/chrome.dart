import 'chrome.dart';
export 'chrome.dart';

final _systemCpu = ChromeSystemCpu._();

extension ChromeChromeSystemCpuExtension on Chrome {
  ChromeSystemCpu get systemCpu => _systemCpu;
}

class ChromeSystemCpu {
  ChromeSystemCpu._();

  ///  Queries basic CPU information of the system.
  void getInfo() => throw UnimplementedError();
}
