import 'chrome.dart';
export 'chrome.dart';

final _tabCapture = ChromeTabCapture._();

extension ChromeChromeTabCaptureExtension on Chrome {
  ChromeTabCapture get tabCapture => _tabCapture;
}

class ChromeTabCapture {
  ChromeTabCapture._();

  /// Captures the visible area of the currently active tab.  Capture can
  /// only be started on the currently active tab after the extension has been
  /// <em>invoked</em>, similar to the way that
  /// <a href="activeTab#invoking-activeTab">activeTab</a> works.
  ///  Capture is maintained across page navigations within
  /// the tab, and stops when the tab is closed, or the media stream is closed
  /// by the extension.
  ///
  /// |options| : Configures the returned media stream.
  /// |callback| : Callback with either the tab capture MediaStream or
  ///   `null`.  `null` indicates an error has occurred
  ///   and the client may query $(ref:runtime.lastError) to access the error
  ///   details.
  void capture(options) => throw UnimplementedError();

  /// Returns a list of tabs that have requested capture or are being
  /// captured, i.e. status != stopped and status != error.
  /// This allows extensions to inform the user that there is an existing
  /// tab capture that would prevent a new tab capture from succeeding (or
  /// to prevent redundant requests for the same tab).
  /// |callback| : Callback invoked with CaptureInfo[] for captured tabs.
  void getCapturedTabs() => throw UnimplementedError();

  /// Creates a stream ID to capture the target tab.
  /// Similar to chrome.tabCapture.capture() method, but returns a media
  /// stream ID, instead of a media stream, to the consumer tab.
  ///
  /// |GetMediaStreamOptions| : Options for the media stream id to retrieve.
  /// |callback| : Callback to invoke with the result. If successful, the
  /// result is an opaque string that can be passed to the
  /// `getUserMedia()` API to generate a media stream that
  /// corresponds to the target tab. The created `streamId` can
  /// only be used once and expires after a few seconds if it is not used.
  void getMediaStreamId(options) => throw UnimplementedError();

  /// Event fired when the capture status of a tab changes.
  /// This allows extension authors to keep track of the capture status of
  /// tabs to keep UI elements like page actions in sync.
  /// |info| : CaptureInfo with new capture status for the tab.
  Stream get onStatusChanged => throw UnimplementedError();
}

enum TabCaptureState {
  pending('pending'),
  active('active'),
  stopped('stopped'),
  error('error');

  const TabCaptureState(this.value);

  final String value;
}
