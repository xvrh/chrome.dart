import 'src/internal_helpers.dart';
import 'tabs.dart';
import 'src/js/page_action.dart' as $js;
export 'chrome.dart';

final _pageAction = ChromePageAction._();

extension ChromePageActionExtension on Chrome {
  ChromePageAction get pageAction => _pageAction;
}

class ChromePageAction {
  ChromePageAction._();

  /// Shows the page action. The page action is shown whenever the tab is
  /// selected.
  Future<void> show(int tabId) => throw UnimplementedError();

  /// Hides the page action. Hidden page actions still appear in the Chrome
  /// toolbar, but are grayed out.
  Future<void> hide(int tabId) => throw UnimplementedError();

  /// Sets the title of the page action. This is displayed in a tooltip over the
  /// page action.
  Future<void> setTitle(SetTitleDetails details) => throw UnimplementedError();

  /// Gets the title of the page action.
  Future<String> getTitle(TabDetails details) => throw UnimplementedError();

  /// Sets the icon for the page action. The icon can be specified either as the
  /// path to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the **path** or the
  /// **imageData** property must be specified.
  Future<void> setIcon(SetIconDetails details) => throw UnimplementedError();

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// page action's icon.
  Future<void> setPopup(SetPopupDetails details) => throw UnimplementedError();

  /// Gets the html document set as the popup for this page action.
  Future<String> getPopup(TabDetails details) => throw UnimplementedError();

  /// Fired when a page action icon is clicked.  This event will not fire if the
  /// page action has a popup.
  Stream<Tab> get onClicked => throw UnimplementedError();
}

class ImageDataType {
  ImageDataType.fromJS(this._wrapped);

  final $js.ImageDataType _wrapped;

  $js.ImageDataType get toJS => _wrapped;
}

class TabDetails {
  TabDetails.fromJS(this._wrapped);

  final $js.TabDetails _wrapped;

  $js.TabDetails get toJS => _wrapped;

  /// The ID of the tab to query state for. If no tab is specified, the
  /// non-tab-specific state is returned.
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    throw UnimplementedError();
  }
}

class SetTitleDetails {
  SetTitleDetails.fromJS(this._wrapped);

  final $js.SetTitleDetails _wrapped;

  $js.SetTitleDetails get toJS => _wrapped;
}

class SetIconDetails {
  SetIconDetails.fromJS(this._wrapped);

  final $js.SetIconDetails _wrapped;

  $js.SetIconDetails get toJS => _wrapped;
}

class SetPopupDetails {
  SetPopupDetails.fromJS(this._wrapped);

  final $js.SetPopupDetails _wrapped;

  $js.SetPopupDetails get toJS => _wrapped;
}
