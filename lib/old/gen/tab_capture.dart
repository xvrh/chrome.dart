/* This file has been generated from tab_capture.idl - do not edit */

/**
 * Use the `chrome.tabCapture` API to interact with tab media streams.
 */
library chrome.tabCapture;

import '../src/common.dart';

/**
 * Accessor for the `chrome.tabCapture` namespace.
 */
final ChromeTabCapture tabCapture = ChromeTabCapture._();

class ChromeTabCapture extends ChromeApi {
  JsObject get _tabCapture => chrome['tabCapture'];

  Stream<CaptureInfo> get onStatusChanged => _onStatusChanged.stream;
  late ChromeStreamController<CaptureInfo> _onStatusChanged;

  ChromeTabCapture._() {
    var getApi = () => _tabCapture;
    _onStatusChanged = ChromeStreamController<CaptureInfo>.oneArg(getApi, 'onStatusChanged', _createCaptureInfo);
  }

  bool get available => _tabCapture != null;

  /**
   * Captures the visible area of the currently active tab. Capture can only be
   * started on the currently active tab after the extension has been _invoked_,
   * similar to the way that <a
   * href="activeTab#invoking-activeTab">activeTab</a> works. Capture is
   * maintained across page navigations within the tab, and stops when the tab
   * is closed, or the media stream is closed by the extension.
   * 
   * [options]: Configures the returned media stream.
   * [callback]: Callback with either the tab capture MediaStream or `null`.
   * `null` indicates an error has occurred and the client may query
   * [runtime.lastError] to access the error details.
   */
  Future<LocalMediaStream> capture(CaptureOptions options) {
    if (_tabCapture == null) _throwNotAvailable();

    var completer =  ChromeCompleter<LocalMediaStream>.oneArg(_createLocalMediaStream);
    _tabCapture.callMethod('capture', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Returns a list of tabs that have requested capture or are being captured,
   * i.e. status != stopped and status != error. This allows extensions to
   * inform the user that there is an existing tab capture that would prevent a
   * new tab capture from succeeding (or to prevent redundant requests for the
   * same tab).
   * [callback]: Callback invoked with CaptureInfo[] for captured tabs.
   */
  Future<List<CaptureInfo>> getCapturedTabs() {
    if (_tabCapture == null) _throwNotAvailable();

    var completer =  ChromeCompleter<List<CaptureInfo>>.oneArg((e) => listify(e, _createCaptureInfo));
    _tabCapture.callMethod('getCapturedTabs', [completer.callback]);
    return completer.future;
  }

  /**
   * Creates a stream ID to capture the target tab. Similar to
   * chrome.tabCapture.capture() method, but returns a media stream ID, instead
   * of a media stream, to the consumer tab.
   * 
   * [GetMediaStreamOptions]: Options for the media stream id to retrieve.
   * [callback]: Callback to invoke with the result. If successful, the result
   * is an opaque string that can be passed to the `getUserMedia()` API to
   * generate a media stream that corresponds to the target tab. The created
   * `streamId` can only be used once and expires after a few seconds if it is
   * not used.
   * 
   * Returns:
   * To assemble MediaConstraints with this [streamId], source type must be
   * assigned as 'tab'. For example: ` const constraints = { mandatory: {
   * chromeMediaSource: 'tab', chromeMediaSourceId: streamId } };
   * navigator.getUserMedia({audio: constraints, video: constraints},
   * successCallback, failCallback); `
   */
  Future<String> getMediaStreamId([GetMediaStreamOptions? options]) {
    if (_tabCapture == null) _throwNotAvailable();

    var completer =  ChromeCompleter<String>.oneArg();
    _tabCapture.callMethod('getMediaStreamId', [jsify(options), completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.tabCapture' is not available");
  }
}

class TabCaptureState extends ChromeEnum {
  static const TabCaptureState PENDING = const TabCaptureState._('pending');
  static const TabCaptureState ACTIVE = const TabCaptureState._('active');
  static const TabCaptureState STOPPED = const TabCaptureState._('stopped');
  static const TabCaptureState ERROR = const TabCaptureState._('error');

  static const List<TabCaptureState> VALUES = const[PENDING, ACTIVE, STOPPED, ERROR];

  const TabCaptureState._(String str): super(str);
}

class CaptureInfo extends ChromeObject {
  CaptureInfo({int? tabId, TabCaptureState? status, bool? fullscreen}) {
    if (tabId != null) this.tabId = tabId;
    if (status != null) this.status = status;
    if (fullscreen != null) this.fullscreen = fullscreen;
  }
  CaptureInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;

  TabCaptureState get status => _createTabCaptureState(jsProxy['status']);
  set status(TabCaptureState value) => jsProxy['status'] = jsify(value);

  bool get fullscreen => jsProxy['fullscreen'];
  set fullscreen(bool value) => jsProxy['fullscreen'] = value;
}

/**
 * MediaTrackConstraints for the media streams that will be passed to WebRTC.
 * See section on MediaTrackConstraints:
 * http://dev.w3.org/2011/webrtc/editor/getusermedia.html
 */
class MediaStreamConstraint extends ChromeObject {
  MediaStreamConstraint({Object? mandatory, Object? optional}) {
    if (mandatory != null) this.mandatory = mandatory;
    if (optional != null) this.optional = optional;
  }
  MediaStreamConstraint.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  Object get mandatory => jsProxy['mandatory'];
  set mandatory(Object value) => jsProxy['mandatory'] = jsify(value);

  Object get optional => jsProxy['_optional'];
  set optional(Object value) => jsProxy['_optional'] = jsify(value);
}

/**
 * Whether we are requesting tab video and/or audio and the
 * MediaTrackConstraints that should be set for these streams.
 */
class CaptureOptions extends ChromeObject {
  CaptureOptions({bool? audio, bool? video, MediaStreamConstraint? audioConstraints, MediaStreamConstraint? videoConstraints, String? presentationId}) {
    if (audio != null) this.audio = audio;
    if (video != null) this.video = video;
    if (audioConstraints != null) this.audioConstraints = audioConstraints;
    if (videoConstraints != null) this.videoConstraints = videoConstraints;
    if (presentationId != null) this.presentationId = presentationId;
  }
  CaptureOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  bool get audio => jsProxy['audio'];
  set audio(bool value) => jsProxy['audio'] = value;

  bool get video => jsProxy['video'];
  set video(bool value) => jsProxy['video'] = value;

  MediaStreamConstraint get audioConstraints => _createMediaStreamConstraint(jsProxy['audioConstraints']);
  set audioConstraints(MediaStreamConstraint value) => jsProxy['audioConstraints'] = jsify(value);

  MediaStreamConstraint get videoConstraints => _createMediaStreamConstraint(jsProxy['videoConstraints']);
  set videoConstraints(MediaStreamConstraint value) => jsProxy['videoConstraints'] = jsify(value);

  String get presentationId => jsProxy['presentationId'];
  set presentationId(String value) => jsProxy['presentationId'] = value;
}

class GetMediaStreamOptions extends ChromeObject {
  GetMediaStreamOptions({int? consumerTabId, int? targetTabId}) {
    if (consumerTabId != null) this.consumerTabId = consumerTabId;
    if (targetTabId != null) this.targetTabId = targetTabId;
  }
  GetMediaStreamOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get consumerTabId => jsProxy['consumerTabId'];
  set consumerTabId(int value) => jsProxy['consumerTabId'] = value;

  int get targetTabId => jsProxy['targetTabId'];
  set targetTabId(int value) => jsProxy['targetTabId'] = value;
}

CaptureInfo _createCaptureInfo(JsObject jsProxy) => CaptureInfo.fromProxy(jsProxy);
LocalMediaStream _createLocalMediaStream(JsObject jsProxy) => LocalMediaStream.fromProxy(jsProxy);
TabCaptureState _createTabCaptureState(String value) => TabCaptureState.VALUES.singleWhere((ChromeEnum e) => e.value == value);
MediaStreamConstraint _createMediaStreamConstraint(JsObject jsProxy) => MediaStreamConstraint.fromProxy(jsProxy);
