import 'extension_types.dart';
import 'src/internal_helpers.dart';
import 'src/js/web_navigation.dart' as $js;

export 'src/chrome.dart' show chrome;

final _webNavigation = ChromeWebNavigation._();

extension ChromeWebNavigationExtension on Chrome {
  ChromeWebNavigation get webNavigation => _webNavigation;
}

class ChromeWebNavigation {
  ChromeWebNavigation._();

  /// Retrieves information about the given frame. A frame refers to an <iframe>
  /// or a <frame> of a web page and is identified by a tab ID and a frame ID.
  Future<GetFrameCallbackDetails?> getFrame(GetFrameDetails details) {
    var $completer = Completer<GetFrameCallbackDetails?>();
    $js.chrome.webNavigation.getFrame(
      details.toJS,
      (GetFrameCallbackDetails? details) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Retrieves information about all frames of a given tab.
  Future<GetAllFramesCallbackDetails?> getAllFrames(
      GetAllFramesDetails details) {
    var $completer = Completer<GetAllFramesCallbackDetails?>();
    $js.chrome.webNavigation.getAllFrames(
      details.toJS,
      (GetAllFramesCallbackDetails? details) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Fired when a navigation is about to occur.
  Stream<OnBeforeNavigateDetails> get onBeforeNavigate =>
      throw UnimplementedError();

  /// Fired when a navigation is committed. The document (and the resources it
  /// refers to, such as images and subframes) might still be downloading, but
  /// at least part of the document has been received from the server and the
  /// browser has decided to switch to the new document.
  Stream<OnCommittedDetails> get onCommitted => throw UnimplementedError();

  /// Fired when the page's DOM is fully constructed, but the referenced
  /// resources may not finish loading.
  Stream<OnDomContentLoadedDetails> get onDOMContentLoaded =>
      throw UnimplementedError();

  /// Fired when a document, including the resources it refers to, is completely
  /// loaded and initialized.
  Stream<OnCompletedDetails> get onCompleted => throw UnimplementedError();

  /// Fired when an error occurs and the navigation is aborted. This can happen
  /// if either a network error occurred, or the user aborted the navigation.
  Stream<OnErrorOccurredDetails> get onErrorOccurred =>
      throw UnimplementedError();

  /// Fired when a new window, or a new tab in an existing window, is created to
  /// host a navigation.
  Stream<OnCreatedNavigationTargetDetails> get onCreatedNavigationTarget =>
      throw UnimplementedError();

  /// Fired when the reference fragment of a frame was updated. All future
  /// events for that frame will use the updated URL.
  Stream<OnReferenceFragmentUpdatedDetails> get onReferenceFragmentUpdated =>
      throw UnimplementedError();

  /// Fired when the contents of the tab is replaced by a different (usually
  /// previously pre-rendered) tab.
  Stream<OnTabReplacedDetails> get onTabReplaced => throw UnimplementedError();

  /// Fired when the frame's history was updated to a new URL. All future events
  /// for that frame will use the updated URL.
  Stream<OnHistoryStateUpdatedDetails> get onHistoryStateUpdated =>
      throw UnimplementedError();
}

/// Cause of the navigation. The same transition types as defined in the history
/// API are used. These are the same transition types as defined in the [history
/// API](history#transition_types) except with `"start_page"` in place of
/// `"auto_toplevel"` (for backwards compatibility).
enum TransitionType {
  link('link'),
  typed('typed'),
  autoBookmark('auto_bookmark'),
  autoSubframe('auto_subframe'),
  manualSubframe('manual_subframe'),
  generated('generated'),
  startPage('start_page'),
  formSubmit('form_submit'),
  reload('reload'),
  keyword('keyword'),
  keywordGenerated('keyword_generated');

  const TransitionType(this.value);

  final String value;

  String get toJS => value;
  static TransitionType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum TransitionQualifier {
  clientRedirect('client_redirect'),
  serverRedirect('server_redirect'),
  forwardBack('forward_back'),
  fromAddressBar('from_address_bar');

  const TransitionQualifier(this.value);

  final String value;

  String get toJS => value;
  static TransitionQualifier fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class OnBeforeNavigateDetails {
  OnBeforeNavigateDetails.fromJS(this._wrapped);

  OnBeforeNavigateDetails({
    required int tabId,
    required String url,
    required int processId,
    required int frameId,
    required int parentFrameId,
    required double timeStamp,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
  }) : _wrapped = $js.OnBeforeNavigateDetails()
          ..tabId = tabId
          ..url = url
          ..processId = processId
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..timeStamp = timeStamp
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS;

  final $js.OnBeforeNavigateDetails _wrapped;

  $js.OnBeforeNavigateDetails get toJS => _wrapped;

  /// The ID of the tab in which the navigation is about to occur.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The value of -1.
  int get processId => _wrapped.processId;
  set processId(int v) {
    _wrapped.processId = v;
  }

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique for a given
  /// tab and process.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// The ID of the parent frame, or `-1` if this is the main frame.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The time when the browser was about to start the navigation, in
  /// milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the navigation occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }
}

class OnCommittedDetails {
  OnCommittedDetails.fromJS(this._wrapped);

  OnCommittedDetails({
    required int tabId,
    required String url,
    required int processId,
    required int frameId,
    required int parentFrameId,
    required TransitionType transitionType,
    required List<TransitionQualifier> transitionQualifiers,
    required double timeStamp,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
  }) : _wrapped = $js.OnCommittedDetails()
          ..tabId = tabId
          ..url = url
          ..processId = processId
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..transitionType = transitionType.toJS
          ..transitionQualifiers = throw UnimplementedError()
          ..timeStamp = timeStamp
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS;

  final $js.OnCommittedDetails _wrapped;

  $js.OnCommittedDetails get toJS => _wrapped;

  /// The ID of the tab in which the navigation occurs.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The ID of the process that runs the renderer for this frame.
  int get processId => _wrapped.processId;
  set processId(int v) {
    _wrapped.processId = v;
  }

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// The ID of the parent frame, or `-1` if this is the main frame.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// Cause of the navigation.
  TransitionType get transitionType =>
      TransitionType.fromJS(_wrapped.transitionType);
  set transitionType(TransitionType v) {
    _wrapped.transitionType = v.toJS;
  }

  /// A list of transition qualifiers.
  List<TransitionQualifier> get transitionQualifiers =>
      _wrapped.transitionQualifiers.toDart
          .cast<$js.TransitionQualifier>()
          .map((e) => TransitionQualifier.fromJS(e))
          .toList();
  set transitionQualifiers(List<TransitionQualifier> v) {
    _wrapped.transitionQualifiers = throw UnimplementedError();
  }

  /// The time when the navigation was committed, in milliseconds since the
  /// epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// A UUID of the document loaded.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the navigation occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }
}

class OnDomContentLoadedDetails {
  OnDomContentLoadedDetails.fromJS(this._wrapped);

  OnDomContentLoadedDetails({
    required int tabId,
    required String url,
    required int processId,
    required int frameId,
    required int parentFrameId,
    required double timeStamp,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
  }) : _wrapped = $js.OnDomContentLoadedDetails()
          ..tabId = tabId
          ..url = url
          ..processId = processId
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..timeStamp = timeStamp
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS;

  final $js.OnDomContentLoadedDetails _wrapped;

  $js.OnDomContentLoadedDetails get toJS => _wrapped;

  /// The ID of the tab in which the navigation occurs.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The ID of the process that runs the renderer for this frame.
  int get processId => _wrapped.processId;
  set processId(int v) {
    _wrapped.processId = v;
  }

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// The ID of the parent frame, or `-1` if this is the main frame.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The time when the page's DOM was fully constructed, in milliseconds since
  /// the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// A UUID of the document loaded.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the navigation occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }
}

class OnCompletedDetails {
  OnCompletedDetails.fromJS(this._wrapped);

  OnCompletedDetails({
    required int tabId,
    required String url,
    required int processId,
    required int frameId,
    required int parentFrameId,
    required double timeStamp,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
  }) : _wrapped = $js.OnCompletedDetails()
          ..tabId = tabId
          ..url = url
          ..processId = processId
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..timeStamp = timeStamp
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS;

  final $js.OnCompletedDetails _wrapped;

  $js.OnCompletedDetails get toJS => _wrapped;

  /// The ID of the tab in which the navigation occurs.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The ID of the process that runs the renderer for this frame.
  int get processId => _wrapped.processId;
  set processId(int v) {
    _wrapped.processId = v;
  }

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// The ID of the parent frame, or `-1` if this is the main frame.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The time when the document finished loading, in milliseconds since the
  /// epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// A UUID of the document loaded.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the navigation occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }
}

class OnErrorOccurredDetails {
  OnErrorOccurredDetails.fromJS(this._wrapped);

  OnErrorOccurredDetails({
    required int tabId,
    required String url,
    required int processId,
    required int frameId,
    required int parentFrameId,
    required String error,
    required double timeStamp,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
  }) : _wrapped = $js.OnErrorOccurredDetails()
          ..tabId = tabId
          ..url = url
          ..processId = processId
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..error = error
          ..timeStamp = timeStamp
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS;

  final $js.OnErrorOccurredDetails _wrapped;

  $js.OnErrorOccurredDetails get toJS => _wrapped;

  /// The ID of the tab in which the navigation occurs.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The value of -1.
  int get processId => _wrapped.processId;
  set processId(int v) {
    _wrapped.processId = v;
  }

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// The ID of the parent frame, or `-1` if this is the main frame.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The error description.
  String get error => _wrapped.error;
  set error(String v) {
    _wrapped.error = v;
  }

  /// The time when the error occurred, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// A UUID of the document loaded.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the navigation occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }
}

class OnCreatedNavigationTargetDetails {
  OnCreatedNavigationTargetDetails.fromJS(this._wrapped);

  OnCreatedNavigationTargetDetails({
    required int sourceTabId,
    required int sourceProcessId,
    required int sourceFrameId,
    required String url,
    required int tabId,
    required double timeStamp,
  }) : _wrapped = $js.OnCreatedNavigationTargetDetails()
          ..sourceTabId = sourceTabId
          ..sourceProcessId = sourceProcessId
          ..sourceFrameId = sourceFrameId
          ..url = url
          ..tabId = tabId
          ..timeStamp = timeStamp;

  final $js.OnCreatedNavigationTargetDetails _wrapped;

  $js.OnCreatedNavigationTargetDetails get toJS => _wrapped;

  /// The ID of the tab in which the navigation is triggered.
  int get sourceTabId => _wrapped.sourceTabId;
  set sourceTabId(int v) {
    _wrapped.sourceTabId = v;
  }

  /// The ID of the process that runs the renderer for the source frame.
  int get sourceProcessId => _wrapped.sourceProcessId;
  set sourceProcessId(int v) {
    _wrapped.sourceProcessId = v;
  }

  /// The ID of the frame with sourceTabId in which the navigation is triggered.
  /// 0 indicates the main frame.
  int get sourceFrameId => _wrapped.sourceFrameId;
  set sourceFrameId(int v) {
    _wrapped.sourceFrameId = v;
  }

  /// The URL to be opened in the new window.
  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The ID of the tab in which the url is opened
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// The time when the browser was about to create a new view, in milliseconds
  /// since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }
}

class OnReferenceFragmentUpdatedDetails {
  OnReferenceFragmentUpdatedDetails.fromJS(this._wrapped);

  OnReferenceFragmentUpdatedDetails({
    required int tabId,
    required String url,
    required int processId,
    required int frameId,
    required int parentFrameId,
    required TransitionType transitionType,
    required List<TransitionQualifier> transitionQualifiers,
    required double timeStamp,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
  }) : _wrapped = $js.OnReferenceFragmentUpdatedDetails()
          ..tabId = tabId
          ..url = url
          ..processId = processId
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..transitionType = transitionType.toJS
          ..transitionQualifiers = throw UnimplementedError()
          ..timeStamp = timeStamp
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS;

  final $js.OnReferenceFragmentUpdatedDetails _wrapped;

  $js.OnReferenceFragmentUpdatedDetails get toJS => _wrapped;

  /// The ID of the tab in which the navigation occurs.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The ID of the process that runs the renderer for this frame.
  int get processId => _wrapped.processId;
  set processId(int v) {
    _wrapped.processId = v;
  }

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// The ID of the parent frame, or `-1` if this is the main frame.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// Cause of the navigation.
  TransitionType get transitionType =>
      TransitionType.fromJS(_wrapped.transitionType);
  set transitionType(TransitionType v) {
    _wrapped.transitionType = v.toJS;
  }

  /// A list of transition qualifiers.
  List<TransitionQualifier> get transitionQualifiers =>
      _wrapped.transitionQualifiers.toDart
          .cast<$js.TransitionQualifier>()
          .map((e) => TransitionQualifier.fromJS(e))
          .toList();
  set transitionQualifiers(List<TransitionQualifier> v) {
    _wrapped.transitionQualifiers = throw UnimplementedError();
  }

  /// The time when the navigation was committed, in milliseconds since the
  /// epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// A UUID of the document loaded.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the navigation occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }
}

class OnTabReplacedDetails {
  OnTabReplacedDetails.fromJS(this._wrapped);

  OnTabReplacedDetails({
    required int replacedTabId,
    required int tabId,
    required double timeStamp,
  }) : _wrapped = $js.OnTabReplacedDetails()
          ..replacedTabId = replacedTabId
          ..tabId = tabId
          ..timeStamp = timeStamp;

  final $js.OnTabReplacedDetails _wrapped;

  $js.OnTabReplacedDetails get toJS => _wrapped;

  /// The ID of the tab that was replaced.
  int get replacedTabId => _wrapped.replacedTabId;
  set replacedTabId(int v) {
    _wrapped.replacedTabId = v;
  }

  /// The ID of the tab that replaced the old tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// The time when the replacement happened, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }
}

class OnHistoryStateUpdatedDetails {
  OnHistoryStateUpdatedDetails.fromJS(this._wrapped);

  OnHistoryStateUpdatedDetails({
    required int tabId,
    required String url,
    required int processId,
    required int frameId,
    required int parentFrameId,
    required TransitionType transitionType,
    required List<TransitionQualifier> transitionQualifiers,
    required double timeStamp,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
  }) : _wrapped = $js.OnHistoryStateUpdatedDetails()
          ..tabId = tabId
          ..url = url
          ..processId = processId
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..transitionType = transitionType.toJS
          ..transitionQualifiers = throw UnimplementedError()
          ..timeStamp = timeStamp
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS;

  final $js.OnHistoryStateUpdatedDetails _wrapped;

  $js.OnHistoryStateUpdatedDetails get toJS => _wrapped;

  /// The ID of the tab in which the navigation occurs.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The ID of the process that runs the renderer for this frame.
  int get processId => _wrapped.processId;
  set processId(int v) {
    _wrapped.processId = v;
  }

  /// 0 indicates the navigation happens in the tab content window; a positive
  /// value indicates navigation in a subframe. Frame IDs are unique within a
  /// tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// The ID of the parent frame, or `-1` if this is the main frame.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// Cause of the navigation.
  TransitionType get transitionType =>
      TransitionType.fromJS(_wrapped.transitionType);
  set transitionType(TransitionType v) {
    _wrapped.transitionType = v.toJS;
  }

  /// A list of transition qualifiers.
  List<TransitionQualifier> get transitionQualifiers =>
      _wrapped.transitionQualifiers.toDart
          .cast<$js.TransitionQualifier>()
          .map((e) => TransitionQualifier.fromJS(e))
          .toList();
  set transitionQualifiers(List<TransitionQualifier> v) {
    _wrapped.transitionQualifiers = throw UnimplementedError();
  }

  /// The time when the navigation was committed, in milliseconds since the
  /// epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// A UUID of the document loaded.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the navigation occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }
}

class GetFrameCallbackDetails {
  GetFrameCallbackDetails.fromJS(this._wrapped);

  GetFrameCallbackDetails({
    required bool errorOccurred,
    required String url,
    required int parentFrameId,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
  }) : _wrapped = $js.GetFrameCallbackDetails()
          ..errorOccurred = errorOccurred
          ..url = url
          ..parentFrameId = parentFrameId
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS;

  final $js.GetFrameCallbackDetails _wrapped;

  $js.GetFrameCallbackDetails get toJS => _wrapped;

  /// True if the last navigation in this frame was interrupted by an error,
  /// i.e. the onErrorOccurred event fired.
  bool get errorOccurred => _wrapped.errorOccurred;
  set errorOccurred(bool v) {
    _wrapped.errorOccurred = v;
  }

  /// The URL currently associated with this frame, if the frame identified by
  /// the frameId existed at one point in the given tab. The fact that an URL is
  /// associated with a given frameId does not imply that the corresponding
  /// frame still exists.
  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The ID of the parent frame, or `-1` if this is the main frame.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// A UUID of the document loaded.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the navigation occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }
}

class GetFrameDetails {
  GetFrameDetails.fromJS(this._wrapped);

  GetFrameDetails({
    int? tabId,
    int? processId,
    int? frameId,
    String? documentId,
  }) : _wrapped = $js.GetFrameDetails(
          tabId: tabId,
          processId: processId,
          frameId: frameId,
          documentId: documentId,
        );

  final $js.GetFrameDetails _wrapped;

  $js.GetFrameDetails get toJS => _wrapped;
}

class GetAllFramesCallbackDetails {
  GetAllFramesCallbackDetails.fromJS(this._wrapped);

  GetAllFramesCallbackDetails({
    required bool errorOccurred,
    required int processId,
    required int frameId,
    required int parentFrameId,
    required String url,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
  }) : _wrapped = $js.GetAllFramesCallbackDetails()
          ..errorOccurred = errorOccurred
          ..processId = processId
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..url = url
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS;

  final $js.GetAllFramesCallbackDetails _wrapped;

  $js.GetAllFramesCallbackDetails get toJS => _wrapped;

  /// True if the last navigation in this frame was interrupted by an error,
  /// i.e. the onErrorOccurred event fired.
  bool get errorOccurred => _wrapped.errorOccurred;
  set errorOccurred(bool v) {
    _wrapped.errorOccurred = v;
  }

  /// The ID of the process that runs the renderer for this frame.
  int get processId => _wrapped.processId;
  set processId(int v) {
    _wrapped.processId = v;
  }

  /// The ID of the frame. 0 indicates that this is the main frame; a positive
  /// value indicates the ID of a subframe.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// The ID of the parent frame, or `-1` if this is the main frame.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The URL currently associated with this frame.
  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// A UUID of the document loaded.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// A UUID of the parent document owning this frame. This is not set if there
  /// is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the navigation occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }
}

class GetAllFramesDetails {
  GetAllFramesDetails.fromJS(this._wrapped);

  GetAllFramesDetails({required int tabId})
      : _wrapped = $js.GetAllFramesDetails(tabId: tabId);

  final $js.GetAllFramesDetails _wrapped;

  $js.GetAllFramesDetails get toJS => _wrapped;
}
