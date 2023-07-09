import 'chrome.dart';

final _PageCapture = ChromePageCapture._();

extension ChromeChromePageCaptureExtension on Chrome {
  ChromePageCapture get PageCapture => _PageCapture;
}

class ChromePageCapture {
  ChromePageCapture._();
}
