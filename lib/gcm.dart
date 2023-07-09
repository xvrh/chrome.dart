import 'chrome.dart';
export 'chrome.dart';

final _gcm = ChromeGcm._();

extension ChromeChromeGcmExtension on Chrome {
  ChromeGcm get gcm => _gcm;
}

class ChromeGcm {
  ChromeGcm._();

  /// Registers the application with FCM. The registration ID will be returned
  /// by the `callback`. If `register` is called again with the same list of
  /// `senderIds`, the same registration ID will be returned.
  void register(
    senderIds,
    callback,
  ) =>
      throw UnimplementedError();

  /// Unregisters the application from FCM.
  void unregister(callback) => throw UnimplementedError();

  /// Sends a message according to its contents.
  void send(
    message,
    callback,
  ) =>
      throw UnimplementedError();

  /// Fired when a message is received through FCM.
  Stream get onMessage => throw UnimplementedError();

  /// Fired when a FCM server had to delete messages sent by an app server to
  /// the application. See <a
  /// href='https://firebase.google.com/docs/cloud-messaging/concept-options#lifetime'>Lifetime
  /// of a message</a> for details on handling this event.
  Stream get onMessagesDeleted => throw UnimplementedError();

  /// Fired when it was not possible to send a message to the FCM server.
  Stream get onSendError => throw UnimplementedError();
}
