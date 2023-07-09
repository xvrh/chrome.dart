import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSNotificationsExtension on JSChrome {
  ///  Use the `chrome.notifications` API to create rich notifications
  ///  using templates and show these notifications to users in the system tray.
  external JSNotifications get Notifications;
}

@JS()
@staticInterop
class JSNotifications {}

extension JSNotificationsExtension on JSNotifications {
  ///  Creates and displays a notification.
  ///  |notificationId|: Identifier of the notification. If not set or empty, an
  ///  ID will automatically be generated. If it matches an existing
  ///  notification, this method first clears that notification before
  ///  proceeding with the create operation. The identifier may not be longer
  ///  than 500 characters.
  ///
  ///  The `notificationId` parameter is required before Chrome 42.
  ///  |options|: Contents of the notification.
  ///  |callback|: Returns the notification id (either supplied or generated)
  ///  that represents the created notification.
  ///
  ///  The callback is required before Chrome 42.
  external void create();

  ///  Updates an existing notification.
  ///  |notificationId|: The id of the notification to be updated. This is
  ///  returned by $(ref:notifications.create) method.
  ///  |options|: Contents of the notification to update to.
  ///  |callback|: Called to indicate whether a matching notification existed.
  ///
  ///  The callback is required before Chrome 42.
  external void update();

  ///  Clears the specified notification.
  ///  |notificationId|: The id of the notification to be cleared. This is
  ///  returned by $(ref:notifications.create) method.
  ///  |callback|: Called to indicate whether a matching notification existed.
  ///
  ///  The callback is required before Chrome 42.
  external void clear();

  ///  Retrieves all the notifications of this app or extension.
  ///  |callback|: Returns the set of notification_ids currently in the system.
  external void getAll();

  ///  Retrieves whether the user has enabled notifications from this app
  ///  or extension.
  ///  |callback|: Returns the current permission level.
  external void getPermissionLevel();

  ///  The notification closed, either by the system or by user action.
  external ChromeEvent get onClosed;

  ///  The user clicked in a non-button area of the notification.
  external ChromeEvent get onClicked;

  ///  The user pressed a button in the notification.
  external ChromeEvent get onButtonClicked;

  ///  The user changes the permission level.  As of Chrome 47, only ChromeOS
  ///  has UI that dispatches this event.
  external ChromeEvent get onPermissionLevelChanged;

  ///  The user clicked on a link for the app's notification settings.  As of
  ///  Chrome 47, only ChromeOS has UI that dispatches this event.
  ///  As of Chrome 65, that UI has been removed from ChromeOS, too.
  external ChromeEvent get onShowSettings;
}
