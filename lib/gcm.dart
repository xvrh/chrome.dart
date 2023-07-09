import 'chrome.dart';
export 'chrome.dart';

final _gcm = ChromeGcm._();

extension ChromeChromeGcmExtension on Chrome {
  ChromeGcm get gcm => _gcm;
}

class ChromeGcm {
  ChromeGcm._();
}
