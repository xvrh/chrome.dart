import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSGcmExtension on JSChrome {
  /// Use `chrome.gcm` to enable apps and extensions to send and receive
  /// messages through <a
  /// href='https://firebase.google.com/docs/cloud-messaging/'>Firebase Cloud
  /// Messaging</a> (FCM).
  external JSGcm get gcm;
}

@JS()
@staticInterop
class JSGcm {}

extension JSGcmExtension on JSGcm {
  /// Registers the application with FCM. The registration ID will be returned
  /// by the `callback`. If `register` is called again with the same list of
  /// `senderIds`, the same registration ID will be returned.
  external void register(
    JSArray senderIds,
    JSFunction callback,
  );

  /// Unregisters the application from FCM.
  external void unregister(JSFunction callback);

  /// Sends a message according to its contents.
  external void send(
    SendMessage message,
    JSFunction callback,
  );

  /// Fired when a message is received through FCM.
  external ChromeEvent get onMessage;

  /// Fired when a FCM server had to delete messages sent by an app server to
  /// the application. See <a
  /// href='https://firebase.google.com/docs/cloud-messaging/concept-options#lifetime'>Lifetime
  /// of a message</a> for details on handling this event.
  external ChromeEvent get onMessagesDeleted;

  /// Fired when it was not possible to send a message to the FCM server.
  external ChromeEvent get onSendError;
}

@JS()
@staticInterop
class SendMessage {
  /// The ID of the server to send the message to as assigned by <a
  /// href='https://console.cloud.google.com/apis/dashboard'>Google API
  /// Console</a>.
  external String get destinationId;

  /// The ID of the message. It must be unique for each message in scope of the
  /// applications. See the <a
  /// href='https://firebase.google.com/docs/cloud-messaging/js/client'>Cloud
  /// Messaging documentation</a> for advice for picking and handling an ID.
  external String get messageId;

  /// Time-to-live of the message in seconds. If it is not possible to send the
  /// message within that time, an onSendError event will be raised. A
  /// time-to-live of 0 indicates that the message should be sent immediately or
  /// fail if it's not possible. The default value of time-to-live is 86,400
  /// seconds (1 day) and the maximum value is 2,419,200 seconds (28 days).
  external int? get timeToLive;

  /// Message data to send to the server. Case-insensitive `goog.` and `google`,
  /// as well as case-sensitive `collapse_key` are disallowed as key prefixes.
  /// Sum of all key/value pairs should not exceed $(ref:gcm.MAX_MESSAGE_SIZE).
  external SendMessageData get data;
}

@JS()
@staticInterop
class SendMessageData {}
