import 'src/internal_helpers.dart';
import 'events.dart';
import 'src/js/declarative_content.dart' as $js;
export 'chrome.dart';

final _declarativeContent = ChromeDeclarativeContent._();

extension ChromeDeclarativeContentExtension on Chrome {
  ChromeDeclarativeContent get declarativeContent => _declarativeContent;
}

class ChromeDeclarativeContent {
  ChromeDeclarativeContent._();

  Stream<void> get onPageChanged => throw UnimplementedError();
}

enum PageStateMatcherInstanceType {
  declarativeContentPageStateMatcher('declarativeContent.PageStateMatcher');

  const PageStateMatcherInstanceType(this.value);

  final String value;

  String get toJS => value;
  static PageStateMatcherInstanceType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum ShowPageActionInstanceType {
  declarativeContentShowPageAction('declarativeContent.ShowPageAction');

  const ShowPageActionInstanceType(this.value);

  final String value;

  String get toJS => value;
  static ShowPageActionInstanceType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum ShowActionInstanceType {
  declarativeContentShowAction('declarativeContent.ShowAction');

  const ShowActionInstanceType(this.value);

  final String value;

  String get toJS => value;
  static ShowActionInstanceType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum SetIconInstanceType {
  declarativeContentSetIcon('declarativeContent.SetIcon');

  const SetIconInstanceType(this.value);

  final String value;

  String get toJS => value;
  static SetIconInstanceType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum RequestContentScriptInstanceType {
  declarativeContentRequestContentScript(
      'declarativeContent.RequestContentScript');

  const RequestContentScriptInstanceType(this.value);

  final String value;

  String get toJS => value;
  static RequestContentScriptInstanceType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// See <a
/// href="https://developer.mozilla.org/en-US/docs/Web/API/ImageData">https://developer.mozilla.org/en-US/docs/Web/API/ImageData</a>.
typedef ImageDataType = JSObject;

class PageStateMatcher {
  PageStateMatcher.fromJS(this._wrapped);

  final $js.PageStateMatcher _wrapped;

  $js.PageStateMatcher get toJS => _wrapped;

  /// Matches if the conditions of the `UrlFilter` are fulfilled for the
  /// top-level URL of the page.
  UrlFilter? get pageUrl => _wrapped.pageUrl?.let(UrlFilter.fromJS);
  set pageUrl(UrlFilter? v) {
    throw UnimplementedError();
  }

  /// Matches if all of the CSS selectors in the array match displayed elements
  /// in a frame with the same origin as the page's main frame. All selectors in
  /// this array must be [compound
  /// selectors](http://www.w3.org/TR/selectors4/#compound) to speed up
  /// matching. Note: Listing hundreds of CSS selectors or listing CSS selectors
  /// that match hundreds of times per page can slow down web sites.
  List<String>? get css => throw UnimplementedError();
  set css(List<String>? v) {
    throw UnimplementedError();
  }

  /// Matches if the bookmarked state of the page is equal to the specified
  /// value. Requres the [bookmarks permission](declare_permissions).
  bool? get isBookmarked => _wrapped.isBookmarked;
  set isBookmarked(bool? v) {
    throw UnimplementedError();
  }

  PageStateMatcherInstanceType get instanceType =>
      PageStateMatcherInstanceType.fromJS(_wrapped.instanceType);
  set instanceType(PageStateMatcherInstanceType v) {
    throw UnimplementedError();
  }
}

class ShowPageAction {
  ShowPageAction.fromJS(this._wrapped);

  final $js.ShowPageAction _wrapped;

  $js.ShowPageAction get toJS => _wrapped;

  ShowPageActionInstanceType get instanceType =>
      ShowPageActionInstanceType.fromJS(_wrapped.instanceType);
  set instanceType(ShowPageActionInstanceType v) {
    throw UnimplementedError();
  }
}

class ShowAction {
  ShowAction.fromJS(this._wrapped);

  final $js.ShowAction _wrapped;

  $js.ShowAction get toJS => _wrapped;

  ShowActionInstanceType get instanceType =>
      ShowActionInstanceType.fromJS(_wrapped.instanceType);
  set instanceType(ShowActionInstanceType v) {
    throw UnimplementedError();
  }
}

class SetIcon {
  SetIcon.fromJS(this._wrapped);

  final $js.SetIcon _wrapped;

  $js.SetIcon get toJS => _wrapped;

  SetIconInstanceType get instanceType =>
      SetIconInstanceType.fromJS(_wrapped.instanceType);
  set instanceType(SetIconInstanceType v) {
    throw UnimplementedError();
  }

  /// Either an `ImageData` object or a dictionary {size -> ImageData}
  /// representing an icon to be set. If the icon is specified as a dictionary,
  /// the image used is chosen depending on the screen's pixel density. If the
  /// number of image pixels that fit into one screen space unit equals `scale`,
  /// then an image with size `scale * n` is selected, where <i>n</i> is the
  /// size of the icon in the UI. At least one image must be specified. Note
  /// that `details.imageData = foo` is equivalent to `details.imageData =
  /// {'16': foo}`.
  JSAny? get imageData => _wrapped.imageData;
  set imageData(JSAny? v) {
    throw UnimplementedError();
  }
}

class RequestContentScript {
  RequestContentScript.fromJS(this._wrapped);

  final $js.RequestContentScript _wrapped;

  $js.RequestContentScript get toJS => _wrapped;

  /// Names of CSS files to be injected as a part of the content script.
  List<String>? get css => throw UnimplementedError();
  set css(List<String>? v) {
    throw UnimplementedError();
  }

  /// Names of JavaScript files to be injected as a part of the content script.
  List<String>? get js => throw UnimplementedError();
  set js(List<String>? v) {
    throw UnimplementedError();
  }

  /// Whether the content script runs in all frames of the matching page, or in
  /// only the top frame. Default is `false`.
  bool? get allFrames => _wrapped.allFrames;
  set allFrames(bool? v) {
    throw UnimplementedError();
  }

  /// Whether to insert the content script on `about:blank` and `about:srcdoc`.
  /// Default is `false`.
  bool? get matchAboutBlank => _wrapped.matchAboutBlank;
  set matchAboutBlank(bool? v) {
    throw UnimplementedError();
  }

  RequestContentScriptInstanceType get instanceType =>
      RequestContentScriptInstanceType.fromJS(_wrapped.instanceType);
  set instanceType(RequestContentScriptInstanceType v) {
    throw UnimplementedError();
  }
}
