import 'src/internal_helpers.dart';
import 'src/js/gcm.dart' as $js;

export 'src/chrome.dart' show chrome;

final _gcm = ChromeGcm._();

extension ChromeGcmExtension on Chrome {
  ChromeGcm get gcm => _gcm;
}

class ChromeGcm {
  ChromeGcm._();

  /// Registers the application with FCM. The registration ID will be returned
  /// by the `callback`. If `register` is called again with the same list of
  /// `senderIds`, the same registration ID will be returned.
  /// [senderIds] A list of server IDs that are allowed to send messages to
  /// the application. It should contain at least one and no more than 100
  /// sender IDs.
  Future<String> register(List<String> senderIds) {
    var $completer = Completer<String>();
    $js.chrome.gcm.register(
      senderIds.toJSArray((e) => e),
      (String registrationId) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(registrationId);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Unregisters the application from FCM.
  Future<void> unregister() {
    var $completer = Completer<void>();
    $js.chrome.gcm.unregister(() {
      if (checkRuntimeLastError($completer)) {
        $completer.complete(null);
      }
    }.toJS);
    return $completer.future;
  }

  /// Sends a message according to its contents.
  /// [message] A message to send to the other party via FCM.
  Future<String> send(SendMessage message) {
    var $completer = Completer<String>();
    $js.chrome.gcm.send(
      message.toJS,
      (String messageId) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(messageId);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// The maximum size (in bytes) of all key/value pairs in a message.
  int get maxMessageSize => $js.chrome.gcm.MAX_MESSAGE_SIZE;

  /// Fired when a message is received through FCM.
  Stream<OnMessageMessage> get onMessage =>
      $js.chrome.gcm.onMessage.asStream(($c) => ($js.OnMessageMessage message) {
            $c.add(OnMessageMessage.fromJS(message));
          }.toJS);

  /// Fired when a FCM server had to delete messages sent by an app server to
  /// the application. See [Lifetime of a
  /// message](https://firebase.google.com/docs/cloud-messaging/concept-options#lifetime)
  /// for details on handling this event.
  Stream<void> get onMessagesDeleted =>
      $js.chrome.gcm.onMessagesDeleted.asStream(($c) => () {
            $c.add(null);
          }.toJS);

  /// Fired when it was not possible to send a message to the FCM server.
  Stream<OnSendErrorError> get onSendError =>
      $js.chrome.gcm.onSendError.asStream(($c) => ($js.OnSendErrorError error) {
            $c.add(OnSendErrorError.fromJS(error));
          }.toJS);
}

class OnMessageMessage {
  OnMessageMessage.fromJS(this._wrapped);

  OnMessageMessage({
    required OnMessageMessageData data,
    String? from,
    String? collapseKey,
  }) : _wrapped = $js.OnMessageMessage()
          ..data = data.toJS
          ..from = from
          ..collapseKey = collapseKey;

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

  OnSendErrorError({
    required String errorMessage,
    String? messageId,
    required OnSendErrorErrorDetails details,
  }) : _wrapped = $js.OnSendErrorError()
          ..errorMessage = errorMessage
          ..messageId = messageId
          ..details = details.toJS;

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

  SendMessage({
    required String destinationId,
    required String messageId,
    int? timeToLive,
    required SendMessageData data,
  }) : _wrapped = $js.SendMessage(
          destinationId: destinationId,
          messageId: messageId,
          timeToLive: timeToLive,
          data: data.toJS,
        );

  final $js.SendMessage _wrapped;

  $js.SendMessage get toJS => _wrapped;
}

class OnMessageMessageData {
  OnMessageMessageData.fromJS(this._wrapped);

  OnMessageMessageData() : _wrapped = $js.OnMessageMessageData();

  final $js.OnMessageMessageData _wrapped;

  $js.OnMessageMessageData get toJS => _wrapped;
}

class OnSendErrorErrorDetails {
  OnSendErrorErrorDetails.fromJS(this._wrapped);

  OnSendErrorErrorDetails() : _wrapped = $js.OnSendErrorErrorDetails();

  final $js.OnSendErrorErrorDetails _wrapped;

  $js.OnSendErrorErrorDetails get toJS => _wrapped;
}

class SendMessageData {
  SendMessageData.fromJS(this._wrapped);

  SendMessageData() : _wrapped = $js.SendMessageData();

  final $js.SendMessageData _wrapped;

  $js.SendMessageData get toJS => _wrapped;
}