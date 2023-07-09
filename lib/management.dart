import 'chrome.dart';

final _Management = ChromeManagement._();

extension ChromeChromeManagementExtension on Chrome {
  ChromeManagement get Management => _Management;
}

class ChromeManagement {
  ChromeManagement._();
}
