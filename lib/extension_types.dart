import 'chrome.dart';
export 'chrome.dart';

final _extensionTypes = ChromeExtensionTypes._();

extension ChromeChromeExtensionTypesExtension on Chrome {
  ChromeExtensionTypes get extensionTypes => _extensionTypes;
}

class ChromeExtensionTypes {
  ChromeExtensionTypes._();
}

/// The format of an image.
enum ImageFormat {
  jpeg('jpeg'),
  png('png');

  const ImageFormat(this.value);

  final String value;
}

/// The soonest that the JavaScript or CSS will be injected into the tab.
enum RunAt {
  documentStart('document_start'),
  documentEnd('document_end'),
  documentIdle('document_idle');

  const RunAt(this.value);

  final String value;
}

/// The <a
/// href="https://www.w3.org/TR/css3-cascade/#cascading-origins">origin</a> of
/// injected CSS.
enum CSSOrigin {
  author('author'),
  user('user');

  const CSSOrigin(this.value);

  final String value;
}

/// The type of frame.
enum FrameType {
  outermostFrame('outermost_frame'),
  fencedFrame('fenced_frame'),
  subFrame('sub_frame');

  const FrameType(this.value);

  final String value;
}

/// The document lifecycle of the frame.
enum DocumentLifecycle {
  prerender('prerender'),
  active('active'),
  cached('cached'),
  pendingDeletion('pending_deletion');

  const DocumentLifecycle(this.value);

  final String value;
}

/// The JavaScript world for a script to execute within. Can either be an
/// isolated world, unique to this extension, or the main world of the DOM which
/// is shared with the page's JavaScript.
enum ExecutionWorld {
  isolated('ISOLATED'),
  main('MAIN');

  const ExecutionWorld(this.value);

  final String value;
}
