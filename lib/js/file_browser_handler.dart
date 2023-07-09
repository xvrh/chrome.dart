import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSFileBrowserHandlerExtension on JSChrome {
  /// Use the `chrome.fileBrowserHandler` API to extend the Chrome OS file
  /// browser. For example, you can use this API to enable users to upload files
  /// to your website.
  external JSFileBrowserHandler get FileBrowserHandler;
}

@JS()
@staticInterop
class JSFileBrowserHandler {}

extension JSFileBrowserHandlerExtension on JSFileBrowserHandler {
  /// Fired when file system action is executed from ChromeOS file browser.
  external ChromeEvent get onExecute;
}
