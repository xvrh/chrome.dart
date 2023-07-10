import 'chrome.dart';
export 'chrome.dart';

final _pageCapture = ChromePageCapture._();

extension ChromePageCaptureExtension on Chrome {
  ChromePageCapture get pageCapture => _pageCapture;
}

class ChromePageCapture {
  ChromePageCapture._();

  /// Saves the content of the tab with given id as MHTML.
  void saveAsMHTML(
    details,
    callback,
  ) =>
      throw UnimplementedError();
}
