import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSFileBrowserHandlerExtension on JSChrome {
  /// Use the `chrome.fileBrowserHandler` API to extend the Chrome OS file
  /// browser. For example, you can use this API to enable users to upload files
  /// to your website.
  external JSFileBrowserHandler get fileBrowserHandler;
}

@JS()
@staticInterop
class JSFileBrowserHandler {}

extension JSFileBrowserHandlerExtension on JSFileBrowserHandler {
  /// Fired when file system action is executed from ChromeOS file browser.
  external ChromeEvent get onExecute;
}

@JS()
@staticInterop
class FileHandlerExecuteEventDetails {}

extension FileHandlerExecuteEventDetailsExtension
    on FileHandlerExecuteEventDetails {
  /// Array of Entry instances representing files that are targets of this
  /// action (selected in ChromeOS file browser).
  external JSArray get entries;

  /// The ID of the tab that raised this event. Tab IDs are unique within a
  /// browser session.
  external int? get tab_id;
}
