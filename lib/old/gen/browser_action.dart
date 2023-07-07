/* This file has been generated from browser_action.json - do not edit */

/**
 * Use browser actions to put icons in the main Google Chrome toolbar, to the
 * right of the address bar. In addition to its [icon](browserAction#icon), a
 * browser action can have a [tooltip](browserAction#tooltip), a
 * [badge](browserAction#badge), and a [popup](browserAction#popups).
 */
library chrome.browserAction;

import 'tabs.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.browserAction` namespace.
 */
final ChromeBrowserAction browserAction = ChromeBrowserAction._();

class ChromeBrowserAction extends ChromeApi {
  JsObject get _browserAction => chrome['browserAction'];

  /**
   * Fired when a browser action icon is clicked. Does not fire if the browser
   * action has a popup.
   */
  Stream<Tab> get onClicked => _onClicked.stream;
  late ChromeStreamController<Tab> _onClicked;

  ChromeBrowserAction._() {
    var getApi = () => _browserAction;
    _onClicked = ChromeStreamController<Tab>.oneArg(getApi, 'onClicked', _createTab);
  }

  bool get available => _browserAction != null;

  /**
   * Sets the title of the browser action. This title appears in the tooltip.
   */
  void setTitle(BrowserActionSetTitleParams details) {
    if (_browserAction == null) _throwNotAvailable();

    _browserAction.callMethod('setTitle', [jsify(details)]);
  }

  /**
   * Gets the title of the browser action.
   */
  void getTitle(TabDetails details) {
    if (_browserAction == null) _throwNotAvailable();

    _browserAction.callMethod('getTitle', [jsify(details)]);
  }

  /**
   * Sets the icon for the browser action. The icon can be specified as the path
   * to an image file, as the pixel data from a canvas element, or as a
   * dictionary of one of those. Either the `path` or the `imageData` property
   * must be specified.
   */
  Future setIcon(BrowserActionSetIconParams details) {
    if (_browserAction == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _browserAction.callMethod('setIcon', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets the HTML document to be opened as a popup when the user clicks the
   * browser action icon.
   */
  void setPopup(BrowserActionSetPopupParams details) {
    if (_browserAction == null) _throwNotAvailable();

    _browserAction.callMethod('setPopup', [jsify(details)]);
  }

  /**
   * Gets the HTML document that is set as the popup for this browser action.
   */
  void getPopup(TabDetails details) {
    if (_browserAction == null) _throwNotAvailable();

    _browserAction.callMethod('getPopup', [jsify(details)]);
  }

  /**
   * Sets the badge text for the browser action. The badge is displayed on top
   * of the icon.
   */
  void setBadgeText(BrowserActionSetBadgeTextParams details) {
    if (_browserAction == null) _throwNotAvailable();

    _browserAction.callMethod('setBadgeText', [jsify(details)]);
  }

  /**
   * Gets the badge text of the browser action. If no tab is specified, the
   * non-tab-specific badge text is returned.
   */
  void getBadgeText(TabDetails details) {
    if (_browserAction == null) _throwNotAvailable();

    _browserAction.callMethod('getBadgeText', [jsify(details)]);
  }

  /**
   * Sets the background color for the badge.
   */
  void setBadgeBackgroundColor(BrowserActionSetBadgeBackgroundColorParams details) {
    if (_browserAction == null) _throwNotAvailable();

    _browserAction.callMethod('setBadgeBackgroundColor', [jsify(details)]);
  }

  /**
   * Gets the background color of the browser action.
   */
  void getBadgeBackgroundColor(TabDetails details) {
    if (_browserAction == null) _throwNotAvailable();

    _browserAction.callMethod('getBadgeBackgroundColor', [jsify(details)]);
  }

  /**
   * Enables the browser action for a tab. Defaults to enabled.
   * 
   * [tabId] The ID of the tab for which to modify the browser action.
   */
  void enable([int? tabId]) {
    if (_browserAction == null) _throwNotAvailable();

    _browserAction.callMethod('enable', [tabId]);
  }

  /**
   * Disables the browser action for a tab.
   * 
   * [tabId] The ID of the tab for which to modify the browser action.
   */
  void disable([int? tabId]) {
    if (_browserAction == null) _throwNotAvailable();

    _browserAction.callMethod('disable', [tabId]);
  }

  /**
   * Opens the extension popup window in the active window but does not grant
   * tab permissions.
   * 
   * Returns:
   * JavaScript 'window' object for the popup window if it was succesfully
   * opened.
   */
  Future<Map<String, Object>> openPopup() {
    if (_browserAction == null) _throwNotAvailable();

    var completer =  ChromeCompleter<Map<String, Object>>.oneArg(mapify);
    _browserAction.callMethod('openPopup', [completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.browserAction' is not available");
  }
}

class ColorArray extends ChromeObject {
  ColorArray();
  ColorArray.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);
}

/**
 * Pixel data for an image. Must be an ImageData object; for example, from a
 * `canvas` element.
 */
class BrowserActionImageDataType extends ChromeObject {
  BrowserActionImageDataType();
  BrowserActionImageDataType.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);
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

class BrowserActionSetTitleParams extends ChromeObject {
  BrowserActionSetTitleParams({String? title, int? tabId}) {
    if (title != null) this.title = title;
    if (tabId != null) this.tabId = tabId;
  }
  BrowserActionSetTitleParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The string the browser action should display when moused over.
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

class BrowserActionSetIconParams extends ChromeObject {
  BrowserActionSetIconParams({Object? imageData, Object? path, int? tabId}) {
    if (imageData != null) this.imageData = imageData;
    if (path != null) this.path = path;
    if (tabId != null) this.tabId = tabId;
  }
  BrowserActionSetIconParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Either an ImageData object or a dictionary {size -> ImageData} representing
   * an icon to be set. If the icon is specified as a dictionary, the image used
   * is chosen depending on the screen's pixel density. If the number of image
   * pixels that fit into one screen space unit equals `scale`, then an image
   * with size `scale` * n is selected, where <i>n</i> is the size of the icon
   * in the UI. At least one image must be specified. Note that
   * 'details.imageData = foo' is equivalent to 'details.imageData = {'16':
   * foo}'
   */
  Object get imageData => jsProxy['imageData'];
  set imageData(Object value) => jsProxy['imageData'] = jsify(value);

  /**
   * Either a relative image path or a dictionary {size -> relative image path}
   * pointing to an icon to be set. If the icon is specified as a dictionary,
   * the image used is chosen depending on the screen's pixel density. If the
   * number of image pixels that fit into one screen space unit equals `scale`,
   * then an image with size `scale` * n is selected, where <i>n</i> is the size
   * of the icon in the UI. At least one image must be specified. Note that
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

class BrowserActionSetPopupParams extends ChromeObject {
  BrowserActionSetPopupParams({int? tabId, String? popup}) {
    if (tabId != null) this.tabId = tabId;
    if (popup != null) this.popup = popup;
  }
  BrowserActionSetPopupParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

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

class BrowserActionSetBadgeTextParams extends ChromeObject {
  BrowserActionSetBadgeTextParams({String? text, int? tabId}) {
    if (text != null) this.text = text;
    if (tabId != null) this.tabId = tabId;
  }
  BrowserActionSetBadgeTextParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Any number of characters can be passed, but only about four can fit into
   * the space. If an empty string (`''`) is passed, the badge text is cleared.
   * If `tabId` is specified and `text` is null, the text for the specified tab
   * is cleared and defaults to the global badge text.
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

class BrowserActionSetBadgeBackgroundColorParams extends ChromeObject {
  BrowserActionSetBadgeBackgroundColorParams({Object? color, int? tabId}) {
    if (color != null) this.color = color;
    if (tabId != null) this.tabId = tabId;
  }
  BrowserActionSetBadgeBackgroundColorParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * An array of four integers in the range 0-255 that make up the RGBA color of
   * the badge. Can also be a string with a CSS hex color value; for example,
   * `#FF0000` or `#F00` (red). Renders colors at full opacity.
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
