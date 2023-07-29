import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/browser_action.dart' as $js;
import 'src/js/tabs.dart' as $js_tabs;
import 'tabs.dart';

export 'src/chrome.dart' show chrome;

final _browserAction = ChromeBrowserAction._();

extension ChromeBrowserActionExtension on Chrome {
  /// Use browser actions to put icons in the main Google Chrome toolbar, to the
  /// right of the address bar. In addition to its [icon](browserAction#icon), a
  /// browser action can have a [tooltip](browserAction#tooltip), a
  /// [badge](browserAction#badge), and a [popup](browserAction#popups).
  ChromeBrowserAction get browserAction => _browserAction;
}

class ChromeBrowserAction {
  ChromeBrowserAction._();

  bool get isAvailable => $js.chrome.browserActionNullable != null;

  /// Sets the title of the browser action. This title appears in the tooltip.
  Future<void> setTitle(SetTitleDetails details) async {
    await promiseToFuture<void>(
        $js.chrome.browserAction.setTitle(details.toJS));
  }

  /// Gets the title of the browser action.
  Future<String> getTitle(TabDetails details) async {
    var $res = await promiseToFuture<String>(
        $js.chrome.browserAction.getTitle(details.toJS));
    return $res;
  }

  /// Sets the icon for the browser action. The icon can be specified as the
  /// path to an image file, as the pixel data from a canvas element, or as a
  /// dictionary of one of those. Either the `path` or the `imageData` property
  /// must be specified.
  Future<void> setIcon(SetIconDetails details) {
    var $completer = Completer<void>();
    $js.chrome.browserAction.setIcon(
      details.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the HTML document to be opened as a popup when the user clicks the
  /// browser action icon.
  Future<void> setPopup(SetPopupDetails details) async {
    await promiseToFuture<void>(
        $js.chrome.browserAction.setPopup(details.toJS));
  }

  /// Gets the HTML document that is set as the popup for this browser action.
  Future<String> getPopup(TabDetails details) async {
    var $res = await promiseToFuture<String>(
        $js.chrome.browserAction.getPopup(details.toJS));
    return $res;
  }

  /// Sets the badge text for the browser action. The badge is displayed on top
  /// of the icon.
  Future<void> setBadgeText(SetBadgeTextDetails details) async {
    await promiseToFuture<void>(
        $js.chrome.browserAction.setBadgeText(details.toJS));
  }

  /// Gets the badge text of the browser action. If no tab is specified, the
  /// non-tab-specific badge text is returned.
  Future<String> getBadgeText(TabDetails details) async {
    var $res = await promiseToFuture<String>(
        $js.chrome.browserAction.getBadgeText(details.toJS));
    return $res;
  }

  /// Sets the background color for the badge.
  Future<void> setBadgeBackgroundColor(
      SetBadgeBackgroundColorDetails details) async {
    await promiseToFuture<void>(
        $js.chrome.browserAction.setBadgeBackgroundColor(details.toJS));
  }

  /// Gets the background color of the browser action.
  Future<ColorArray> getBadgeBackgroundColor(TabDetails details) async {
    var $res = await promiseToFuture<$js.ColorArray>(
        $js.chrome.browserAction.getBadgeBackgroundColor(details.toJS));
    return $res.toDart.cast<int>().map((e) => e).toList();
  }

  /// Enables the browser action for a tab. Defaults to enabled.
  /// [tabId] The ID of the tab for which to modify the browser action.
  Future<void> enable(int? tabId) async {
    await promiseToFuture<void>($js.chrome.browserAction.enable(tabId));
  }

  /// Disables the browser action for a tab.
  /// [tabId] The ID of the tab for which to modify the browser action.
  Future<void> disable(int? tabId) async {
    await promiseToFuture<void>($js.chrome.browserAction.disable(tabId));
  }

  /// Opens the extension popup window in the active window but does not grant
  /// tab permissions.
  Future<Map?> openPopup() {
    var $completer = Completer<Map?>();
    $js.chrome.browserAction.openPopup((JSAny? popupView) {
      if (checkRuntimeLastError($completer)) {
        $completer.complete((popupView?.dartify() as Map?));
      }
    }.toJS);
    return $completer.future;
  }

  /// Fired when a browser action icon is clicked. Does not fire if the browser
  /// action has a popup.
  Stream<Tab> get onClicked =>
      $js.chrome.browserAction.onClicked.asStream(($c) => ($js_tabs.Tab tab) {
            $c.add(Tab.fromJS(tab));
          }.toJS);
}

typedef ColorArray = List<int>;

class ImageDataType {
  ImageDataType.fromJS(this._wrapped);

  ImageDataType() : _wrapped = $js.ImageDataType();

  final $js.ImageDataType _wrapped;

  $js.ImageDataType get toJS => _wrapped;
}

class TabDetails {
  TabDetails.fromJS(this._wrapped);

  TabDetails({int? tabId}) : _wrapped = $js.TabDetails(tabId: tabId);

  final $js.TabDetails _wrapped;

  $js.TabDetails get toJS => _wrapped;
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
    Object? imageData,
    Object? path,
    int? tabId,
  }) : _wrapped = $js.SetIconDetails(
          imageData: switch (imageData) {
            ImageDataType() => imageData.toJS,
            Map() => imageData.jsify()!,
            Null() => null,
            _ => throw UnsupportedError(
                'Received type: ${imageData.runtimeType}. Supported types are: ImageDataType, Map')
          },
          path: switch (path) {
            String() => path,
            Map() => path.jsify()!,
            Null() => null,
            _ => throw UnsupportedError(
                'Received type: ${path.runtimeType}. Supported types are: String, Map')
          },
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
    String? text,
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
    required Object color,
    int? tabId,
  }) : _wrapped = $js.SetBadgeBackgroundColorDetails(
          color: switch (color) {
            String() => color,
            ColorArray() => color.toJSArray((e) => e),
            _ => throw UnsupportedError(
                'Received type: ${color.runtimeType}. Supported types are: String, ColorArray')
          },
          tabId: tabId,
        );

  final $js.SetBadgeBackgroundColorDetails _wrapped;

  $js.SetBadgeBackgroundColorDetails get toJS => _wrapped;
}
