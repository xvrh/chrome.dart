import 'chrome.dart';
export 'chrome.dart';

final _pageCapture = ChromePageCapture._();

extension ChromeChromePageCaptureExtension on Chrome {
  ChromePageCapture get pageCapture => _pageCapture;
}

class ChromePageCapture {
  ChromePageCapture._();
}
