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
  external JSDebugger get Debugger;
}

@JS()
@staticInterop
class JSDebugger {}

extension JSDebuggerExtension on JSDebugger {
  /// Attaches debugger to the given target.
  external void attach();

  /// Detaches debugger from the given target.
  external void detach();

  /// Sends given command to the debugging target.
  external void sendCommand();

  /// Returns the list of available debug targets.
  external void getTargets();

  /// Fired whenever debugging target issues instrumentation event.
  external ChromeEvent get onEvent;

  /// Fired when browser terminates debugging session for the tab. This happens
  /// when either the tab is being closed or Chrome DevTools is being invoked
  /// for the attached tab.
  external ChromeEvent get onDetach;
}
