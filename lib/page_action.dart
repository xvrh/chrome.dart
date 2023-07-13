import 'src/internal_helpers.dart';
import 'src/js/page_action.dart' as $js;
import 'tabs.dart';

export 'src/chrome.dart' show chrome;

final _pageAction = ChromePageAction._();

extension ChromePageActionExtension on Chrome {
  ChromePageAction get pageAction => _pageAction;
}

class ChromePageAction {
  ChromePageAction._();

  /// Shows the page action. The page action is shown whenever the tab is
  /// selected.
  Future<void> show(int tabId) {
    var $completer = Completer<void>();
    $js.chrome.pageAction.show(
      tabId,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Hides the page action. Hidden page actions still appear in the Chrome
  /// toolbar, but are grayed out.
  Future<void> hide(int tabId) {
    var $completer = Completer<void>();
    $js.chrome.pageAction.hide(
      tabId,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the title of the page action. This is displayed in a tooltip over the
  /// page action.
  Future<void> setTitle(SetTitleDetails details) {
    var $completer = Completer<void>();
    $js.chrome.pageAction.setTitle(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the title of the page action.
  Future<String> getTitle(TabDetails details) {
    var $completer = Completer<String>();
    $js.chrome.pageAction.getTitle(
      details.toJS,
      (String result) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the icon for the page action. The icon can be specified either as the
  /// path to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the **path** or the
  /// **imageData** property must be specified.
  Future<void> setIcon(SetIconDetails details) {
    var $completer = Completer<void>();
    $js.chrome.pageAction.setIcon(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// page action's icon.
  Future<void> setPopup(SetPopupDetails details) {
    var $completer = Completer<void>();
    $js.chrome.pageAction.setPopup(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the html document set as the popup for this page action.
  Future<String> getPopup(TabDetails details) {
    var $completer = Completer<String>();
    $js.chrome.pageAction.getPopup(
      details.toJS,
      (String result) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Fired when a page action icon is clicked.  This event will not fire if the
  /// page action has a popup.
  Stream<Tab> get onClicked => throw UnimplementedError();
}

class ImageDataType {
  ImageDataType.fromJS(this._wrapped);

  ImageDataType() : _wrapped = $js.ImageDataType();

  final $js.ImageDataType _wrapped;

  $js.ImageDataType get toJS => _wrapped;
}

class TabDetails {
  TabDetails.fromJS(this._wrapped);

  TabDetails({int? tabId}) : _wrapped = $js.TabDetails()..tabId = tabId;

  final $js.TabDetails _wrapped;

  $js.TabDetails get toJS => _wrapped;

  /// The ID of the tab to query state for. If no tab is specified, the
  /// non-tab-specific state is returned.
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    _wrapped.tabId = v;
  }
}

class SetTitleDetails {
  SetTitleDetails.fromJS(this._wrapped);

  SetTitleDetails({
    required int tabId,
    required String title,
  }) : _wrapped = $js.SetTitleDetails(
          tabId: tabId,
          title: title,
        );

  final $js.SetTitleDetails _wrapped;

  $js.SetTitleDetails get toJS => _wrapped;
}

class SetIconDetails {
  SetIconDetails.fromJS(this._wrapped);

  SetIconDetails({
    required int tabId,
    JSAny? imageData,
    JSAny? path,
    int? iconIndex,
  }) : _wrapped = $js.SetIconDetails(
          tabId: tabId,
          imageData: imageData,
          path: path,
          iconIndex: iconIndex,
        );

  final $js.SetIconDetails _wrapped;

  $js.SetIconDetails get toJS => _wrapped;
}

class SetPopupDetails {
  SetPopupDetails.fromJS(this._wrapped);

  SetPopupDetails({
    required int tabId,
    required String popup,
  }) : _wrapped = $js.SetPopupDetails(
          tabId: tabId,
          popup: popup,
        );

  final $js.SetPopupDetails _wrapped;

  $js.SetPopupDetails get toJS => _wrapped;
}
