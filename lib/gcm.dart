import 'chrome.dart';

final _Gcm = ChromeGcm._();

extension ChromeChromeGcmExtension on Chrome {
  ChromeGcm get Gcm => _Gcm;
}

class ChromeGcm {
  ChromeGcm._();
}
