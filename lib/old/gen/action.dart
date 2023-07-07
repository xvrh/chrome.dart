/* This file has been generated from action.json - do not edit */

/**
 * Use the `chrome.action` API to control the extension's icon in the Google
 * Chrome toolbar.
 */
library chrome.action;

import 'tabs.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.action` namespace.
 */
final ChromeAction action = ChromeAction._();

class ChromeAction extends ChromeApi {
  JsObject get _action => chrome['action'];

  /**
   * Fired when an action icon is clicked.  This event will not fire if the
   * action has a popup.
   */
  Stream<Tab> get onClicked => _onClicked.stream;
  late ChromeStreamController<Tab> _onClicked;

  ChromeAction._() {
    var getApi = () => _action;
    _onClicked = ChromeStreamController<Tab>.oneArg(getApi, 'onClicked', _createTab);
  }

  bool get available => _action != null;

  /**
   * Sets the title of the action. This shows up in the tooltip.
   */
  void setTitle(ActionSetTitleParams details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('setTitle', [jsify(details)]);
  }

  /**
   * Gets the title of the action.
   */
  void getTitle(TabDetails details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('getTitle', [jsify(details)]);
  }

  /**
   * Sets the icon for the action. The icon can be specified either as the path
   * to an image file or as the pixel data from a canvas element, or as
   * dictionary of either one of those. Either the <b>path</b> or the
   * <b>imageData</b> property must be specified.
   */
  void setIcon(ActionSetIconParams details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('setIcon', [jsify(details)]);
  }

  /**
   * Sets the HTML document to be opened as a popup when the user clicks on the
   * action's icon.
   */
  void setPopup(ActionSetPopupParams details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('setPopup', [jsify(details)]);
  }

  /**
   * Gets the html document set as the popup for this action.
   */
  void getPopup(TabDetails details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('getPopup', [jsify(details)]);
  }

  /**
   * Sets the badge text for the action. The badge is displayed on top of the
   * icon.
   */
  void setBadgeText(ActionSetBadgeTextParams details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('setBadgeText', [jsify(details)]);
  }

  /**
   * Gets the badge text of the action. If no tab is specified, the
   * non-tab-specific badge text is returned. If
   * [displayActionCountAsBadgeText](declarativeNetRequest#setExtensionActionOptions)
   * is enabled, a placeholder text will be returned unless the
   * [declarativeNetRequestFeedback](declare_permissions#declarativeNetRequestFeedback)
   * permission is present or tab-specific badge text was provided.
   */
  void getBadgeText(TabDetails details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('getBadgeText', [jsify(details)]);
  }

  /**
   * Sets the background color for the badge.
   */
  void setBadgeBackgroundColor(ActionSetBadgeBackgroundColorParams details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('setBadgeBackgroundColor', [jsify(details)]);
  }

  /**
   * Gets the background color of the action.
   */
  void getBadgeBackgroundColor(TabDetails details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('getBadgeBackgroundColor', [jsify(details)]);
  }

  /**
   * Sets the text color for the badge.
   */
  void setBadgeTextColor(ActionSetBadgeTextColorParams details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('setBadgeTextColor', [jsify(details)]);
  }

  /**
   * Gets the text color of the action.
   */
  void getBadgeTextColor(TabDetails details) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('getBadgeTextColor', [jsify(details)]);
  }

  /**
   * Enables the action for a tab. By default, actions are enabled.
   * 
   * [tabId] The id of the tab for which you want to modify the action.
   */
  void enable([int? tabId]) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('enable', [tabId]);
  }

  /**
   * Disables the action for a tab.
   * 
   * [tabId] The id of the tab for which you want to modify the action.
   */
  void disable([int? tabId]) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('disable', [tabId]);
  }

  /**
   * Indicates whether the extension action is enabled for a tab (or globally if
   * no `tabId` is provided). Actions enabled using only [declarativeContent]
   * always return false.
   * 
   * [tabId] The id of the tab for which you want check enabled status.
   */
  void isEnabled([int? tabId]) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('isEnabled', [tabId]);
  }

  /**
   * Returns the user-specified settings relating to an extension's action.
   */
  void getUserSettings() {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('getUserSettings');
  }

  /**
   * Opens the extension's popup.
   * 
   * [options] Specifies options for opening the popup.
   */
  void openPopup([OpenPopupOptions? options]) {
    if (_action == null) _throwNotAvailable();

    _action.callMethod('openPopup', [jsify(options)]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.action' is not available");
  }
}

class TabDetails extends ChromeObject {
  TabDetails({int? tabId}) {
    if (tabId != null) this.tabId = tabId;
  }
  TabDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The ID of the tab to query state for. If no tab is specified, the
   * non-tab-specific state is returned.
   */
  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

/**
 * The collection of user-specified settings relating to an extension's action.
 */
class UserSettings extends ChromeObject {
  UserSettings({bool? isOnToolbar}) {
    if (isOnToolbar != null) this.isOnToolbar = isOnToolbar;
  }
  UserSettings.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Whether the extension's action icon is visible on browser windows'
   * top-level toolbar (i.e., whether the extension has been 'pinned' by the
   * user).
   */
  bool get isOnToolbar => jsProxy['isOnToolbar'];
  set isOnToolbar(bool value) => jsProxy['isOnToolbar'] = value;
}

class OpenPopupOptions extends ChromeObject {
  OpenPopupOptions({int? windowId}) {
    if (windowId != null) this.windowId = windowId;
  }
  OpenPopupOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The id of the window to open the action popup in. Defaults to the
   * currently-active window if unspecified.
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;
}

class ActionSetTitleParams extends ChromeObject {
  ActionSetTitleParams({String? title, int? tabId}) {
    if (title != null) this.title = title;
    if (tabId != null) this.tabId = tabId;
  }
  ActionSetTitleParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The string the action should display when moused over.
   */
  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  /**
   * Limits the change to when a particular tab is selected. Automatically
   * resets when the tab is closed.
   */
  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

class ActionSetIconParams extends ChromeObject {
  ActionSetIconParams({Object? imageData, Object? path, int? tabId}) {
    if (imageData != null) this.imageData = imageData;
    if (path != null) this.path = path;
    if (tabId != null) this.tabId = tabId;
  }
  ActionSetIconParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Either an ImageData object or a dictionary {size -> ImageData} representing
   * icon to be set. If the icon is specified as a dictionary, the actual image
   * to be used is chosen depending on screen's pixel density. If the number of
   * image pixels that fit into one screen space unit equals `scale`, then image
   * with size `scale` * n will be selected, where n is the size of the icon in
   * the UI. At least one image must be specified. Note that 'details.imageData
   * = foo' is equivalent to 'details.imageData = {'16': foo}'
   */
  Object get imageData => jsProxy['imageData'];
  set imageData(Object value) => jsProxy['imageData'] = jsify(value);

  /**
   * Either a relative image path or a dictionary {size -> relative image path}
   * pointing to icon to be set. If the icon is specified as a dictionary, the
   * actual image to be used is chosen depending on screen's pixel density. If
   * the number of image pixels that fit into one screen space unit equals
   * `scale`, then image with size `scale` * n will be selected, where n is the
   * size of the icon in the UI. At least one image must be specified. Note that
   * 'details.path = foo' is equivalent to 'details.path = {'16': foo}'
   */
  Object get path => jsProxy['path'];
  set path(Object value) => jsProxy['path'] = jsify(value);

  /**
   * Limits the change to when a particular tab is selected. Automatically
   * resets when the tab is closed.
   */
  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

class ActionSetPopupParams extends ChromeObject {
  ActionSetPopupParams({int? tabId, String? popup}) {
    if (tabId != null) this.tabId = tabId;
    if (popup != null) this.popup = popup;
  }
  ActionSetPopupParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Limits the change to when a particular tab is selected. Automatically
   * resets when the tab is closed.
   */
  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;

  /**
   * The relative path to the HTML file to show in a popup. If set to the empty
   * string (`''`), no popup is shown.
   */
  String get popup => jsProxy['popup'];
  set popup(String value) => jsProxy['popup'] = value;
}

class ActionSetBadgeTextParams extends ChromeObject {
  ActionSetBadgeTextParams({String? text, int? tabId}) {
    if (text != null) this.text = text;
    if (tabId != null) this.tabId = tabId;
  }
  ActionSetBadgeTextParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Any number of characters can be passed, but only about four can fit in the
   * space.
   */
  String get text => jsProxy['text'];
  set text(String value) => jsProxy['text'] = value;

  /**
   * Limits the change to when a particular tab is selected. Automatically
   * resets when the tab is closed.
   */
  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

class ActionSetBadgeBackgroundColorParams extends ChromeObject {
  ActionSetBadgeBackgroundColorParams({Object? color, int? tabId}) {
    if (color != null) this.color = color;
    if (tabId != null) this.tabId = tabId;
  }
  ActionSetBadgeBackgroundColorParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * An array of four integers in the range [0,255] that make up the RGBA color
   * of the badge. For example, opaque red is `[255, 0, 0, 255]`. Can also be a
   * string with a CSS value, with opaque red being `#FF0000` or `#F00`.
   */
  Object get color => jsProxy['color'];
  set color(Object value) => jsProxy['color'] = jsify(value);

  /**
   * Limits the change to when a particular tab is selected. Automatically
   * resets when the tab is closed.
   */
  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

class ActionSetBadgeTextColorParams extends ChromeObject {
  ActionSetBadgeTextColorParams({Object? color, int? tabId}) {
    if (color != null) this.color = color;
    if (tabId != null) this.tabId = tabId;
  }
  ActionSetBadgeTextColorParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * An array of four integers in the range [0,255] that make up the RGBA color
   * of the badge. For example, opaque red is `[255, 0, 0, 255]`. Can also be a
   * string with a CSS value, with opaque red being `#FF0000` or `#F00`. Not
   * setting this value will cause a color to be automatically chosen that will
   * contrast with the badge's background color so the text will be visible.
   * Colors with alpha values equivalent to 0 will not be set and will return an
   * error.
   */
  Object get color => jsProxy['color'];
  set color(Object value) => jsProxy['color'] = jsify(value);

  /**
   * Limits the change to when a particular tab is selected. Automatically
   * resets when the tab is closed.
   */
  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

Tab _createTab(JsObject jsProxy) => Tab.fromProxy(jsProxy);
