import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSOffscreenExtension on JSChrome {
  /// Use the `offscreen` API to create and manage offscreen documents.
  external JSOffscreen get offscreen;
}

@JS()
@staticInterop
class JSOffscreen {}

extension JSOffscreenExtension on JSOffscreen {
  /// Creates a new offscreen document for the extension.
  /// |parameters|: The parameters describing the offscreen document to create.
  /// |callback|: Invoked when the offscreen document is created and has
  /// completed its initial page load.
  external JSPromise createDocument(CreateParameters parameters);

  /// Closes the currently-open offscreen document for the extension.
  /// |callback|: Invoked when the offscreen document has been closed.
  external JSPromise closeDocument();

  /// Determines whether the extension has an active document.
  /// TODO(https://crbug.com/1339382): This probably isn't something we want to
  /// ship in its current form (hence the nodoc). Instead of this, we should
  /// integrate offscreen documents into a service worker-compatible getViews()
  /// alternative. But this is pretty useful in testing environments.
  /// |callback|: Invoked with the result of whether the extension has an
  /// active offscreen document.
  external JSPromise hasDocument();
}

typedef Reason = String;

@JS()
@staticInterop
class CreateParameters {}

extension CreateParametersExtension on CreateParameters {
  /// The reason(s) the extension is creating the offscreen document.
  external JSArray reasons;

  /// The (relative) URL to load in the document.
  external String url;

  /// A developer-provided string that explains, in more detail, the need for
  /// the background context. The user agent _may_ use this in display to the
  /// user.
  external String justification;
}
