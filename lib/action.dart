import 'browser_action.dart';
import 'src/internal_helpers.dart';
import 'src/js/action.dart' as $js;
import 'src/js/browser_action.dart' as $js_browser_action;
import 'tabs.dart';

export 'src/chrome.dart' show chrome;

final _action = ChromeAction._();

extension ChromeActionExtension on Chrome {
  ChromeAction get action => _action;
}

class ChromeAction {
  ChromeAction._();

  /// Sets the title of the action. This shows up in the tooltip.
  Future<void> setTitle(SetTitleDetails details) {
    var $completer = Completer<void>();
    $js.chrome.action.setTitle(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the title of the action.
  Future<String> getTitle(TabDetails details) {
    var $completer = Completer<String>();
    $js.chrome.action.getTitle(
      details.toJS,
      (String result) {
        $completer.complete(result);
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the icon for the action. The icon can be specified either as the path
  /// to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the **path** or the
  /// **imageData** property must be specified.
  Future<void> setIcon(SetIconDetails details) {
    var $completer = Completer<void>();
    $js.chrome.action.setIcon(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// action's icon.
  Future<void> setPopup(SetPopupDetails details) {
    var $completer = Completer<void>();
    $js.chrome.action.setPopup(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the html document set as the popup for this action.
  Future<String> getPopup(TabDetails details) {
    var $completer = Completer<String>();
    $js.chrome.action.getPopup(
      details.toJS,
      (String result) {
        $completer.complete(result);
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the badge text for the action. The badge is displayed on top of the
  /// icon.
  Future<void> setBadgeText(SetBadgeTextDetails details) {
    var $completer = Completer<void>();
    $js.chrome.action.setBadgeText(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the badge text of the action. If no tab is specified, the
  /// non-tab-specific badge text is returned. If
  /// [displayActionCountAsBadgeText](declarativeNetRequest#setExtensionActionOptions)
  /// is enabled, a placeholder text will be returned unless the
  /// [declarativeNetRequestFeedback](declare_permissions#declarativeNetRequestFeedback)
  /// permission is present or tab-specific badge text was provided.
  Future<String> getBadgeText(TabDetails details) {
    var $completer = Completer<String>();
    $js.chrome.action.getBadgeText(
      details.toJS,
      (String result) {
        $completer.complete(result);
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the background color for the badge.
  Future<void> setBadgeBackgroundColor(SetBadgeBackgroundColorDetails details) {
    var $completer = Completer<void>();
    $js.chrome.action.setBadgeBackgroundColor(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the background color of the action.
  Future<ColorArray> getBadgeBackgroundColor(TabDetails details) {
    var $completer = Completer<ColorArray>();
    $js.chrome.action.getBadgeBackgroundColor(
      details.toJS,
      ($js_browser_action.ColorArray result) {
        $completer.complete(ColorArray.fromJS(result));
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the text color for the badge.
  Future<void> setBadgeTextColor(SetBadgeTextColorDetails details) {
    var $completer = Completer<void>();
    $js.chrome.action.setBadgeTextColor(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the text color of the action.
  Future<ColorArray> getBadgeTextColor(TabDetails details) {
    var $completer = Completer<ColorArray>();
    $js.chrome.action.getBadgeTextColor(
      details.toJS,
      ($js_browser_action.ColorArray result) {
        $completer.complete(ColorArray.fromJS(result));
      }.toJS,
    );
    return $completer.future;
  }

  /// Enables the action for a tab. By default, actions are enabled.
  Future<void> enable(int? tabId) {
    var $completer = Completer<void>();
    $js.chrome.action.enable(
      tabId,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Disables the action for a tab.
  Future<void> disable(int? tabId) {
    var $completer = Completer<void>();
    $js.chrome.action.disable(
      tabId,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Indicates whether the extension action is enabled for a tab (or globally
  /// if no `tabId` is provided). Actions enabled using only
  /// [declarativeContent] always return false.
  Future<bool> isEnabled(int? tabId) {
    var $completer = Completer<bool>();
    $js.chrome.action.isEnabled(
      tabId,
      (bool isEnabled) {
        $completer.complete(isEnabled);
      }.toJS,
    );
    return $completer.future;
  }

  /// Returns the user-specified settings relating to an extension's action.
  Future<UserSettings> getUserSettings() {
    var $completer = Completer<UserSettings>();
    $js.chrome.action.getUserSettings(($js.UserSettings userSettings) {
      $completer.complete(UserSettings.fromJS(userSettings));
    }.toJS);
    return $completer.future;
  }

  /// Opens the extension's popup.
  Future<void> openPopup(OpenPopupOptions? options) {
    var $completer = Completer<void>();
    $js.chrome.action.openPopup(
      options?.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Fired when an action icon is clicked.  This event will not fire if the
  /// action has a popup.
  Stream<Tab> get onClicked => throw UnimplementedError();
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

class UserSettings {
  UserSettings.fromJS(this._wrapped);

  UserSettings({required bool isOnToolbar})
      : _wrapped = $js.UserSettings()..isOnToolbar = isOnToolbar;

  final $js.UserSettings _wrapped;

  $js.UserSettings get toJS => _wrapped;

  /// Whether the extension's action icon is visible on browser windows'
  /// top-level toolbar (i.e., whether the extension has been 'pinned' by the
  /// user).
  bool get isOnToolbar => _wrapped.isOnToolbar;
  set isOnToolbar(bool v) {
    _wrapped.isOnToolbar = v;
  }
}

class OpenPopupOptions {
  OpenPopupOptions.fromJS(this._wrapped);

  OpenPopupOptions({int? windowId})
      : _wrapped = $js.OpenPopupOptions()..windowId = windowId;

  final $js.OpenPopupOptions _wrapped;

  $js.OpenPopupOptions get toJS => _wrapped;

  /// The id of the window to open the action popup in. Defaults to the
  /// currently-active window if unspecified.
  int? get windowId => _wrapped.windowId;
  set windowId(int? v) {
    _wrapped.windowId = v;
  }
}

class SetTitleDetails {
  SetTitleDetails.fromJS(this._wrapped);

  SetTitleDetails({
    required String title,
    int? tabId,
  }) : _wrapped = $js.SetTitleDetails(
          title: title,
          tabId: tabId,
        );

  final $js.SetTitleDetails _wrapped;

  $js.SetTitleDetails get toJS => _wrapped;
}

class SetIconDetails {
  SetIconDetails.fromJS(this._wrapped);

  SetIconDetails({
    JSAny? imageData,
    JSAny? path,
    int? tabId,
  }) : _wrapped = $js.SetIconDetails(
          imageData: imageData,
          path: path,
          tabId: tabId,
        );

  final $js.SetIconDetails _wrapped;

  $js.SetIconDetails get toJS => _wrapped;
}

class SetPopupDetails {
  SetPopupDetails.fromJS(this._wrapped);

  SetPopupDetails({
    int? tabId,
    required String popup,
  }) : _wrapped = $js.SetPopupDetails(
          tabId: tabId,
          popup: popup,
        );

  final $js.SetPopupDetails _wrapped;

  $js.SetPopupDetails get toJS => _wrapped;
}

class SetBadgeTextDetails {
  SetBadgeTextDetails.fromJS(this._wrapped);

  SetBadgeTextDetails({
    required String text,
    int? tabId,
  }) : _wrapped = $js.SetBadgeTextDetails(
          text: text,
          tabId: tabId,
        );

  final $js.SetBadgeTextDetails _wrapped;

  $js.SetBadgeTextDetails get toJS => _wrapped;
}

class SetBadgeBackgroundColorDetails {
  SetBadgeBackgroundColorDetails.fromJS(this._wrapped);

  SetBadgeBackgroundColorDetails({
    required JSAny color,
    int? tabId,
  }) : _wrapped = $js.SetBadgeBackgroundColorDetails(
          color: color,
          tabId: tabId,
        );

  final $js.SetBadgeBackgroundColorDetails _wrapped;

  $js.SetBadgeBackgroundColorDetails get toJS => _wrapped;
}

class SetBadgeTextColorDetails {
  SetBadgeTextColorDetails.fromJS(this._wrapped);

  SetBadgeTextColorDetails({
    required JSAny color,
    int? tabId,
  }) : _wrapped = $js.SetBadgeTextColorDetails(
          color: color,
          tabId: tabId,
        );

  final $js.SetBadgeTextColorDetails _wrapped;

  $js.SetBadgeTextColorDetails get toJS => _wrapped;
}
