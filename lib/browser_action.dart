import 'src/internal_helpers.dart';
import 'tabs.dart';
import 'src/js/browser_action.dart' as $js;
export 'chrome.dart';

final _browserAction = ChromeBrowserAction._();

extension ChromeBrowserActionExtension on Chrome {
  ChromeBrowserAction get browserAction => _browserAction;
}

class ChromeBrowserAction {
  ChromeBrowserAction._();

  /// Sets the title of the browser action. This title appears in the tooltip.
  Future<void> setTitle(SetTitleDetails details) => throw UnimplementedError();

  /// Gets the title of the browser action.
  Future<String> getTitle(TabDetails details) => throw UnimplementedError();

  /// Sets the icon for the browser action. The icon can be specified as the
  /// path to an image file, as the pixel data from a canvas element, or as a
  /// dictionary of one of those. Either the `path` or the `imageData` property
  /// must be specified.
  void setIcon(
    SetIconDetails details,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Sets the HTML document to be opened as a popup when the user clicks the
  /// browser action icon.
  Future<void> setPopup(SetPopupDetails details) => throw UnimplementedError();

  /// Gets the HTML document that is set as the popup for this browser action.
  Future<String> getPopup(TabDetails details) => throw UnimplementedError();

  /// Sets the badge text for the browser action. The badge is displayed on top
  /// of the icon.
  Future<void> setBadgeText(SetBadgeTextDetails details) =>
      throw UnimplementedError();

  /// Gets the badge text of the browser action. If no tab is specified, the
  /// non-tab-specific badge text is returned.
  Future<String> getBadgeText(TabDetails details) => throw UnimplementedError();

  /// Sets the background color for the badge.
  Future<void> setBadgeBackgroundColor(
          SetBadgeBackgroundColorDetails details) =>
      throw UnimplementedError();

  /// Gets the background color of the browser action.
  Future<ColorArray> getBadgeBackgroundColor(TabDetails details) =>
      throw UnimplementedError();

  /// Enables the browser action for a tab. Defaults to enabled.
  Future<void> enable(int? tabId) => throw UnimplementedError();

  /// Disables the browser action for a tab.
  Future<void> disable(int? tabId) => throw UnimplementedError();

  /// Opens the extension popup window in the active window but does not grant
  /// tab permissions.
  void openPopup(JSAny callback) => throw UnimplementedError();

  /// Fired when a browser action icon is clicked. Does not fire if the browser
  /// action has a popup.
  Stream<Tab> get onClicked => throw UnimplementedError();
}

typedef ColorArray = List<int>;

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
    _wrapped.tabId = v;
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

class SetBadgeTextDetails {
  SetBadgeTextDetails.fromJS(this._wrapped);

  final $js.SetBadgeTextDetails _wrapped;

  $js.SetBadgeTextDetails get toJS => _wrapped;
}

class SetBadgeBackgroundColorDetails {
  SetBadgeBackgroundColorDetails.fromJS(this._wrapped);

  final $js.SetBadgeBackgroundColorDetails _wrapped;

  $js.SetBadgeBackgroundColorDetails get toJS => _wrapped;
}
