import 'dart:js_interop';

import 'chrome.dart';
import 'extension_types.dart';

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
  external void getFrame(
    GetFrameDetails details,
    JSFunction callback,
  );

  /// Retrieves information about all frames of a given tab.
  external void getAllFrames(
    GetAllFramesDetails details,
    JSFunction callback,
  );

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
/// API are used. These are the same transition types as defined in the [history
/// API](history#transition_types) except with `"start_page"` in place of
/// `"auto_toplevel"` (for backwards compatibility).
typedef TransitionType = String;

typedef TransitionQualifier = String;

@JS()
@staticInterop
class OnBeforeNavigateDetails {}

extension OnBeforeNavigateDetailsExtension on OnBeforeNavigateDetails {
  /// The ID of the tab in which the navigation is about to occur.
  external int tabId;

  external String url;

  /// The value of -1.
  external int processId;

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique for a given
  /// tab and process.
  external int frameId;

  /// The ID of the parent frame, or `-1` if this is the main frame.
  external int parentFrameId;

  /// The time when the browser was about to start the navigation, in
  /// milliseconds since the epoch.
  external double timeStamp;

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  external String? parentDocumentId;

  /// The lifecycle the document is in.
  external DocumentLifecycle documentLifecycle;

  /// The type of frame the navigation occurred in.
  external FrameType frameType;
}

@JS()
@staticInterop
class OnCommittedDetails {}

extension OnCommittedDetailsExtension on OnCommittedDetails {
  /// The ID of the tab in which the navigation occurs.
  external int tabId;

  external String url;

  /// The ID of the process that runs the renderer for this frame.
  external int processId;

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  external int frameId;

  /// The ID of the parent frame, or `-1` if this is the main frame.
  external int parentFrameId;

  /// Cause of the navigation.
  external TransitionType transitionType;

  /// A list of transition qualifiers.
  external JSArray transitionQualifiers;

  /// The time when the navigation was committed, in milliseconds since the
  /// epoch.
  external double timeStamp;

  /// A UUID of the document loaded.
  external String documentId;

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  external String? parentDocumentId;

  /// The lifecycle the document is in.
  external DocumentLifecycle documentLifecycle;

  /// The type of frame the navigation occurred in.
  external FrameType frameType;
}

@JS()
@staticInterop
class OnDomContentLoadedDetails {}

extension OnDomContentLoadedDetailsExtension on OnDomContentLoadedDetails {
  /// The ID of the tab in which the navigation occurs.
  external int tabId;

  external String url;

  /// The ID of the process that runs the renderer for this frame.
  external int processId;

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  external int frameId;

  /// The ID of the parent frame, or `-1` if this is the main frame.
  external int parentFrameId;

  /// The time when the page's DOM was fully constructed, in milliseconds since
  /// the epoch.
  external double timeStamp;

  /// A UUID of the document loaded.
  external String documentId;

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  external String? parentDocumentId;

  /// The lifecycle the document is in.
  external DocumentLifecycle documentLifecycle;

  /// The type of frame the navigation occurred in.
  external FrameType frameType;
}

@JS()
@staticInterop
class OnCompletedDetails {}

extension OnCompletedDetailsExtension on OnCompletedDetails {
  /// The ID of the tab in which the navigation occurs.
  external int tabId;

  external String url;

  /// The ID of the process that runs the renderer for this frame.
  external int processId;

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  external int frameId;

  /// The ID of the parent frame, or `-1` if this is the main frame.
  external int parentFrameId;

  /// The time when the document finished loading, in milliseconds since the
  /// epoch.
  external double timeStamp;

  /// A UUID of the document loaded.
  external String documentId;

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  external String? parentDocumentId;

  /// The lifecycle the document is in.
  external DocumentLifecycle documentLifecycle;

  /// The type of frame the navigation occurred in.
  external FrameType frameType;
}

@JS()
@staticInterop
class OnErrorOccurredDetails {}

extension OnErrorOccurredDetailsExtension on OnErrorOccurredDetails {
  /// The ID of the tab in which the navigation occurs.
  external int tabId;

  external String url;

  /// The value of -1.
  external int processId;

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  external int frameId;

  /// The ID of the parent frame, or `-1` if this is the main frame.
  external int parentFrameId;

  /// The error description.
  external String error;

  /// The time when the error occurred, in milliseconds since the epoch.
  external double timeStamp;

  /// A UUID of the document loaded.
  external String documentId;

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  external String? parentDocumentId;

  /// The lifecycle the document is in.
  external DocumentLifecycle documentLifecycle;

  /// The type of frame the navigation occurred in.
  external FrameType frameType;
}

@JS()
@staticInterop
class OnCreatedNavigationTargetDetails {}

extension OnCreatedNavigationTargetDetailsExtension
    on OnCreatedNavigationTargetDetails {
  /// The ID of the tab in which the navigation is triggered.
  external int sourceTabId;

  /// The ID of the process that runs the renderer for the source frame.
  external int sourceProcessId;

  /// The ID of the frame with sourceTabId in which the navigation is triggered.
  /// 0 indicates the main frame.
  external int sourceFrameId;

  /// The URL to be opened in the new window.
  external String url;

  /// The ID of the tab in which the url is opened
  external int tabId;

  /// The time when the browser was about to create a new view, in milliseconds
  /// since the epoch.
  external double timeStamp;
}

@JS()
@staticInterop
class OnReferenceFragmentUpdatedDetails {}

extension OnReferenceFragmentUpdatedDetailsExtension
    on OnReferenceFragmentUpdatedDetails {
  /// The ID of the tab in which the navigation occurs.
  external int tabId;

  external String url;

  /// The ID of the process that runs the renderer for this frame.
  external int processId;

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  external int frameId;

  /// The ID of the parent frame, or `-1` if this is the main frame.
  external int parentFrameId;

  /// Cause of the navigation.
  external TransitionType transitionType;

  /// A list of transition qualifiers.
  external JSArray transitionQualifiers;

  /// The time when the navigation was committed, in milliseconds since the
  /// epoch.
  external double timeStamp;

  /// A UUID of the document loaded.
  external String documentId;

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  external String? parentDocumentId;

  /// The lifecycle the document is in.
  external DocumentLifecycle documentLifecycle;

  /// The type of frame the navigation occurred in.
  external FrameType frameType;
}

@JS()
@staticInterop
class OnTabReplacedDetails {}

extension OnTabReplacedDetailsExtension on OnTabReplacedDetails {
  /// The ID of the tab that was replaced.
  external int replacedTabId;

  /// The ID of the tab that replaced the old tab.
  external int tabId;

  /// The time when the replacement happened, in milliseconds since the epoch.
  external double timeStamp;
}

@JS()
@staticInterop
class OnHistoryStateUpdatedDetails {}

extension OnHistoryStateUpdatedDetailsExtension
    on OnHistoryStateUpdatedDetails {
  /// The ID of the tab in which the navigation occurs.
  external int tabId;

  external String url;

  /// The ID of the process that runs the renderer for this frame.
  external int processId;

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  external int frameId;

  /// The ID of the parent frame, or `-1` if this is the main frame.
  external int parentFrameId;

  /// Cause of the navigation.
  external TransitionType transitionType;

  /// A list of transition qualifiers.
  external JSArray transitionQualifiers;

  /// The time when the navigation was committed, in milliseconds since the
  /// epoch.
  external double timeStamp;

  /// A UUID of the document loaded.
  external String documentId;

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  external String? parentDocumentId;

  /// The lifecycle the document is in.
  external DocumentLifecycle documentLifecycle;

  /// The type of frame the navigation occurred in.
  external FrameType frameType;
}

@JS()
@staticInterop
class GetFrameCallbackDetails {}

extension GetFrameCallbackDetailsExtension on GetFrameCallbackDetails {
  /// True if the last navigation in this frame was interrupted by an error,
  /// i.e. the onErrorOccurred event fired.
  external bool errorOccurred;

  /// The URL currently associated with this frame, if the frame identified by
  /// the frameId existed at one point in the given tab. The fact that an URL is
  /// associated with a given frameId does not imply that the corresponding
  /// frame still exists.
  external String url;

  /// The ID of the parent frame, or `-1` if this is the main frame.
  external int parentFrameId;

  /// A UUID of the document loaded.
  external String documentId;

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  external String? parentDocumentId;

  /// The lifecycle the document is in.
  external DocumentLifecycle documentLifecycle;

  /// The type of frame the navigation occurred in.
  external FrameType frameType;
}

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
class GetAllFramesCallbackDetails {}

extension GetAllFramesCallbackDetailsExtension on GetAllFramesCallbackDetails {
  /// True if the last navigation in this frame was interrupted by an error,
  /// i.e. the onErrorOccurred event fired.
  external bool errorOccurred;

  /// The ID of the process that runs the renderer for this frame.
  external int processId;

  /// The ID of the frame. 0 indicates that this is the main frame; a positive
  /// value indicates the ID of a subframe.
  external int frameId;

  /// The ID of the parent frame, or `-1` if this is the main frame.
  external int parentFrameId;

  /// The URL currently associated with this frame.
  external String url;

  /// A UUID of the document loaded.
  external String documentId;

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  external String? parentDocumentId;

  /// The lifecycle the document is in.
  external DocumentLifecycle documentLifecycle;

  /// The type of frame the navigation occurred in.
  external FrameType frameType;
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
