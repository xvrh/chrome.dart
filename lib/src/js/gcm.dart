import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSGcmExtension on JSChrome {
  /// Use `chrome.gcm` to enable apps and extensions to send and receive
  /// messages through [Firebase Cloud
  /// Messaging](https://firebase.google.com/docs/cloud-messaging/) (FCM).
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
    JFFunction callback,
  );

  /// Unregisters the application from FCM.
  external void unregister(JFFunction callback);

  /// Sends a message according to its contents.
  external void send(
    SendMessage message,
    JFFunction callback,
  );

  /// Fired when a message is received through FCM.
  external ChromeEvent get onMessage;

  /// Fired when a FCM server had to delete messages sent by an app server to
  /// the application. See [Lifetime of a
  /// message](https://firebase.google.com/docs/cloud-messaging/concept-options#lifetime)
  /// for details on handling this event.
  external ChromeEvent get onMessagesDeleted;

  /// Fired when it was not possible to send a message to the FCM server.
  external ChromeEvent get onSendError;

  /// The maximum size (in bytes) of all key/value pairs in a message.
  external int get MAX_MESSAGE_SIZE;
}

@JS()
@staticInterop
class OnMessageMessage {}

extension OnMessageMessageExtension on OnMessageMessage {
  /// The message data.
  external OnMessageMessageData data;

  /// The sender who issued the message.
  external String? from;

  /// The collapse key of a message. See the <a
  /// href='https://firebase.google.com/docs/cloud-messaging/concept-options#collapsible_and_non-collapsible_messages'>Non-collapsible
  /// and collapsible messages</a> for details.
  external String? collapseKey;
}

@JS()
@staticInterop
class OnSendErrorError {}

extension OnSendErrorErrorExtension on OnSendErrorError {
  /// The error message describing the problem.
  external String errorMessage;

  /// The ID of the message with this error, if error is related to a specific
  /// message.
  external String? messageId;

  /// Additional details related to the error, when available.
  external OnSendErrorErrorDetails details;
}

@JS()
@staticInterop
@anonymous
class SendMessage {
  external factory SendMessage({
    /// The ID of the server to send the message to as assigned by [Google API
    /// Console](https://console.cloud.google.com/apis/dashboard).
    String destinationId,

    /// The ID of the message. It must be unique for each message in scope of the
    /// applications. See the [Cloud Messaging
    /// documentation](https://firebase.google.com/docs/cloud-messaging/js/client)
    /// for advice for picking and handling an ID.
    String messageId,

    /// Time-to-live of the message in seconds. If it is not possible to send the
    /// message within that time, an onSendError event will be raised. A
    /// time-to-live of 0 indicates that the message should be sent immediately or
    /// fail if it's not possible. The default value of time-to-live is 86,400
    /// seconds (1 day) and the maximum value is 2,419,200 seconds (28 days).
    int? timeToLive,

    /// Message data to send to the server. Case-insensitive `goog.` and `google`,
    /// as well as case-sensitive `collapse_key` are disallowed as key prefixes.
    /// Sum of all key/value pairs should not exceed [gcm.MAX_MESSAGE_SIZE].
    SendMessageData data,
  });
}

@JS()
@staticInterop
class OnMessageMessageData {}

extension OnMessageMessageDataExtension on OnMessageMessageData {}

@JS()
@staticInterop
class OnSendErrorErrorDetails {}

extension OnSendErrorErrorDetailsExtension on OnSendErrorErrorDetails {}

@JS()
@staticInterop
@anonymous
class SendMessageData {
  external factory SendMessageData();
}
