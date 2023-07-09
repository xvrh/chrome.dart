import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSWebNavigationExtension on JSChrome {
  /// Use the `chrome.webNavigation` API to receive notifications about the
  /// status of navigation requests in-flight.
  external JSWebNavigation get webNavigation;
}

@JS()
@staticInterop
class JSWebNavigation {}

extension JSWebNavigationExtension on JSWebNavigation {
  /// Retrieves information about the given frame. A frame refers to an <iframe>
  /// or a <frame> of a web page and is identified by a tab ID and a frame ID.
  external void getFrame(details);

  /// Retrieves information about all frames of a given tab.
  external void getAllFrames(details);

  /// Fired when a navigation is about to occur.
  external ChromeEvent get onBeforeNavigate;

  /// Fired when a navigation is committed. The document (and the resources it
  /// refers to, such as images and subframes) might still be downloading, but
  /// at least part of the document has been received from the server and the
  /// browser has decided to switch to the new document.
  external ChromeEvent get onCommitted;

  /// Fired when the page's DOM is fully constructed, but the referenced
  /// resources may not finish loading.
  external ChromeEvent get onDOMContentLoaded;

  /// Fired when a document, including the resources it refers to, is completely
  /// loaded and initialized.
  external ChromeEvent get onCompleted;

  /// Fired when an error occurs and the navigation is aborted. This can happen
  /// if either a network error occurred, or the user aborted the navigation.
  external ChromeEvent get onErrorOccurred;

  /// Fired when a new window, or a new tab in an existing window, is created to
  /// host a navigation.
  external ChromeEvent get onCreatedNavigationTarget;

  /// Fired when the reference fragment of a frame was updated. All future
  /// events for that frame will use the updated URL.
  external ChromeEvent get onReferenceFragmentUpdated;

  /// Fired when the contents of the tab is replaced by a different (usually
  /// previously pre-rendered) tab.
  external ChromeEvent get onTabReplaced;

  /// Fired when the frame's history was updated to a new URL. All future events
  /// for that frame will use the updated URL.
  external ChromeEvent get onHistoryStateUpdated;
}

@JS()
@staticInterop
class TransitionType {}

@JS()
@staticInterop
class TransitionQualifier {}
