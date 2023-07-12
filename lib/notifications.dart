import 'src/internal_helpers.dart';
import 'dart:typed_data';
import 'src/js/notifications.dart' as $js;
export 'chrome.dart';

final _notifications = ChromeNotifications._();

extension ChromeNotificationsExtension on Chrome {
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
  Future<String> create(
    String? notificationId,
    NotificationOptions options,
  ) =>
      throw UnimplementedError();

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
  ) =>
      throw UnimplementedError();

  /// Clears the specified notification.
  /// |notificationId|: The id of the notification to be cleared. This is
  /// returned by [notifications.create] method.
  /// |callback|: Called to indicate whether a matching notification existed.
  ///
  /// The callback is required before Chrome 42.
  Future<bool> clear(String notificationId) => throw UnimplementedError();

  /// Retrieves all the notifications of this app or extension.
  /// |callback|: Returns the set of notification_ids currently in the system.
  Future<JSAny> getAll() => throw UnimplementedError();

  /// Retrieves whether the user has enabled notifications from this app
  /// or extension.
  /// |callback|: Returns the current permission level.
  Future<PermissionLevel> getPermissionLevel() => throw UnimplementedError();

  /// The notification closed, either by the system or by user action.
  Stream<OnClosedEvent> get onClosed => throw UnimplementedError();

  /// The user clicked in a non-button area of the notification.
  Stream<String> get onClicked => throw UnimplementedError();

  /// The user pressed a button in the notification.
  Stream<OnButtonClickedEvent> get onButtonClicked =>
      throw UnimplementedError();

  /// The user changes the permission level.  As of Chrome 47, only ChromeOS
  /// has UI that dispatches this event.
  Stream<PermissionLevel> get onPermissionLevelChanged =>
      throw UnimplementedError();

  /// The user clicked on a link for the app's notification settings.  As of
  /// Chrome 47, only ChromeOS has UI that dispatches this event.
  /// As of Chrome 65, that UI has been removed from ChromeOS, too.
  Stream<void> get onShowSettings => throw UnimplementedError();
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

  final $js.NotificationItem _wrapped;

  $js.NotificationItem get toJS => _wrapped;

  /// Title of one item of a list notification.
  String get title => _wrapped.title;
  set title(String v) {
    throw UnimplementedError();
  }

  /// Additional details about this item.
  String get message => _wrapped.message;
  set message(String v) {
    throw UnimplementedError();
  }
}

class NotificationBitmap {
  NotificationBitmap.fromJS(this._wrapped);

  final $js.NotificationBitmap _wrapped;

  $js.NotificationBitmap get toJS => _wrapped;

  int get width => _wrapped.width;
  set width(int v) {
    throw UnimplementedError();
  }

  int get height => _wrapped.height;
  set height(int v) {
    throw UnimplementedError();
  }

  ByteBuffer? get data => _wrapped.data?.toDart;
  set data(ByteBuffer? v) {
    throw UnimplementedError();
  }
}

class NotificationButton {
  NotificationButton.fromJS(this._wrapped);

  final $js.NotificationButton _wrapped;

  $js.NotificationButton get toJS => _wrapped;

  String get title => _wrapped.title;
  set title(String v) {
    throw UnimplementedError();
  }

  String? get iconUrl => _wrapped.iconUrl;
  set iconUrl(String? v) {
    throw UnimplementedError();
  }

  NotificationBitmap? get iconBitmap =>
      _wrapped.iconBitmap?.let(NotificationBitmap.fromJS);
  set iconBitmap(NotificationBitmap? v) {
    throw UnimplementedError();
  }
}

class NotificationOptions {
  NotificationOptions.fromJS(this._wrapped);

  final $js.NotificationOptions _wrapped;

  $js.NotificationOptions get toJS => _wrapped;

  /// Which type of notification to display.
  /// _Required for [notifications.create]_ method.
  TemplateType? get type => _wrapped.type?.let(TemplateType.fromJS);
  set type(TemplateType? v) {
    throw UnimplementedError();
  }

  /// A URL to the sender's avatar, app icon, or a thumbnail for image
  /// notifications.
  ///
  /// URLs can be a data URL, a blob URL, or a URL relative to a resource
  /// within this extension's .crx file
  /// _Required for [notifications.create]_ method.
  String? get iconUrl => _wrapped.iconUrl;
  set iconUrl(String? v) {
    throw UnimplementedError();
  }

  NotificationBitmap? get iconBitmap =>
      _wrapped.iconBitmap?.let(NotificationBitmap.fromJS);
  set iconBitmap(NotificationBitmap? v) {
    throw UnimplementedError();
  }

  /// A URL to the app icon mask. URLs have the same restrictions as
  /// $(ref:notifications.NotificationOptions.iconUrl iconUrl).
  ///
  /// The app icon mask should be in alpha channel, as only the alpha channel
  /// of the image will be considered.
  String? get appIconMaskUrl => _wrapped.appIconMaskUrl;
  set appIconMaskUrl(String? v) {
    throw UnimplementedError();
  }

  NotificationBitmap? get appIconMaskBitmap =>
      _wrapped.appIconMaskBitmap?.let(NotificationBitmap.fromJS);
  set appIconMaskBitmap(NotificationBitmap? v) {
    throw UnimplementedError();
  }

  /// Title of the notification (e.g. sender name for email).
  /// _Required for [notifications.create]_ method.
  String? get title => _wrapped.title;
  set title(String? v) {
    throw UnimplementedError();
  }

  /// Main notification content.
  /// _Required for [notifications.create]_ method.
  String? get message => _wrapped.message;
  set message(String? v) {
    throw UnimplementedError();
  }

  /// Alternate notification content with a lower-weight font.
  String? get contextMessage => _wrapped.contextMessage;
  set contextMessage(String? v) {
    throw UnimplementedError();
  }

  /// Priority ranges from -2 to 2. -2 is lowest priority. 2 is highest. Zero
  /// is default.  On platforms that don't support a notification center
  /// (Windows, Linux & Mac), -2 and -1 result in an error as notifications
  /// with those priorities will not be shown at all.
  int? get priority => _wrapped.priority;
  set priority(int? v) {
    throw UnimplementedError();
  }

  /// A timestamp associated with the notification, in milliseconds past the
  /// epoch (e.g. `Date.now() + n`).
  double? get eventTime => _wrapped.eventTime;
  set eventTime(double? v) {
    throw UnimplementedError();
  }

  /// Text and icons for up to two notification action buttons.
  List<NotificationButton>? get buttons => throw UnimplementedError();
  set buttons(List<NotificationButton>? v) {
    throw UnimplementedError();
  }

  /// Secondary notification content.
  String? get expandedMessage => _wrapped.expandedMessage;
  set expandedMessage(String? v) {
    throw UnimplementedError();
  }

  /// A URL to the image thumbnail for image-type notifications.
  /// URLs have the same restrictions as
  /// $(ref:notifications.NotificationOptions.iconUrl iconUrl).
  String? get imageUrl => _wrapped.imageUrl;
  set imageUrl(String? v) {
    throw UnimplementedError();
  }

  NotificationBitmap? get imageBitmap =>
      _wrapped.imageBitmap?.let(NotificationBitmap.fromJS);
  set imageBitmap(NotificationBitmap? v) {
    throw UnimplementedError();
  }

  /// Items for multi-item notifications. Users on Mac OS X only see the first
  /// item.
  List<NotificationItem>? get items => throw UnimplementedError();
  set items(List<NotificationItem>? v) {
    throw UnimplementedError();
  }

  /// Current progress ranges from 0 to 100.
  int? get progress => _wrapped.progress;
  set progress(int? v) {
    throw UnimplementedError();
  }

  bool? get isClickable => _wrapped.isClickable;
  set isClickable(bool? v) {
    throw UnimplementedError();
  }

  /// Indicates that the notification should remain visible on screen until the
  /// user activates or dismisses the notification. This defaults to false.
  bool? get requireInteraction => _wrapped.requireInteraction;
  set requireInteraction(bool? v) {
    throw UnimplementedError();
  }

  /// Indicates that no sounds or vibrations should be made when the
  /// notification is being shown. This defaults to false.
  bool? get silent => _wrapped.silent;
  set silent(bool? v) {
    throw UnimplementedError();
  }
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
