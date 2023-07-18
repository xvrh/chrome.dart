import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/debugger.dart' as $js;

export 'src/chrome.dart' show chrome;

final _debugger = ChromeDebugger._();

extension ChromeDebuggerExtension on Chrome {
  ChromeDebugger get debugger => _debugger;
}

class ChromeDebugger {
  ChromeDebugger._();

  /// Attaches debugger to the given target.
  /// [target] Debugging target to which you want to attach.
  /// [requiredVersion] Required debugging protocol version ("0.1"). One can
  /// only attach to the debuggee with matching major version and greater or
  /// equal minor version. List of the protocol versions can be obtained
  /// [here](https://developer.chrome.com/devtools/docs/debugger-protocol).
  Future<void> attach(
    Debuggee target,
    String requiredVersion,
  ) async {
    await promiseToFuture<void>($js.chrome.debugger.attach(
      target.toJS,
      requiredVersion,
    ));
  }

  /// Detaches debugger from the given target.
  /// [target] Debugging target from which you want to detach.
  Future<void> detach(Debuggee target) async {
    await promiseToFuture<void>($js.chrome.debugger.detach(target.toJS));
  }

  /// Sends given command to the debugging target.
  /// [target] Debugging target to which you want to send the command.
  /// [method] Method name. Should be one of the methods defined by the
  /// [remote debugging
  /// protocol](https://developer.chrome.com/devtools/docs/debugger-protocol).
  /// [commandParams] JSON object with request parameters. This object must
  /// conform to the remote debugging params scheme for given method.
  Future<Object?> sendCommand(
    Debuggee target,
    String method,
    Object? commandParams,
  ) async {
    var $res = await promiseToFuture<JSAny?>($js.chrome.debugger.sendCommand(
      target.toJS,
      method,
      commandParams?.toJS,
    ));
    return $res;
  }

  /// Returns the list of available debug targets.
  Future<List<TargetInfo>> getTargets() async {
    var $res = await promiseToFuture<JSArray>($js.chrome.debugger.getTargets());
    return $res.toDart
        .cast<$js.TargetInfo>()
        .map((e) => TargetInfo.fromJS(e))
        .toList();
  }

  /// Fired whenever debugging target issues instrumentation event.
  Stream<OnEventEvent> get onEvent =>
      $js.chrome.debugger.onEvent.asStream(($c) => (
            $js.Debuggee source,
            String method,
            JSAny? params,
          ) {
            $c.add(OnEventEvent(
              source: Debuggee.fromJS(source),
              method: method,
              params: params,
            ));
          }.toJS);

  /// Fired when browser terminates debugging session for the tab. This happens
  /// when either the tab is being closed or Chrome DevTools is being invoked
  /// for the attached tab.
  Stream<OnDetachEvent> get onDetach =>
      $js.chrome.debugger.onDetach.asStream(($c) => (
            $js.Debuggee source,
            $js.DetachReason reason,
          ) {
            $c.add(OnDetachEvent(
              source: Debuggee.fromJS(source),
              reason: DetachReason.fromJS(reason),
            ));
          }.toJS);
}

/// Target type.
enum TargetInfoType {
  page('page'),
  backgroundPage('background_page'),
  worker('worker'),
  other('other');

  const TargetInfoType(this.value);

  final String value;

  String get toJS => value;
  static TargetInfoType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Connection termination reason.
enum DetachReason {
  targetClosed('target_closed'),
  canceledByUser('canceled_by_user');

  const DetachReason(this.value);

  final String value;

  String get toJS => value;
  static DetachReason fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class Debuggee {
  Debuggee.fromJS(this._wrapped);

  Debuggee({
    int? tabId,
    String? extensionId,
    String? targetId,
  }) : _wrapped = $js.Debuggee()
          ..tabId = tabId
          ..extensionId = extensionId
          ..targetId = targetId;

  final $js.Debuggee _wrapped;

  $js.Debuggee get toJS => _wrapped;

  /// The id of the tab which you intend to debug.
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    _wrapped.tabId = v;
  }

  /// The id of the extension which you intend to debug. Attaching to an
  /// extension background page is only possible when the
  /// `--silent-debugger-extension-api` command-line switch is used.
  String? get extensionId => _wrapped.extensionId;
  set extensionId(String? v) {
    _wrapped.extensionId = v;
  }

  /// The opaque id of the debug target.
  String? get targetId => _wrapped.targetId;
  set targetId(String? v) {
    _wrapped.targetId = v;
  }
}

class TargetInfo {
  TargetInfo.fromJS(this._wrapped);

  TargetInfo({
    required TargetInfoType type,
    required String id,
    int? tabId,
    String? extensionId,
    required bool attached,
    required String title,
    required String url,
    String? faviconUrl,
  }) : _wrapped = $js.TargetInfo()
          ..type = type.toJS
          ..id = id
          ..tabId = tabId
          ..extensionId = extensionId
          ..attached = attached
          ..title = title
          ..url = url
          ..faviconUrl = faviconUrl;

  final $js.TargetInfo _wrapped;

  $js.TargetInfo get toJS => _wrapped;

  /// Target type.
  TargetInfoType get type => TargetInfoType.fromJS(_wrapped.type);
  set type(TargetInfoType v) {
    _wrapped.type = v.toJS;
  }

  /// Target id.
  String get id => _wrapped.id;
  set id(String v) {
    _wrapped.id = v;
  }

  /// The tab id, defined if type == 'page'.
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    _wrapped.tabId = v;
  }

  /// The extension id, defined if type = 'background_page'.
  String? get extensionId => _wrapped.extensionId;
  set extensionId(String? v) {
    _wrapped.extensionId = v;
  }

  /// True if debugger is already attached.
  bool get attached => _wrapped.attached;
  set attached(bool v) {
    _wrapped.attached = v;
  }

  /// Target page title.
  String get title => _wrapped.title;
  set title(String v) {
    _wrapped.title = v;
  }

  /// Target URL.
  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Target favicon URL.
  String? get faviconUrl => _wrapped.faviconUrl;
  set faviconUrl(String? v) {
    _wrapped.faviconUrl = v;
  }
}

class OnEventEvent {
  OnEventEvent({
    required this.source,
    required this.method,
    required this.params,
  });

  /// The debuggee that generated this event.
  final Debuggee source;

  /// Method name. Should be one of the notifications defined by the [remote
  /// debugging
  /// protocol](https://developer.chrome.com/devtools/docs/debugger-protocol).
  final String method;

  /// JSON object with the parameters. Structure of the parameters varies
  /// depending on the method name and is defined by the 'parameters' attribute
  /// of the event description in the remote debugging protocol.
  final Object? params;
}

class OnDetachEvent {
  OnDetachEvent({
    required this.source,
    required this.reason,
  });

  /// The debuggee that was detached.
  final Debuggee source;

  /// Connection termination reason.
  final DetachReason reason;
}