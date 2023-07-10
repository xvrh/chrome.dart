import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDebuggerExtension on JSChrome {
  /// The `chrome.debugger` API serves as an alternate transport for Chrome's <a
  /// href='https://developer.chrome.com/devtools/docs/debugger-protocol'>remote
  /// debugging protocol</a>. Use `chrome.debugger` to attach to one or more
  /// tabs to instrument network interaction, debug JavaScript, mutate the DOM
  /// and CSS, etc. Use the Debuggee `tabId` to target tabs with sendCommand and
  /// route events by `tabId` from onEvent callbacks.
  external JSDebugger get debugger;
}

@JS()
@staticInterop
class JSDebugger {}

extension JSDebuggerExtension on JSDebugger {
  /// Attaches debugger to the given target.
  external JSPromise attach(
    Debuggee target,
    JSString requiredVersion,
  );

  /// Detaches debugger from the given target.
  external JSPromise detach(Debuggee target);

  /// Sends given command to the debugging target.
  external JSPromise sendCommand(
    Debuggee target,
    JSString method,
    JSObject? commandParams,
  );

  /// Returns the list of available debug targets.
  external JSPromise getTargets();

  /// Fired whenever debugging target issues instrumentation event.
  external ChromeEvent get onEvent;

  /// Fired when browser terminates debugging session for the tab. This happens
  /// when either the tab is being closed or Chrome DevTools is being invoked
  /// for the attached tab.
  external ChromeEvent get onDetach;
}

/// Target type.
typedef TargetInfoType = JSString;

/// Connection termination reason.
typedef DetachReason = JSString;

@JS()
@staticInterop
class Debuggee {}

extension DebuggeeExtension on Debuggee {
  /// The id of the tab which you intend to debug.
  external JSNumber? get tabId;

  /// The id of the extension which you intend to debug. Attaching to an
  /// extension background page is only possible when the
  /// `--silent-debugger-extension-api` command-line switch is used.
  external JSString? get extensionId;

  /// The opaque id of the debug target.
  external JSString? get targetId;
}

@JS()
@staticInterop
class TargetInfo {}

extension TargetInfoExtension on TargetInfo {
  /// Target type.
  external TargetInfoType get type;

  /// Target id.
  external JSString get id;

  /// The tab id, defined if type == 'page'.
  external JSNumber? get tabId;

  /// The extension id, defined if type = 'background_page'.
  external JSString? get extensionId;

  /// True if debugger is already attached.
  external JSBoolean get attached;

  /// Target page title.
  external JSString get title;

  /// Target URL.
  external JSString get url;

  /// Target favicon URL.
  external JSString? get faviconUrl;
}
