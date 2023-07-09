import 'chrome.dart';

final _TabCapture = ChromeTabCapture._();

extension ChromeChromeTabCaptureExtension on Chrome {
  ChromeTabCapture get TabCapture => _TabCapture;
}

class ChromeTabCapture {
  ChromeTabCapture._();
}
