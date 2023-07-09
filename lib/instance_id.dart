import 'chrome.dart';

final _InstanceID = ChromeInstanceID._();

extension ChromeChromeInstanceIDExtension on Chrome {
  ChromeInstanceID get InstanceID => _InstanceID;
}

class ChromeInstanceID {
  ChromeInstanceID._();
}
