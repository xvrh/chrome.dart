import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSDebuggerExtension on JSChrome {
  /// The `chrome.debugger` API serves as an alternate transport for Chrome's
  /// [remote debugging
  /// protocol](https://developer.chrome.com/devtools/docs/debugger-protocol).
  /// Use `chrome.debugger` to attach to one or more tabs to instrument network
  /// interaction, debug JavaScript, mutate the DOM and CSS, etc. Use the
  /// Debuggee `tabId` to target tabs with sendCommand and route events by
  /// `tabId` from onEvent callbacks.
  external JSDebugger get debugger;
}

@JS()
@staticInterop
class JSDebugger {}

extension JSDebuggerExtension on JSDebugger {
  /// Attaches debugger to the given target.
  external void attach(
    /// Debugging target to which you want to attach.
    Debuggee target,

    /// Required debugging protocol version ("0.1"). One can only attach to the
    /// debuggee with matching major version and greater or equal minor version.
    /// List of the protocol versions can be obtained
    /// [here](https://developer.chrome.com/devtools/docs/debugger-protocol).
    String requiredVersion,

    /// Called once the attach operation succeeds or fails. Callback receives no
    /// arguments. If the attach fails, [runtime.lastError] will be set to the
    /// error message.
    JSFunction? callback,
  );

  /// Detaches debugger from the given target.
  external void detach(
    /// Debugging target from which you want to detach.
    Debuggee target,

    /// Called once the detach operation succeeds or fails. Callback receives no
    /// arguments. If the detach fails, [runtime.lastError] will be set to the
    /// error message.
    JSFunction? callback,
  );

  /// Sends given command to the debugging target.
  external void sendCommand(
    /// Debugging target to which you want to send the command.
    Debuggee target,

    /// Method name. Should be one of the methods defined by the [remote
    /// debugging
    /// protocol](https://developer.chrome.com/devtools/docs/debugger-protocol).
    String method,

    /// JSON object with request parameters. This object must conform to the
    /// remote debugging params scheme for given method.
    JSAny? commandParams,

    /// Response body. If an error occurs while posting the message, the
    /// callback will be called with no arguments and [runtime.lastError] will
    /// be set to the error message.
    JSFunction? callback,
  );

  /// Returns the list of available debug targets.
  external void getTargets(JSFunction callback);

  /// Fired whenever debugging target issues instrumentation event.
  external ChromeEvent get onEvent;

  /// Fired when browser terminates debugging session for the tab. This happens
  /// when either the tab is being closed or Chrome DevTools is being invoked
  /// for the attached tab.
  external ChromeEvent get onDetach;
}

/// Target type.
typedef TargetInfoType = String;

/// Connection termination reason.
typedef DetachReason = String;

@JS()
@staticInterop
class Debuggee {}

extension DebuggeeExtension on Debuggee {
  /// The id of the tab which you intend to debug.
  external int? tabId;

  /// The id of the extension which you intend to debug. Attaching to an
  /// extension background page is only possible when the
  /// `--silent-debugger-extension-api` command-line switch is used.
  external String? extensionId;

  /// The opaque id of the debug target.
  external String? targetId;
}

@JS()
@staticInterop
class TargetInfo {}

extension TargetInfoExtension on TargetInfo {
  /// Target type.
  external TargetInfoType type;

  /// Target id.
  external String id;

  /// The tab id, defined if type == 'page'.
  external int? tabId;

  /// The extension id, defined if type = 'background_page'.
  external String? extensionId;

  /// True if debugger is already attached.
  external bool attached;

  /// Target page title.
  external String title;

  /// Target URL.
  external String url;

  /// Target favicon URL.
  external String? faviconUrl;
}
