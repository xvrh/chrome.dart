import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSContextMenusExtension on JSChrome {
  /// Use the `chrome.contextMenus` API to add items to Google Chrome's context
  /// menu. You can choose what types of objects your context menu additions
  /// apply to, such as images, hyperlinks, and pages.
  external JSContextMenus get ContextMenus;
}

@JS()
@staticInterop
class JSContextMenus {}

extension JSContextMenusExtension on JSContextMenus {
  /// Creates a new context menu item. If an error occurs during creation, it
  /// may not be detected until the creation callback fires; details will be in
  /// $(ref:runtime.lastError).
  external void create();

  /// Updates a previously created context menu item.
  external void update();

  /// Removes a context menu item.
  external void remove();

  /// Removes all context menu items added by this extension.
  external void removeAll();

  /// Fired when a context menu item is clicked.
  external ChromeEvent get onClicked;
}
