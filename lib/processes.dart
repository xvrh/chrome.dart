import 'chrome.dart';

final _Processes = ChromeProcesses._();

extension ChromeChromeProcessesExtension on Chrome {
  ChromeProcesses get Processes => _Processes;
}

class ChromeProcesses {
  ChromeProcesses._();
}
