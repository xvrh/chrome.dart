import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSExtensionTypesExtension on JSChrome {
  /// The `chrome.extensionTypes` API contains type declarations for Chrome
  /// extensions.
  external JSExtensionTypes get extensionTypes;
}

@JS()
@staticInterop
class JSExtensionTypes {}

extension JSExtensionTypesExtension on JSExtensionTypes {}

/// The format of an image.
typedef ImageFormat = JSString;

/// The soonest that the JavaScript or CSS will be injected into the tab.
typedef RunAt = JSString;

/// The <a
/// href="https://www.w3.org/TR/css3-cascade/#cascading-origins">origin</a> of
/// injected CSS.
typedef CSSOrigin = JSString;

/// The type of frame.
typedef FrameType = JSString;

/// The document lifecycle of the frame.
typedef DocumentLifecycle = JSString;

/// The JavaScript world for a script to execute within. Can either be an
/// isolated world, unique to this extension, or the main world of the DOM which
/// is shared with the page's JavaScript.
typedef ExecutionWorld = JSString;

@JS()
@staticInterop
class ImageDetails {}

extension ImageDetailsExtension on ImageDetails {
  /// The format of the resulting image.  Default is `"jpeg"`.
  external ImageFormat? get format;

  /// When format is `"jpeg"`, controls the quality of the resulting image.
  /// This value is ignored for PNG images.  As quality is decreased, the
  /// resulting image will have more visual artifacts, and the number of bytes
  /// needed to store it will decrease.
  external JSNumber? get quality;
}

@JS()
@staticInterop
class InjectDetails {}

extension InjectDetailsExtension on InjectDetails {
  /// JavaScript or CSS code to inject.
  ///
  /// **Warning:**
  /// Be careful using the `code` parameter. Incorrect use of it may open your
  /// extension to <a
  /// href="https://en.wikipedia.org/wiki/Cross-site_scripting">cross site
  /// scripting</a> attacks.
  external JSString? get code;

  /// JavaScript or CSS file to inject.
  external JSString? get file;

  /// If allFrames is `true`, implies that the JavaScript or CSS should be
  /// injected into all frames of current page. By default, it's `false` and is
  /// only injected into the top frame. If `true` and `frameId` is set, then the
  /// code is inserted in the selected frame and all of its child frames.
  external JSBoolean? get allFrames;

  /// The <a href='webNavigation#frame_ids'>frame</a> where the script or CSS
  /// should be injected. Defaults to 0 (the top-level frame).
  external JSNumber? get frameId;

  /// If matchAboutBlank is true, then the code is also injected in about:blank
  /// and about:srcdoc frames if your extension has access to its parent
  /// document. Code cannot be inserted in top-level about:-frames. By default
  /// it is `false`.
  external JSBoolean? get matchAboutBlank;

  /// The soonest that the JavaScript or CSS will be injected into the tab.
  /// Defaults to "document_idle".
  external RunAt? get runAt;

  /// The <a
  /// href="https://www.w3.org/TR/css3-cascade/#cascading-origins">origin</a> of
  /// the CSS to inject. This may only be specified for CSS, not JavaScript.
  /// Defaults to `"author"`.
  external CSSOrigin? get cssOrigin;
}

@JS()
@staticInterop
class DeleteInjectionDetails {}

extension DeleteInjectionDetailsExtension on DeleteInjectionDetails {
  /// CSS code to remove.
  external JSString? get code;

  /// CSS file to remove.
  external JSString? get file;

  /// If allFrames is `true`, implies that the CSS should be removed from all
  /// frames of current page. By default, it's `false` and is only removed from
  /// the top frame. If `true` and `frameId` is set, then the code is removed
  /// from the selected frame and all of its child frames.
  external JSBoolean? get allFrames;

  /// The <a href='webNavigation#frame_ids'>frame</a> from where the CSS should
  /// be removed. Defaults to 0 (the top-level frame).
  external JSNumber? get frameId;

  /// If matchAboutBlank is true, then the code is also removed from about:blank
  /// and about:srcdoc frames if your extension has access to its parent
  /// document. By default it is `false`.
  external JSBoolean? get matchAboutBlank;

  /// The <a
  /// href="https://www.w3.org/TR/css3-cascade/#cascading-origins">origin</a> of
  /// the CSS to remove. Defaults to `"author"`.
  external CSSOrigin? get cssOrigin;
}
