import 'src/internal_helpers.dart';
import 'src/js/debugger.dart' as $js;
export 'chrome.dart';

final _debugger = ChromeDebugger._();

extension ChromeDebuggerExtension on Chrome {
  ChromeDebugger get debugger => _debugger;
}

class ChromeDebugger {
  ChromeDebugger._();

  /// Attaches debugger to the given target.
  Future<void> attach(
    Debuggee target,
    String requiredVersion,
  ) =>
      throw UnimplementedError();

  /// Detaches debugger from the given target.
  Future<void> detach(Debuggee target) => throw UnimplementedError();

  /// Sends given command to the debugging target.
  Future<JSAny?> sendCommand(
    Debuggee target,
    String method,
    JSAny? commandParams,
  ) =>
      throw UnimplementedError();

  /// Returns the list of available debug targets.
  Future<List<TargetInfo>> getTargets() => throw UnimplementedError();

  /// Fired whenever debugging target issues instrumentation event.
  Stream<OnEventEvent> get onEvent => throw UnimplementedError();

  /// Fired when browser terminates debugging session for the tab. This happens
  /// when either the tab is being closed or Chrome DevTools is being invoked
  /// for the attached tab.
  Stream<OnDetachEvent> get onDetach => throw UnimplementedError();
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
  final JSAny? params;
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
