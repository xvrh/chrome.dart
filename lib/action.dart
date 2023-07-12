import 'src/internal_helpers.dart';
import 'browser_action.dart';
import 'tabs.dart';
import 'src/js/action.dart' as $js;
export 'chrome.dart';

final _action = ChromeAction._();

extension ChromeActionExtension on Chrome {
  ChromeAction get action => _action;
}

class ChromeAction {
  ChromeAction._();

  /// Sets the title of the action. This shows up in the tooltip.
  Future<void> setTitle(SetTitleDetails details) => throw UnimplementedError();

  /// Gets the title of the action.
  Future<String> getTitle(TabDetails details) => throw UnimplementedError();

  /// Sets the icon for the action. The icon can be specified either as the path
  /// to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the **path** or the
  /// **imageData** property must be specified.
  Future<void> setIcon(SetIconDetails details) => throw UnimplementedError();

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// action's icon.
  Future<void> setPopup(SetPopupDetails details) => throw UnimplementedError();

  /// Gets the html document set as the popup for this action.
  Future<String> getPopup(TabDetails details) => throw UnimplementedError();

  /// Sets the badge text for the action. The badge is displayed on top of the
  /// icon.
  Future<void> setBadgeText(SetBadgeTextDetails details) =>
      throw UnimplementedError();

  /// Gets the badge text of the action. If no tab is specified, the
  /// non-tab-specific badge text is returned. If
  /// [displayActionCountAsBadgeText](declarativeNetRequest#setExtensionActionOptions)
  /// is enabled, a placeholder text will be returned unless the
  /// [declarativeNetRequestFeedback](declare_permissions#declarativeNetRequestFeedback)
  /// permission is present or tab-specific badge text was provided.
  Future<String> getBadgeText(TabDetails details) => throw UnimplementedError();

  /// Sets the background color for the badge.
  Future<void> setBadgeBackgroundColor(
          SetBadgeBackgroundColorDetails details) =>
      throw UnimplementedError();

  /// Gets the background color of the action.
  Future<ColorArray> getBadgeBackgroundColor(TabDetails details) =>
      throw UnimplementedError();

  /// Sets the text color for the badge.
  Future<void> setBadgeTextColor(SetBadgeTextColorDetails details) =>
      throw UnimplementedError();

  /// Gets the text color of the action.
  Future<ColorArray> getBadgeTextColor(TabDetails details) =>
      throw UnimplementedError();

  /// Enables the action for a tab. By default, actions are enabled.
  Future<void> enable(int? tabId) => throw UnimplementedError();

  /// Disables the action for a tab.
  Future<void> disable(int? tabId) => throw UnimplementedError();

  /// Indicates whether the extension action is enabled for a tab (or globally
  /// if no `tabId` is provided). Actions enabled using only
  /// [declarativeContent] always return false.
  Future<bool> isEnabled(int? tabId) => throw UnimplementedError();

  /// Returns the user-specified settings relating to an extension's action.
  Future<UserSettings> getUserSettings() => throw UnimplementedError();

  /// Opens the extension's popup.
  Future<void> openPopup(OpenPopupOptions? options) =>
      throw UnimplementedError();

  /// Fired when an action icon is clicked.  This event will not fire if the
  /// action has a popup.
  Stream<Tab> get onClicked => throw UnimplementedError();
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

class UserSettings {
  UserSettings.fromJS(this._wrapped);

  final $js.UserSettings _wrapped;

  $js.UserSettings get toJS => _wrapped;

  /// Whether the extension's action icon is visible on browser windows'
  /// top-level toolbar (i.e., whether the extension has been 'pinned' by the
  /// user).
  bool get isOnToolbar => _wrapped.isOnToolbar;
  set isOnToolbar(bool v) {
    throw UnimplementedError();
  }
}

class OpenPopupOptions {
  OpenPopupOptions.fromJS(this._wrapped);

  final $js.OpenPopupOptions _wrapped;

  $js.OpenPopupOptions get toJS => _wrapped;

  /// The id of the window to open the action popup in. Defaults to the
  /// currently-active window if unspecified.
  int? get windowId => _wrapped.windowId;
  set windowId(int? v) {
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

class SetBadgeTextColorDetails {
  SetBadgeTextColorDetails.fromJS(this._wrapped);

  final $js.SetBadgeTextColorDetails _wrapped;

  $js.SetBadgeTextColorDetails get toJS => _wrapped;
}
