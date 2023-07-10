import 'chrome.dart';
export 'chrome.dart';

final _notifications = ChromeNotifications._();

extension ChromeChromeNotificationsExtension on Chrome {
  ChromeNotifications get notifications => _notifications;
}

class ChromeNotifications {
  ChromeNotifications._();

  /// Creates and displays a notification.
  /// |notificationId|: Identifier of the notification. If not set or empty, an
  /// ID will automatically be generated. If it matches an existing
  /// notification, this method first clears that notification before
  /// proceeding with the create operation. The identifier may not be longer
  /// than 500 characters.
  ///
  /// The `notificationId` parameter is required before Chrome 42.
  /// |options|: Contents of the notification.
  /// |callback|: Returns the notification id (either supplied or generated)
  /// that represents the created notification.
  ///
  /// The callback is required before Chrome 42.
  void create(
    notificationId,
    options,
  ) =>
      throw UnimplementedError();

  /// Updates an existing notification.
  /// |notificationId|: The id of the notification to be updated. This is
  /// returned by $(ref:notifications.create) method.
  /// |options|: Contents of the notification to update to.
  /// |callback|: Called to indicate whether a matching notification existed.
  ///
  /// The callback is required before Chrome 42.
  void update(
    notificationId,
    options,
  ) =>
      throw UnimplementedError();

  /// Clears the specified notification.
  /// |notificationId|: The id of the notification to be cleared. This is
  /// returned by $(ref:notifications.create) method.
  /// |callback|: Called to indicate whether a matching notification existed.
  ///
  /// The callback is required before Chrome 42.
  void clear(notificationId) => throw UnimplementedError();

  /// Retrieves all the notifications of this app or extension.
  /// |callback|: Returns the set of notification_ids currently in the system.
  void getAll() => throw UnimplementedError();

  /// Retrieves whether the user has enabled notifications from this app
  /// or extension.
  /// |callback|: Returns the current permission level.
  void getPermissionLevel() => throw UnimplementedError();

  /// The notification closed, either by the system or by user action.
  Stream get onClosed => throw UnimplementedError();

  /// The user clicked in a non-button area of the notification.
  Stream get onClicked => throw UnimplementedError();

  /// The user pressed a button in the notification.
  Stream get onButtonClicked => throw UnimplementedError();

  /// The user changes the permission level.  As of Chrome 47, only ChromeOS
  /// has UI that dispatches this event.
  Stream get onPermissionLevelChanged => throw UnimplementedError();

  /// The user clicked on a link for the app's notification settings.  As of
  /// Chrome 47, only ChromeOS has UI that dispatches this event.
  /// As of Chrome 65, that UI has been removed from ChromeOS, too.
  Stream get onShowSettings => throw UnimplementedError();
}

enum TemplateType {
  /// icon, title, message, expandedMessage, up to two buttons
  basic('basic'),

  /// icon, title, message, expandedMessage, image, up to two buttons
  image('image'),

  /// icon, title, message, items, up to two buttons. Users on Mac OS X only
  /// see the first item.
  list('list'),

  /// icon, title, message, progress, up to two buttons
  progress('progress');

  const TemplateType(this.value);

  final String value;
}

enum PermissionLevel {
  /// User has elected to show notifications from the app or extension.
  /// This is the default at install time.
  granted('granted'),

  /// User has elected not to show notifications from the app or extension.
  denied('denied');

  const PermissionLevel(this.value);

  final String value;
}
