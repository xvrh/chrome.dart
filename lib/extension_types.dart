import 'chrome.dart';

final _ExtensionTypes = ChromeExtensionTypes._();

extension ChromeChromeExtensionTypesExtension on Chrome {
  ChromeExtensionTypes get ExtensionTypes => _ExtensionTypes;
}

class ChromeExtensionTypes {
  ChromeExtensionTypes._();
}
