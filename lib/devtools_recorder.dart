import 'chrome.dart';
export 'chrome.dart';

final _devtoolsRecorder = ChromeDevtoolsRecorder._();

extension ChromeChromeDevtoolsRecorderExtension on Chrome {
  ChromeDevtoolsRecorder get devtoolsRecorder => _devtoolsRecorder;
}

class ChromeDevtoolsRecorder {
  ChromeDevtoolsRecorder._();
}
