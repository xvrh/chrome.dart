import 'chrome.dart';
export 'chrome.dart';

final _permissions = ChromePermissions._();

extension ChromeChromePermissionsExtension on Chrome {
  ChromePermissions get permissions => _permissions;
}

class ChromePermissions {
  ChromePermissions._();
}
