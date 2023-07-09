import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSTabCaptureExtension on JSChrome {
  ///  Use the `chrome.tabCapture` API to interact with tab media
  ///  streams.
  external JSTabCapture get tabCapture;
}

@JS()
@staticInterop
class JSTabCapture {}

extension JSTabCaptureExtension on JSTabCapture {
  ///  Captures the visible area of the currently active tab.  Capture can
  ///  only be started on the currently active tab after the extension has been
  ///  <em>invoked</em>, similar to the way that
  ///  <a href="activeTab#invoking-activeTab">activeTab</a> works.
  ///   Capture is maintained across page navigations within
  ///  the tab, and stops when the tab is closed, or the media stream is closed
  ///  by the extension.
  ///
  ///  |options| : Configures the returned media stream.
  ///  |callback| : Callback with either the tab capture MediaStream or
  ///    `null`.  `null` indicates an error has occurred
  ///    and the client may query $(ref:runtime.lastError) to access the error
  ///    details.
  external void capture(
    options,
    callback,
  );

  ///  Returns a list of tabs that have requested capture or are being
  ///  captured, i.e. status != stopped and status != error.
  ///  This allows extensions to inform the user that there is an existing
  ///  tab capture that would prevent a new tab capture from succeeding (or
  ///  to prevent redundant requests for the same tab).
  ///  |callback| : Callback invoked with CaptureInfo[] for captured tabs.
  external void getCapturedTabs(callback);

  ///  Creates a stream ID to capture the target tab.
  ///  Similar to chrome.tabCapture.capture() method, but returns a media
  ///  stream ID, instead of a media stream, to the consumer tab.
  ///
  ///  |GetMediaStreamOptions| : Options for the media stream id to retrieve.
  ///  |callback| : Callback to invoke with the result. If successful, the
  ///  result is an opaque string that can be passed to the
  ///  `getUserMedia()` API to generate a media stream that
  ///  corresponds to the target tab. The created `streamId` can
  ///  only be used once and expires after a few seconds if it is not used.
  external void getMediaStreamId(
    options,
    callback,
  );

  ///  Event fired when the capture status of a tab changes.
  ///  This allows extension authors to keep track of the capture status of
  ///  tabs to keep UI elements like page actions in sync.
  ///  |info| : CaptureInfo with new capture status for the tab.
  external ChromeEvent get onStatusChanged;
}

@JS()
@staticInterop
class CaptureInfo {
  ///  The id of the tab whose status changed.
  external JSAny get tabId;

  ///  The new capture status of the tab.
  external JSAny get status;

  ///  Whether an element in the tab being captured is in fullscreen mode.
  external JSAny get fullscreen;
}

@JS()
@staticInterop
class MediaStreamConstraint {
  external JSAny get mandatory;

  external JSAny? get _optional;
}

@JS()
@staticInterop
class CaptureOptions {
  external JSAny? get audio;

  external JSAny? get video;

  external JSAny? get audioConstraints;

  external JSAny? get videoConstraints;

  external JSAny? get presentationId;
}

@JS()
@staticInterop
class GetMediaStreamOptions {
  ///  Optional tab id of the tab which will later invoke
  ///  `getUserMedia()` to consume the stream. If not specified
  ///  then the resulting stream can be used only by the calling extension.
  ///  The stream can only be used by frames in the given tab whose security
  ///  origin matches the consumber tab's origin. The tab's origin must be a
  ///  secure origin, e.g. HTTPS.
  external JSAny? get consumerTabId;

  ///  Optional tab id of the tab which will be captured. If not specified
  ///  then the current active tab will be selected. Only tabs for which the
  ///  extension has been granted the `activeTab` permission can be
  ///  used as the target tab.
  external JSAny? get targetTabId;
}
