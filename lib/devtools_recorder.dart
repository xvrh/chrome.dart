import 'chrome.dart';

final _DevtoolsRecorder = ChromeDevtoolsRecorder._();

extension ChromeChromeDevtoolsRecorderExtension on Chrome {
  ChromeDevtoolsRecorder get DevtoolsRecorder => _DevtoolsRecorder;
}

class ChromeDevtoolsRecorder {
  ChromeDevtoolsRecorder._();
}
