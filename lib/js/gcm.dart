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
    JSObject message,
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
