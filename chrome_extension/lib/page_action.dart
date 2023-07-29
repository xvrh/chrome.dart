import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/page_action.dart' as $js;
import 'src/js/tabs.dart' as $js_tabs;
import 'tabs.dart';

export 'src/chrome.dart' show chrome;

final _pageAction = ChromePageAction._();

extension ChromePageActionExtension on Chrome {
  /// Use the `chrome.pageAction` API to put icons in the main Google Chrome
  /// toolbar, to the right of the address bar. Page actions represent actions
  /// that can be taken on the current page, but that aren't applicable to all
  /// pages. Page actions appear grayed out when inactive.
  ChromePageAction get pageAction => _pageAction;
}

class ChromePageAction {
  ChromePageAction._();

  bool get isAvailable => $js.chrome.pageActionNullable != null;

  /// Shows the page action. The page action is shown whenever the tab is
  /// selected.
  /// [tabId] The id of the tab for which you want to modify the page action.
  Future<void> show(int tabId) async {
    await promiseToFuture<void>($js.chrome.pageAction.show(tabId));
  }

  /// Hides the page action. Hidden page actions still appear in the Chrome
  /// toolbar, but are grayed out.
  /// [tabId] The id of the tab for which you want to modify the page action.
  Future<void> hide(int tabId) async {
    await promiseToFuture<void>($js.chrome.pageAction.hide(tabId));
  }

  /// Sets the title of the page action. This is displayed in a tooltip over the
  /// page action.
  Future<void> setTitle(SetTitleDetails details) async {
    await promiseToFuture<void>($js.chrome.pageAction.setTitle(details.toJS));
  }

  /// Gets the title of the page action.
  Future<String> getTitle(TabDetails details) async {
    var $res = await promiseToFuture<String>(
        $js.chrome.pageAction.getTitle(details.toJS));
    return $res;
  }

  /// Sets the icon for the page action. The icon can be specified either as the
  /// path to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the **path** or the
  /// **imageData** property must be specified.
  Future<void> setIcon(SetIconDetails details) async {
    await promiseToFuture<void>($js.chrome.pageAction.setIcon(details.toJS));
  }

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// page action's icon.
  Future<void> setPopup(SetPopupDetails details) async {
    await promiseToFuture<void>($js.chrome.pageAction.setPopup(details.toJS));
  }

  /// Gets the html document set as the popup for this page action.
  Future<String> getPopup(TabDetails details) async {
    var $res = await promiseToFuture<String>(
        $js.chrome.pageAction.getPopup(details.toJS));
    return $res;
  }

  /// Fired when a page action icon is clicked.  This event will not fire if the
  /// page action has a popup.
  Stream<Tab> get onClicked =>
      $js.chrome.pageAction.onClicked.asStream(($c) => ($js_tabs.Tab tab) {
            $c.add(Tab.fromJS(tab));
          }.toJS);
}

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
    Object? imageData,
    Object? path,
    int? iconIndex,
  }) : _wrapped = $js.SetIconDetails(
          tabId: tabId,
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
