import 'chrome.dart';

final _Permissions = ChromePermissions._();

extension ChromeChromePermissionsExtension on Chrome {
  ChromePermissions get Permissions => _Permissions;
}

class ChromePermissions {
  ChromePermissions._();
}
