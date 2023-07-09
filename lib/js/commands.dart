import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSCommandsExtension on JSChrome {
  /// Use the commands API to add keyboard shortcuts that trigger actions in
  /// your extension, for example, an action to open the browser action or send
  /// a command to the extension.
  external JSCommands get Commands;
}

@JS()
@staticInterop
class JSCommands {}

extension JSCommandsExtension on JSCommands {
  /// Returns all the registered extension commands for this extension and their
  /// shortcut (if active).
  external void getAll();

  /// Fired when a registered command is activated using a keyboard shortcut.
  external ChromeEvent get onCommand;
}
