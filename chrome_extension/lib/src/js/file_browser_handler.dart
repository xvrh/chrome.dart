import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSFileBrowserHandlerExtension on JSChrome {
  /// Use the `chrome.fileBrowserHandler` API to extend the Chrome OS file
  /// browser. For example, you can use this API to enable users to upload files
  /// to your website.
  @JS('fileBrowserHandler')
  external JSFileBrowserHandler? get fileBrowserHandlerNullable;

  /// Use the `chrome.fileBrowserHandler` API to extend the Chrome OS file
  /// browser. For example, you can use this API to enable users to upload files
  /// to your website.
  JSFileBrowserHandler get fileBrowserHandler {
    var fileBrowserHandlerNullable = this.fileBrowserHandlerNullable;
    if (fileBrowserHandlerNullable == null) {
      throw ApiNotAvailableException('chrome.fileBrowserHandler');
    }
    return fileBrowserHandlerNullable;
  }
}

@JS()
@staticInterop
class JSFileBrowserHandler {}

extension JSFileBrowserHandlerExtension on JSFileBrowserHandler {
  /// Fired when file system action is executed from ChromeOS file browser.
  external Event get onExecute;
}

@JS()
@staticInterop
class FileHandlerExecuteEventDetails {}

extension FileHandlerExecuteEventDetailsExtension
    on FileHandlerExecuteEventDetails {
  /// Array of Entry instances representing files that are targets of this
  /// action (selected in ChromeOS file browser).
  external JSArray entries;

  /// The ID of the tab that raised this event. Tab IDs are unique within a
  /// browser session.
  external int? tab_id;
}
