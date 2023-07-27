import 'dart:typed_data';

import 'src/internal_helpers.dart';
import 'src/js/notifications.dart' as $js;

export 'src/chrome.dart' show chrome;

final _notifications = ChromeNotifications._();

extension ChromeNotificationsExtension on Chrome {
  /// Use the `chrome.notifications` API to create rich notifications
  /// using templates and show these notifications to users in the system tray.
  ChromeNotifications get notifications => _notifications;
}

class ChromeNotifications {
  ChromeNotifications._();

  bool get isAvailable => $js.chrome.notificationsNullable != null;

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
  Future<String> create(
    String? notificationId,
    NotificationOptions options,
  ) {
    var $completer = Completer<String>();
    $js.chrome.notifications.create(
      notificationId,
      options.toJS,
      (String notificationId) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(notificationId);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Updates an existing notification.
  /// |notificationId|: The id of the notification to be updated. This is
  /// returned by [notifications.create] method.
  /// |options|: Contents of the notification to update to.
  /// |callback|: Called to indicate whether a matching notification existed.
  ///
  /// The callback is required before Chrome 42.
  Future<bool> update(
    String notificationId,
    NotificationOptions options,
  ) {
    var $completer = Completer<bool>();
    $js.chrome.notifications.update(
      notificationId,
      options.toJS,
      (bool wasUpdated) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(wasUpdated);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears the specified notification.
  /// |notificationId|: The id of the notification to be cleared. This is
  /// returned by [notifications.create] method.
  /// |callback|: Called to indicate whether a matching notification existed.
  ///
  /// The callback is required before Chrome 42.
  Future<bool> clear(String notificationId) {
    var $completer = Completer<bool>();
    $js.chrome.notifications.clear(
      notificationId,
      (bool wasCleared) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(wasCleared);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Retrieves all the notifications of this app or extension.
  /// |callback|: Returns the set of notification_ids currently in the system.
  Future<Object> getAll() {
    var $completer = Completer<Object>();
    $js.chrome.notifications.getAll((JSAny notifications) {
      if (checkRuntimeLastError($completer)) {
        $completer.complete(notifications);
      }
    }.toJS);
    return $completer.future;
  }

  /// Retrieves whether the user has enabled notifications from this app
  /// or extension.
  /// |callback|: Returns the current permission level.
  Future<PermissionLevel> getPermissionLevel() {
    var $completer = Completer<PermissionLevel>();
    $js.chrome.notifications.getPermissionLevel(($js.PermissionLevel level) {
      if (checkRuntimeLastError($completer)) {
        $completer.complete(PermissionLevel.fromJS(level));
      }
    }.toJS);
    return $completer.future;
  }

  /// The notification closed, either by the system or by user action.
  Stream<OnClosedEvent> get onClosed =>
      $js.chrome.notifications.onClosed.asStream(($c) => (
            String notificationId,
            bool byUser,
          ) {
            $c.add(OnClosedEvent(
              notificationId: notificationId,
              byUser: byUser,
            ));
          }.toJS);

  /// The user clicked in a non-button area of the notification.
  Stream<String> get onClicked => $js.chrome.notifications.onClicked
      .asStream(($c) => (String notificationId) {
            $c.add(notificationId);
          }.toJS);

  /// The user pressed a button in the notification.
  Stream<OnButtonClickedEvent> get onButtonClicked =>
      $js.chrome.notifications.onButtonClicked.asStream(($c) => (
            String notificationId,
            int buttonIndex,
          ) {
            $c.add(OnButtonClickedEvent(
              notificationId: notificationId,
              buttonIndex: buttonIndex,
            ));
          }.toJS);

  /// The user changes the permission level.  As of Chrome 47, only ChromeOS
  /// has UI that dispatches this event.
  Stream<PermissionLevel> get onPermissionLevelChanged =>
      $js.chrome.notifications.onPermissionLevelChanged
          .asStream(($c) => ($js.PermissionLevel level) {
                $c.add(PermissionLevel.fromJS(level));
              }.toJS);

  /// The user clicked on a link for the app's notification settings.  As of
  /// Chrome 47, only ChromeOS has UI that dispatches this event.
  /// As of Chrome 65, that UI has been removed from ChromeOS, too.
  Stream<void> get onShowSettings =>
      $js.chrome.notifications.onShowSettings.asStream(($c) => () {
            $c.add(null);
          }.toJS);
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

  String get toJS => value;
  static TemplateType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum PermissionLevel {
  /// User has elected to show notifications from the app or extension.
  /// This is the default at install time.
  granted('granted'),

  /// User has elected not to show notifications from the app or extension.
  denied('denied');

  const PermissionLevel(this.value);

  final String value;

  String get toJS => value;
  static PermissionLevel fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class NotificationItem {
  NotificationItem.fromJS(this._wrapped);

  NotificationItem({
    required String title,
    required String message,
  }) : _wrapped = $js.NotificationItem(
          title: title,
          message: message,
        );

  final $js.NotificationItem _wrapped;

  $js.NotificationItem get toJS => _wrapped;
}

class NotificationBitmap {
  NotificationBitmap.fromJS(this._wrapped);

  NotificationBitmap({
    required int width,
    required int height,
    ByteBuffer? data,
  }) : _wrapped = $js.NotificationBitmap(
          width: width,
          height: height,
          data: data?.toJS,
        );

  final $js.NotificationBitmap _wrapped;

  $js.NotificationBitmap get toJS => _wrapped;
}

class NotificationButton {
  NotificationButton.fromJS(this._wrapped);

  NotificationButton({
    required String title,
    String? iconUrl,
    NotificationBitmap? iconBitmap,
  }) : _wrapped = $js.NotificationButton(
          title: title,
          iconUrl: iconUrl,
          iconBitmap: iconBitmap?.toJS,
        );

  final $js.NotificationButton _wrapped;

  $js.NotificationButton get toJS => _wrapped;
}

class NotificationOptions {
  NotificationOptions.fromJS(this._wrapped);

  NotificationOptions({
    TemplateType? type,
    String? iconUrl,
    NotificationBitmap? iconBitmap,
    String? appIconMaskUrl,
    NotificationBitmap? appIconMaskBitmap,
    String? title,
    String? message,
    String? contextMessage,
    int? priority,
    double? eventTime,
    List<NotificationButton>? buttons,
    String? expandedMessage,
    String? imageUrl,
    NotificationBitmap? imageBitmap,
    List<NotificationItem>? items,
    int? progress,
    bool? isClickable,
    bool? requireInteraction,
    bool? silent,
  }) : _wrapped = $js.NotificationOptions(
          type: type?.toJS,
          iconUrl: iconUrl,
          iconBitmap: iconBitmap?.toJS,
          appIconMaskUrl: appIconMaskUrl,
          appIconMaskBitmap: appIconMaskBitmap?.toJS,
          title: title,
          message: message,
          contextMessage: contextMessage,
          priority: priority,
          eventTime: eventTime,
          buttons: buttons?.toJSArray((e) => e.toJS),
          expandedMessage: expandedMessage,
          imageUrl: imageUrl,
          imageBitmap: imageBitmap?.toJS,
          items: items?.toJSArray((e) => e.toJS),
          progress: progress,
          isClickable: isClickable,
          requireInteraction: requireInteraction,
          silent: silent,
        );

  final $js.NotificationOptions _wrapped;

  $js.NotificationOptions get toJS => _wrapped;
}

class OnClosedEvent {
  OnClosedEvent({
    required this.notificationId,
    required this.byUser,
  });

  final String notificationId;

  final bool byUser;
}

class OnButtonClickedEvent {
  OnButtonClickedEvent({
    required this.notificationId,
    required this.buttonIndex,
  });

  final String notificationId;

  final int buttonIndex;
}
