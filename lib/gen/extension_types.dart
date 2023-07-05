/* This file has been generated from extension_types.json - do not edit */

/**
 * The `chrome.extensionTypes` API contains type declarations for Chrome
 * extensions.
 */
library chrome.extensionTypes;

import '../src/common.dart';

/**
 * Accessor for the `chrome.extensionTypes` namespace.
 */
final ChromeExtensionTypes extensionTypes = ChromeExtensionTypes._();

class ChromeExtensionTypes extends ChromeApi {
  JsObject get _extensionTypes => chrome['extensionTypes'];

  ChromeExtensionTypes._();

  bool get available => _extensionTypes != null;
}

/**
 * The format of an image.
 */
class ImageFormat extends ChromeEnum {
  static const ImageFormat JPEG = const ImageFormat._('jpeg');
  static const ImageFormat PNG = const ImageFormat._('png');

  static const List<ImageFormat> VALUES = const[JPEG, PNG];

  const ImageFormat._(String str): super(str);
}

/**
 * The soonest that the JavaScript or CSS will be injected into the tab.
 */
class RunAt extends ChromeEnum {
  static const RunAt DOCUMENT_START = const RunAt._('document_start');
  static const RunAt DOCUMENT_END = const RunAt._('document_end');
  static const RunAt DOCUMENT_IDLE = const RunAt._('document_idle');

  static const List<RunAt> VALUES = const[DOCUMENT_START, DOCUMENT_END, DOCUMENT_IDLE];

  const RunAt._(String str): super(str);
}

/**
 * The [origin](https://www.w3.org/TR/css3-cascade/#cascading-origins) of
 * injected CSS.
 */
class CSSOrigin extends ChromeEnum {
  static const CSSOrigin AUTHOR = const CSSOrigin._('author');
  static const CSSOrigin USER = const CSSOrigin._('user');

  static const List<CSSOrigin> VALUES = const[AUTHOR, USER];

  const CSSOrigin._(String str): super(str);
}

/**
 * The type of frame.
 */
class FrameType extends ChromeEnum {
  static const FrameType OUTERMOST_FRAME = const FrameType._('outermost_frame');
  static const FrameType FENCED_FRAME = const FrameType._('fenced_frame');
  static const FrameType SUB_FRAME = const FrameType._('sub_frame');

  static const List<FrameType> VALUES = const[OUTERMOST_FRAME, FENCED_FRAME, SUB_FRAME];

  const FrameType._(String str): super(str);
}

/**
 * The document lifecycle of the frame.
 */
class DocumentLifecycle extends ChromeEnum {
  static const DocumentLifecycle PRERENDER = const DocumentLifecycle._('prerender');
  static const DocumentLifecycle ACTIVE = const DocumentLifecycle._('active');
  static const DocumentLifecycle CACHED = const DocumentLifecycle._('cached');
  static const DocumentLifecycle PENDING_DELETION = const DocumentLifecycle._('pending_deletion');

  static const List<DocumentLifecycle> VALUES = const[PRERENDER, ACTIVE, CACHED, PENDING_DELETION];

  const DocumentLifecycle._(String str): super(str);
}

/**
 * The JavaScript world for a script to execute within. Can either be an
 * isolated world, unique to this extension, or the main world of the DOM which
 * is shared with the page's JavaScript.
 */
class ExecutionWorld extends ChromeEnum {
  static const ExecutionWorld ISOLATED = const ExecutionWorld._('ISOLATED');
  static const ExecutionWorld MAIN = const ExecutionWorld._('MAIN');

  static const List<ExecutionWorld> VALUES = const[ISOLATED, MAIN];

  const ExecutionWorld._(String str): super(str);
}

/**
 * Details about the format and quality of an image.
 */
class ImageDetails extends ChromeObject {
  ImageDetails({ImageFormat? format, int? quality}) {
    if (format != null) this.format = format;
    if (quality != null) this.quality = quality;
  }
  ImageDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The format of the resulting image.  Default is `"jpeg"`.
   */
  ImageFormat get format => _createImageFormat(jsProxy['format']);
  set format(ImageFormat value) => jsProxy['format'] = jsify(value);

  /**
   * When format is `"jpeg"`, controls the quality of the resulting image.  This
   * value is ignored for PNG images.  As quality is decreased, the resulting
   * image will have more visual artifacts, and the number of bytes needed to
   * store it will decrease.
   */
  int get quality => jsProxy['quality'];
  set quality(int value) => jsProxy['quality'] = value;
}

/**
 * Details of the script or CSS to inject. Either the code or the file property
 * must be set, but both may not be set at the same time.
 */
class InjectDetails extends ChromeObject {
  InjectDetails({String? code, String? file, bool? allFrames, int? frameId, bool? matchAboutBlank, RunAt? runAt, CSSOrigin? cssOrigin}) {
    if (code != null) this.code = code;
    if (file != null) this.file = file;
    if (allFrames != null) this.allFrames = allFrames;
    if (frameId != null) this.frameId = frameId;
    if (matchAboutBlank != null) this.matchAboutBlank = matchAboutBlank;
    if (runAt != null) this.runAt = runAt;
    if (cssOrigin != null) this.cssOrigin = cssOrigin;
  }
  InjectDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * JavaScript or CSS code to inject.<br><br><b>Warning:</b><br>Be careful
   * using the `code` parameter. Incorrect use of it may open your extension to
   * [cross site scripting](https://en.wikipedia.org/wiki/Cross-site_scripting)
   * attacks.
   */
  String get code => jsProxy['code'];
  set code(String value) => jsProxy['code'] = value;

  /**
   * JavaScript or CSS file to inject.
   */
  String get file => jsProxy['file'];
  set file(String value) => jsProxy['file'] = value;

  /**
   * If allFrames is `true`, implies that the JavaScript or CSS should be
   * injected into all frames of current page. By default, it's `false` and is
   * only injected into the top frame. If `true` and `frameId` is set, then the
   * code is inserted in the selected frame and all of its child frames.
   */
  bool get allFrames => jsProxy['allFrames'];
  set allFrames(bool value) => jsProxy['allFrames'] = value;

  /**
   * The [frame](webNavigation#frame_ids) where the script or CSS should be
   * injected. Defaults to 0 (the top-level frame).
   */
  int get frameId => jsProxy['frameId'];
  set frameId(int value) => jsProxy['frameId'] = value;

  /**
   * If matchAboutBlank is true, then the code is also injected in about:blank
   * and about:srcdoc frames if your extension has access to its parent
   * document. Code cannot be inserted in top-level about:-frames. By default it
   * is `false`.
   */
  bool get matchAboutBlank => jsProxy['matchAboutBlank'];
  set matchAboutBlank(bool value) => jsProxy['matchAboutBlank'] = value;

  /**
   * The soonest that the JavaScript or CSS will be injected into the tab.
   * Defaults to "document_idle".
   */
  RunAt get runAt => _createRunAt(jsProxy['runAt']);
  set runAt(RunAt value) => jsProxy['runAt'] = jsify(value);

  /**
   * The [origin](https://www.w3.org/TR/css3-cascade/#cascading-origins) of the
   * CSS to inject. This may only be specified for CSS, not JavaScript. Defaults
   * to `"author"`.
   */
  CSSOrigin get cssOrigin => _createCSSOrigin(jsProxy['cssOrigin']);
  set cssOrigin(CSSOrigin value) => jsProxy['cssOrigin'] = jsify(value);
}

/**
 * Details of the CSS to remove. Either the code or the file property must be
 * set, but both may not be set at the same time.
 */
class DeleteInjectionDetails extends ChromeObject {
  DeleteInjectionDetails({String? code, String? file, bool? allFrames, int? frameId, bool? matchAboutBlank, CSSOrigin? cssOrigin}) {
    if (code != null) this.code = code;
    if (file != null) this.file = file;
    if (allFrames != null) this.allFrames = allFrames;
    if (frameId != null) this.frameId = frameId;
    if (matchAboutBlank != null) this.matchAboutBlank = matchAboutBlank;
    if (cssOrigin != null) this.cssOrigin = cssOrigin;
  }
  DeleteInjectionDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * CSS code to remove.
   */
  String get code => jsProxy['code'];
  set code(String value) => jsProxy['code'] = value;

  /**
   * CSS file to remove.
   */
  String get file => jsProxy['file'];
  set file(String value) => jsProxy['file'] = value;

  /**
   * If allFrames is `true`, implies that the CSS should be removed from all
   * frames of current page. By default, it's `false` and is only removed from
   * the top frame. If `true` and `frameId` is set, then the code is removed
   * from the selected frame and all of its child frames.
   */
  bool get allFrames => jsProxy['allFrames'];
  set allFrames(bool value) => jsProxy['allFrames'] = value;

  /**
   * The [frame](webNavigation#frame_ids) from where the CSS should be removed.
   * Defaults to 0 (the top-level frame).
   */
  int get frameId => jsProxy['frameId'];
  set frameId(int value) => jsProxy['frameId'] = value;

  /**
   * If matchAboutBlank is true, then the code is also removed from about:blank
   * and about:srcdoc frames if your extension has access to its parent
   * document. By default it is `false`.
   */
  bool get matchAboutBlank => jsProxy['matchAboutBlank'];
  set matchAboutBlank(bool value) => jsProxy['matchAboutBlank'] = value;

  /**
   * The [origin](https://www.w3.org/TR/css3-cascade/#cascading-origins) of the
   * CSS to remove. Defaults to `"author"`.
   */
  CSSOrigin get cssOrigin => _createCSSOrigin(jsProxy['cssOrigin']);
  set cssOrigin(CSSOrigin value) => jsProxy['cssOrigin'] = jsify(value);
}

ImageFormat _createImageFormat(String value) => ImageFormat.VALUES.singleWhere((ChromeEnum e) => e.value == value);
RunAt _createRunAt(String value) => RunAt.VALUES.singleWhere((ChromeEnum e) => e.value == value);
CSSOrigin _createCSSOrigin(String value) => CSSOrigin.VALUES.singleWhere((ChromeEnum e) => e.value == value);
