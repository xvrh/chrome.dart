import 'chrome.dart';
export 'chrome.dart';

final _tabCapture = ChromeTabCapture._();

extension ChromeChromeTabCaptureExtension on Chrome {
  ChromeTabCapture get tabCapture => _tabCapture;
}

class ChromeTabCapture {
  ChromeTabCapture._();
}

enum TabCaptureState {
  pending('pending'),
  active('active'),
  stopped('stopped'),
  error('error');

  const TabCaptureState(this.value);

  final String value;
}
