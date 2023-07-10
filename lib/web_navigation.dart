import 'chrome.dart';
export 'chrome.dart';

final _webNavigation = ChromeWebNavigation._();

extension ChromeWebNavigationExtension on Chrome {
  ChromeWebNavigation get webNavigation => _webNavigation;
}

class ChromeWebNavigation {
  ChromeWebNavigation._();

  /// Retrieves information about the given frame. A frame refers to an <iframe>
  /// or a <frame> of a web page and is identified by a tab ID and a frame ID.
  void getFrame(details) => throw UnimplementedError();

  /// Retrieves information about all frames of a given tab.
  void getAllFrames(details) => throw UnimplementedError();

  /// Fired when a navigation is about to occur.
  Stream get onBeforeNavigate => throw UnimplementedError();

  /// Fired when a navigation is committed. The document (and the resources it
  /// refers to, such as images and subframes) might still be downloading, but
  /// at least part of the document has been received from the server and the
  /// browser has decided to switch to the new document.
  Stream get onCommitted => throw UnimplementedError();

  /// Fired when the page's DOM is fully constructed, but the referenced
  /// resources may not finish loading.
  Stream get onDOMContentLoaded => throw UnimplementedError();

  /// Fired when a document, including the resources it refers to, is completely
  /// loaded and initialized.
  Stream get onCompleted => throw UnimplementedError();

  /// Fired when an error occurs and the navigation is aborted. This can happen
  /// if either a network error occurred, or the user aborted the navigation.
  Stream get onErrorOccurred => throw UnimplementedError();

  /// Fired when a new window, or a new tab in an existing window, is created to
  /// host a navigation.
  Stream get onCreatedNavigationTarget => throw UnimplementedError();

  /// Fired when the reference fragment of a frame was updated. All future
  /// events for that frame will use the updated URL.
  Stream get onReferenceFragmentUpdated => throw UnimplementedError();

  /// Fired when the contents of the tab is replaced by a different (usually
  /// previously pre-rendered) tab.
  Stream get onTabReplaced => throw UnimplementedError();

  /// Fired when the frame's history was updated to a new URL. All future events
  /// for that frame will use the updated URL.
  Stream get onHistoryStateUpdated => throw UnimplementedError();
}

/// Cause of the navigation. The same transition types as defined in the history
/// API are used. These are the same transition types as defined in the <a
/// href="history#transition_types">history API</a> except with `"start_page"`
/// in place of `"auto_toplevel"` (for backwards compatibility).
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
}

enum TransitionQualifier {
  clientRedirect('client_redirect'),
  serverRedirect('server_redirect'),
  forwardBack('forward_back'),
  fromAddressBar('from_address_bar');

  const TransitionQualifier(this.value);

  final String value;
}
