import 'chrome.dart';

final _DesktopCapture = ChromeDesktopCapture._();

extension ChromeChromeDesktopCaptureExtension on Chrome {
  ChromeDesktopCapture get DesktopCapture => _DesktopCapture;
}

class ChromeDesktopCapture {
  ChromeDesktopCapture._();
}
