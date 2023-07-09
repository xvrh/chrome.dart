import 'chrome.dart';

final _Notifications = ChromeNotifications._();

extension ChromeChromeNotificationsExtension on Chrome {
  ChromeNotifications get Notifications => _Notifications;
}

class ChromeNotifications {
  ChromeNotifications._();
}
