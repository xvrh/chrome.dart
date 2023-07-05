/* This file has been generated from web_navigation.json - do not edit */

/**
 * Use the `chrome.webNavigation` API to receive notifications about the status
 * of navigation requests in-flight.
 */
library chrome.webNavigation;

import 'extension_types.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.webNavigation` namespace.
 */
final ChromeWebNavigation webNavigation = ChromeWebNavigation._();

class ChromeWebNavigation extends ChromeApi {
  JsObject get _webNavigation => chrome['webNavigation'];

  /**
   * Fired when a navigation is about to occur.
   */
  Stream<Map> get onBeforeNavigate => _onBeforeNavigate.stream;
  late ChromeStreamController<Map> _onBeforeNavigate;

  /**
   * Fired when a navigation is committed. The document (and the resources it
   * refers to, such as images and subframes) might still be downloading, but at
   * least part of the document has been received from the server and the
   * browser has decided to switch to the new document.
   */
  Stream<Map> get onCommitted => _onCommitted.stream;
  late ChromeStreamController<Map> _onCommitted;

  /**
   * Fired when the page's DOM is fully constructed, but the referenced
   * resources may not finish loading.
   */
  Stream<Map> get onDOMContentLoaded => _onDOMContentLoaded.stream;
  late ChromeStreamController<Map> _onDOMContentLoaded;

  /**
   * Fired when a document, including the resources it refers to, is completely
   * loaded and initialized.
   */
  Stream<Map> get onCompleted => _onCompleted.stream;
  late ChromeStreamController<Map> _onCompleted;

  /**
   * Fired when an error occurs and the navigation is aborted. This can happen
   * if either a network error occurred, or the user aborted the navigation.
   */
  Stream<Map> get onErrorOccurred => _onErrorOccurred.stream;
  late ChromeStreamController<Map> _onErrorOccurred;

  /**
   * Fired when a new window, or a new tab in an existing window, is created to
   * host a navigation.
   */
  Stream<Map> get onCreatedNavigationTarget => _onCreatedNavigationTarget.stream;
  late ChromeStreamController<Map> _onCreatedNavigationTarget;

  /**
   * Fired when the reference fragment of a frame was updated. All future events
   * for that frame will use the updated URL.
   */
  Stream<Map> get onReferenceFragmentUpdated => _onReferenceFragmentUpdated.stream;
  late ChromeStreamController<Map> _onReferenceFragmentUpdated;

  /**
   * Fired when the contents of the tab is replaced by a different (usually
   * previously pre-rendered) tab.
   */
  Stream<Map> get onTabReplaced => _onTabReplaced.stream;
  late ChromeStreamController<Map> _onTabReplaced;

  /**
   * Fired when the frame's history was updated to a new URL. All future events
   * for that frame will use the updated URL.
   */
  Stream<Map> get onHistoryStateUpdated => _onHistoryStateUpdated.stream;
  late ChromeStreamController<Map> _onHistoryStateUpdated;

  ChromeWebNavigation._() {
    var getApi = () => _webNavigation;
    _onBeforeNavigate = ChromeStreamController<Map>.oneArg(getApi, 'onBeforeNavigate', mapify);
    _onCommitted = ChromeStreamController<Map>.oneArg(getApi, 'onCommitted', mapify);
    _onDOMContentLoaded = ChromeStreamController<Map>.oneArg(getApi, 'onDOMContentLoaded', mapify);
    _onCompleted = ChromeStreamController<Map>.oneArg(getApi, 'onCompleted', mapify);
    _onErrorOccurred = ChromeStreamController<Map>.oneArg(getApi, 'onErrorOccurred', mapify);
    _onCreatedNavigationTarget = ChromeStreamController<Map>.oneArg(getApi, 'onCreatedNavigationTarget', mapify);
    _onReferenceFragmentUpdated = ChromeStreamController<Map>.oneArg(getApi, 'onReferenceFragmentUpdated', mapify);
    _onTabReplaced = ChromeStreamController<Map>.oneArg(getApi, 'onTabReplaced', mapify);
    _onHistoryStateUpdated = ChromeStreamController<Map>.oneArg(getApi, 'onHistoryStateUpdated', mapify);
  }

  bool get available => _webNavigation != null;

  /**
   * Retrieves information about the given frame. A frame refers to an <iframe>
   * or a <frame> of a web page and is identified by a tab ID and a frame ID.
   * 
   * [details] Information about the frame to retrieve information about.
   */
  void getFrame(WebNavigationGetFrameParams details) {
    if (_webNavigation == null) _throwNotAvailable();

    _webNavigation.callMethod('getFrame', [jsify(details)]);
  }

  /**
   * Retrieves information about all frames of a given tab.
   * 
   * [details] Information about the tab to retrieve all frames from.
   */
  void getAllFrames(WebNavigationGetAllFramesParams details) {
    if (_webNavigation == null) _throwNotAvailable();

    _webNavigation.callMethod('getAllFrames', [jsify(details)]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.webNavigation' is not available");
  }
}

/**
 * Cause of the navigation. The same transition types as defined in the history
 * API are used. These are the same transition types as defined in the [history
 * API](history#transition_types) except with `"start_page"` in place of
 * `"auto_toplevel"` (for backwards compatibility).
 */
class TransitionType extends ChromeEnum {
  static const TransitionType LINK = const TransitionType._('link');
  static const TransitionType TYPED = const TransitionType._('typed');
  static const TransitionType AUTO_BOOKMARK = const TransitionType._('auto_bookmark');
  static const TransitionType AUTO_SUBFRAME = const TransitionType._('auto_subframe');
  static const TransitionType MANUAL_SUBFRAME = const TransitionType._('manual_subframe');
  static const TransitionType GENERATED = const TransitionType._('generated');
  static const TransitionType START_PAGE = const TransitionType._('start_page');
  static const TransitionType FORM_SUBMIT = const TransitionType._('form_submit');
  static const TransitionType RELOAD = const TransitionType._('reload');
  static const TransitionType KEYWORD = const TransitionType._('keyword');
  static const TransitionType KEYWORD_GENERATED = const TransitionType._('keyword_generated');

  static const List<TransitionType> VALUES = const[LINK, TYPED, AUTO_BOOKMARK, AUTO_SUBFRAME, MANUAL_SUBFRAME, GENERATED, START_PAGE, FORM_SUBMIT, RELOAD, KEYWORD, KEYWORD_GENERATED];

  const TransitionType._(String str): super(str);
}

class TransitionQualifier extends ChromeEnum {
  static const TransitionQualifier CLIENT_REDIRECT = const TransitionQualifier._('client_redirect');
  static const TransitionQualifier SERVER_REDIRECT = const TransitionQualifier._('server_redirect');
  static const TransitionQualifier FORWARD_BACK = const TransitionQualifier._('forward_back');
  static const TransitionQualifier FROM_ADDRESS_BAR = const TransitionQualifier._('from_address_bar');

  static const List<TransitionQualifier> VALUES = const[CLIENT_REDIRECT, SERVER_REDIRECT, FORWARD_BACK, FROM_ADDRESS_BAR];

  const TransitionQualifier._(String str): super(str);
}

class WebNavigationGetFrameParams extends ChromeObject {
  WebNavigationGetFrameParams({int? tabId, int? processId, int? frameId, String? documentId}) {
    if (tabId != null) this.tabId = tabId;
    if (processId != null) this.processId = processId;
    if (frameId != null) this.frameId = frameId;
    if (documentId != null) this.documentId = documentId;
  }
  WebNavigationGetFrameParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The ID of the tab in which the frame is.
   */
  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;

  /**
   * The ID of the process that runs the renderer for this tab.
   */
  int get processId => jsProxy['processId'];
  set processId(int value) => jsProxy['processId'] = value;

  /**
   * The ID of the frame in the given tab.
   */
  int get frameId => jsProxy['frameId'];
  set frameId(int value) => jsProxy['frameId'] = value;

  /**
   * The UUID of the document. If the frameId and/or tabId are provided they
   * will be validated to match the document found by provided document ID.
   */
  String get documentId => jsProxy['documentId'];
  set documentId(String value) => jsProxy['documentId'] = value;
}

class WebNavigationGetAllFramesParams extends ChromeObject {
  WebNavigationGetAllFramesParams({int? tabId}) {
    if (tabId != null) this.tabId = tabId;
  }
  WebNavigationGetAllFramesParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The ID of the tab.
   */
  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}
