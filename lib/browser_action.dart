import 'src/internal_helpers.dart';
import 'src/js/browser_action.dart' as $js;
import 'tabs.dart';

export 'src/chrome.dart' show chrome;

final _browserAction = ChromeBrowserAction._();

extension ChromeBrowserActionExtension on Chrome {
  ChromeBrowserAction get browserAction => _browserAction;
}

class ChromeBrowserAction {
  ChromeBrowserAction._();

  /// Sets the title of the browser action. This title appears in the tooltip.
  Future<void> setTitle(SetTitleDetails details) {
    var $completer = Completer<void>();
    $js.chrome.browserAction.setTitle(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the title of the browser action.
  Future<String> getTitle(TabDetails details) {
    var $completer = Completer<String>();
    $js.chrome.browserAction.getTitle(
      details.toJS,
      (String result) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the icon for the browser action. The icon can be specified as the
  /// path to an image file, as the pixel data from a canvas element, or as a
  /// dictionary of one of those. Either the `path` or the `imageData` property
  /// must be specified.
  void setIcon(
    SetIconDetails details,
    JFFunction? callback,
  ) {
    $js.chrome.browserAction.setIcon(
      details.toJS,
      callback,
    );
  }

  /// Sets the HTML document to be opened as a popup when the user clicks the
  /// browser action icon.
  Future<void> setPopup(SetPopupDetails details) {
    var $completer = Completer<void>();
    $js.chrome.browserAction.setPopup(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the HTML document that is set as the popup for this browser action.
  Future<String> getPopup(TabDetails details) {
    var $completer = Completer<String>();
    $js.chrome.browserAction.getPopup(
      details.toJS,
      (String result) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the badge text for the browser action. The badge is displayed on top
  /// of the icon.
  Future<void> setBadgeText(SetBadgeTextDetails details) {
    var $completer = Completer<void>();
    $js.chrome.browserAction.setBadgeText(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the badge text of the browser action. If no tab is specified, the
  /// non-tab-specific badge text is returned.
  Future<String> getBadgeText(TabDetails details) {
    var $completer = Completer<String>();
    $js.chrome.browserAction.getBadgeText(
      details.toJS,
      (String result) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the background color for the badge.
  Future<void> setBadgeBackgroundColor(SetBadgeBackgroundColorDetails details) {
    var $completer = Completer<void>();
    $js.chrome.browserAction.setBadgeBackgroundColor(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the background color of the browser action.
  Future<ColorArray> getBadgeBackgroundColor(TabDetails details) {
    var $completer = Completer<ColorArray>();
    $js.chrome.browserAction.getBadgeBackgroundColor(
      details.toJS,
      (ColorArray result) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Enables the browser action for a tab. Defaults to enabled.
  Future<void> enable(int? tabId) {
    var $completer = Completer<void>();
    $js.chrome.browserAction.enable(
      tabId,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Disables the browser action for a tab.
  Future<void> disable(int? tabId) {
    var $completer = Completer<void>();
    $js.chrome.browserAction.disable(
      tabId,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Opens the extension popup window in the active window but does not grant
  /// tab permissions.
  void openPopup(JFFunction callback) {
    $js.chrome.browserAction.openPopup(callback);
  }

  /// Fired when a browser action icon is clicked. Does not fire if the browser
  /// action has a popup.
  Stream<Tab> get onClicked => throw UnimplementedError();
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
    required JSAny color,
    int? tabId,
  }) : _wrapped = $js.SetBadgeBackgroundColorDetails(
          color: color,
          tabId: tabId,
        );

  final $js.SetBadgeBackgroundColorDetails _wrapped;

  $js.SetBadgeBackgroundColorDetails get toJS => _wrapped;
}
