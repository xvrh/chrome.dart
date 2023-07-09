import 'chrome.dart';
export 'chrome.dart';

final _instanceID = ChromeInstanceID._();

extension ChromeChromeInstanceIDExtension on Chrome {
  ChromeInstanceID get instanceID => _instanceID;
}

class ChromeInstanceID {
  ChromeInstanceID._();
}
