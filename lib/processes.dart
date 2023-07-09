import 'chrome.dart';
export 'chrome.dart';

final _processes = ChromeProcesses._();

extension ChromeChromeProcessesExtension on Chrome {
  ChromeProcesses get processes => _processes;
}

class ChromeProcesses {
  ChromeProcesses._();
}

///  The types of the browser processes.
enum ProcessType {
  browser('browser'),
  renderer('renderer'),
  extension('extension'),
  notification('notification'),
  plugin('plugin'),
  worker('worker'),
  nacl('nacl'),
  serviceWorker('service_worker'),
  utility('utility'),
  gpu('gpu'),
  other('other');

  const ProcessType(this.value);

  final String value;
}
