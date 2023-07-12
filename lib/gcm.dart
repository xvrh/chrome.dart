import 'src/internal_helpers.dart';
import 'src/js/gcm.dart' as $js;
export 'chrome.dart';

final _gcm = ChromeGcm._();

extension ChromeGcmExtension on Chrome {
  ChromeGcm get gcm => _gcm;
}

class ChromeGcm {
  ChromeGcm._();

  /// Registers the application with FCM. The registration ID will be returned
  /// by the `callback`. If `register` is called again with the same list of
  /// `senderIds`, the same registration ID will be returned.
  void register(
    List<String> senderIds,
    JSAny callback,
  ) =>
      throw UnimplementedError();

  /// Unregisters the application from FCM.
  void unregister(JSAny callback) => throw UnimplementedError();

  /// Sends a message according to its contents.
  void send(
    SendMessage message,
    JSAny callback,
  ) =>
      throw UnimplementedError();

  /// The maximum size (in bytes) of all key/value pairs in a message.
  int get maxMESSAGESIZE => $js.chrome.gcm.MAX_MESSAGE_SIZE as dynamic;

  /// Fired when a message is received through FCM.
  Stream<OnMessageMessage> get onMessage => throw UnimplementedError();

  /// Fired when a FCM server had to delete messages sent by an app server to
  /// the application. See [Lifetime of a
  /// message](https://firebase.google.com/docs/cloud-messaging/concept-options#lifetime)
  /// for details on handling this event.
  Stream<void> get onMessagesDeleted => throw UnimplementedError();

  /// Fired when it was not possible to send a message to the FCM server.
  Stream<OnSendErrorError> get onSendError => throw UnimplementedError();
}

class OnMessageMessage {
  OnMessageMessage.fromJS(this._wrapped);

  final $js.OnMessageMessage _wrapped;

  $js.OnMessageMessage get toJS => _wrapped;

  /// The message data.
  OnMessageMessageData get data => OnMessageMessageData.fromJS(_wrapped.data);
  set data(OnMessageMessageData v) {
    _wrapped.data = v.toJS;
  }

  /// The sender who issued the message.
  String? get from => _wrapped.from;
  set from(String? v) {
    _wrapped.from = v;
  }

  /// The collapse key of a message. See the <a
  /// href='https://firebase.google.com/docs/cloud-messaging/concept-options#collapsible_and_non-collapsible_messages'>Non-collapsible
  /// and collapsible messages</a> for details.
  String? get collapseKey => _wrapped.collapseKey;
  set collapseKey(String? v) {
    _wrapped.collapseKey = v;
  }
}

class OnSendErrorError {
  OnSendErrorError.fromJS(this._wrapped);

  final $js.OnSendErrorError _wrapped;

  $js.OnSendErrorError get toJS => _wrapped;

  /// The error message describing the problem.
  String get errorMessage => _wrapped.errorMessage;
  set errorMessage(String v) {
    _wrapped.errorMessage = v;
  }

  /// The ID of the message with this error, if error is related to a specific
  /// message.
  String? get messageId => _wrapped.messageId;
  set messageId(String? v) {
    _wrapped.messageId = v;
  }

  /// Additional details related to the error, when available.
  OnSendErrorErrorDetails get details =>
      OnSendErrorErrorDetails.fromJS(_wrapped.details);
  set details(OnSendErrorErrorDetails v) {
    _wrapped.details = v.toJS;
  }
}

class SendMessage {
  SendMessage.fromJS(this._wrapped);

  final $js.SendMessage _wrapped;

  $js.SendMessage get toJS => _wrapped;
}

class OnMessageMessageData {
  OnMessageMessageData.fromJS(this._wrapped);

  final $js.OnMessageMessageData _wrapped;

  $js.OnMessageMessageData get toJS => _wrapped;
}

class OnSendErrorErrorDetails {
  OnSendErrorErrorDetails.fromJS(this._wrapped);

  final $js.OnSendErrorErrorDetails _wrapped;

  $js.OnSendErrorErrorDetails get toJS => _wrapped;
}

class SendMessageData {
  SendMessageData.fromJS(this._wrapped);

  final $js.SendMessageData _wrapped;

  $js.SendMessageData get toJS => _wrapped;
}
