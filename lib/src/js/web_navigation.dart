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
  external JSPromise getFrame(GetFrameDetails details);

  /// Retrieves information about all frames of a given tab.
  external JSPromise getAllFrames(GetAllFramesDetails details);

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

/// Cause of the navigation. The same transition types as defined in the history
/// API are used. These are the same transition types as defined in the <a
/// href="history#transition_types">history API</a> except with `"start_page"`
/// in place of `"auto_toplevel"` (for backwards compatibility).
typedef TransitionType = JSString;

typedef TransitionQualifier = JSString;

@JS()
@staticInterop
@anonymous
class GetFrameDetails {
  external factory GetFrameDetails({
    /// The ID of the tab in which the frame is.
    int? tabId,

    /// The ID of the process that runs the renderer for this tab.
    int? processId,

    /// The ID of the frame in the given tab.
    int? frameId,

    /// The UUID of the document. If the frameId and/or tabId are provided they
    /// will be validated to match the document found by provided document ID.
    String? documentId,
  });
}

@JS()
@staticInterop
@anonymous
class GetAllFramesDetails {
  external factory GetAllFramesDetails(
      {
      /// The ID of the tab.
      int tabId});
}
