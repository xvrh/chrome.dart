import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSNotificationsExtension on JSChrome {
  ///  Use the `chrome.notifications` API to create rich notifications
  ///  using templates and show these notifications to users in the system tray.
  external JSNotifications get notifications;
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
  external void create(
    String notificationId,
    NotificationOptions options,
    JSFunction callback,
  );

  ///  Updates an existing notification.
  ///  |notificationId|: The id of the notification to be updated. This is
  ///  returned by $(ref:notifications.create) method.
  ///  |options|: Contents of the notification to update to.
  ///  |callback|: Called to indicate whether a matching notification existed.
  ///
  ///  The callback is required before Chrome 42.
  external void update(
    String notificationId,
    NotificationOptions options,
    JSFunction callback,
  );

  ///  Clears the specified notification.
  ///  |notificationId|: The id of the notification to be cleared. This is
  ///  returned by $(ref:notifications.create) method.
  ///  |callback|: Called to indicate whether a matching notification existed.
  ///
  ///  The callback is required before Chrome 42.
  external void clear(
    String notificationId,
    JSFunction callback,
  );

  ///  Retrieves all the notifications of this app or extension.
  ///  |callback|: Returns the set of notification_ids currently in the system.
  external void getAll(JSFunction callback);

  ///  Retrieves whether the user has enabled notifications from this app
  ///  or extension.
  ///  |callback|: Returns the current permission level.
  external void getPermissionLevel(JSFunction callback);

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

typedef TemplateType = JSString;

typedef PermissionLevel = JSString;

@JS()
@staticInterop
class NotificationItem {
  ///  Title of one item of a list notification.
  external String get title;

  ///  Additional details about this item.
  external String get message;
}

@JS()
@staticInterop
class NotificationBitmap {
  external int get width;

  external int get height;

  external JSArrayBuffer? get data;
}

@JS()
@staticInterop
class NotificationButton {
  external String get title;

  external String? get iconUrl;

  external NotificationBitmap? get iconBitmap;
}

@JS()
@staticInterop
class NotificationOptions {
  ///  Which type of notification to display.
  ///  <em>Required for $(ref:notifications.create)</em> method.
  external TemplateType? get type;

  ///  A URL to the sender's avatar, app icon, or a thumbnail for image
  ///  notifications.
  ///
  ///  URLs can be a data URL, a blob URL, or a URL relative to a resource
  ///  within this extension's .crx file
  ///  <em>Required for $(ref:notifications.create)</em> method.
  external String? get iconUrl;

  external NotificationBitmap? get iconBitmap;

  ///  A URL to the app icon mask. URLs have the same restrictions as
  ///  $(ref:notifications.NotificationOptions.iconUrl iconUrl).
  ///
  ///  The app icon mask should be in alpha channel, as only the alpha channel
  ///  of the image will be considered.
  external String? get appIconMaskUrl;

  external NotificationBitmap? get appIconMaskBitmap;

  ///  Title of the notification (e.g. sender name for email).
  ///  <em>Required for $(ref:notifications.create)</em> method.
  external String? get title;

  ///  Main notification content.
  ///  <em>Required for $(ref:notifications.create)</em> method.
  external String? get message;

  ///  Alternate notification content with a lower-weight font.
  external String? get contextMessage;

  ///  Priority ranges from -2 to 2. -2 is lowest priority. 2 is highest. Zero
  ///  is default.  On platforms that don't support a notification center
  ///  (Windows, Linux & Mac), -2 and -1 result in an error as notifications
  ///  with those priorities will not be shown at all.
  external int? get priority;

  ///  A timestamp associated with the notification, in milliseconds past the
  ///  epoch (e.g. `Date.now() + n`).
  external double? get eventTime;

  ///  Text and icons for up to two notification action buttons.
  external JSArray? get buttons;

  ///  Secondary notification content.
  external String? get expandedMessage;

  ///  A URL to the image thumbnail for image-type notifications.
  ///  URLs have the same restrictions as
  ///  $(ref:notifications.NotificationOptions.iconUrl iconUrl).
  external String? get imageUrl;

  external NotificationBitmap? get imageBitmap;

  ///  Items for multi-item notifications. Users on Mac OS X only see the first
  ///  item.
  external JSArray? get items;

  ///  Current progress ranges from 0 to 100.
  external int? get progress;

  external bool? get isClickable;

  ///  Indicates that the notification should remain visible on screen until the
  ///  user activates or dismisses the notification. This defaults to false.
  external bool? get requireInteraction;

  ///  Indicates that no sounds or vibrations should be made when the
  ///  notification is being shown. This defaults to false.
  external bool? get silent;
}
