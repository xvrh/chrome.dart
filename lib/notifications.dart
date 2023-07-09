import 'chrome.dart';
export 'chrome.dart';

final _notifications = ChromeNotifications._();

extension ChromeChromeNotificationsExtension on Chrome {
  ChromeNotifications get notifications => _notifications;
}

class ChromeNotifications {
  ChromeNotifications._();
}

enum TemplateType {
  ///  icon, title, message, expandedMessage, up to two buttons
  basic('basic'),

  ///  icon, title, message, expandedMessage, image, up to two buttons
  image('image'),

  ///  icon, title, message, items, up to two buttons. Users on Mac OS X only
  ///  see the first item.
  list('list'),

  ///  icon, title, message, progress, up to two buttons
  progress('progress');

  const TemplateType(this.value);

  final String value;
}

enum PermissionLevel {
  ///  User has elected to show notifications from the app or extension.
  ///  This is the default at install time.
  granted('granted'),

  ///  User has elected not to show notifications from the app or extension.
  denied('denied');

  const PermissionLevel(this.value);

  final String value;
}
