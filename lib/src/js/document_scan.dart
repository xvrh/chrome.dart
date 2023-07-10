import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDocumentScanExtension on JSChrome {
  /// Use the `chrome.documentScan` API to discover and retrieve
  /// images from attached paper document scanners.
  external JSDocumentScan get documentScan;
}

@JS()
@staticInterop
class JSDocumentScan {}

extension JSDocumentScanExtension on JSDocumentScan {
  /// Performs a document scan.  On success, the PNG data will be
  /// sent to the callback.
  /// |options| : Object containing scan parameters.
  /// |callback| : Called with the result and data from the scan.
  external void scan(
    ScanOptions options,
    JSFunction callback,
  );
}

@JS()
@staticInterop
class ScanOptions {}

extension ScanOptionsExtension on ScanOptions {
  /// The MIME types that are accepted by the caller.
  external JSArray? get mimeTypes;

  /// The number of scanned images allowed (defaults to 1).
  external JSNumber? get maxImages;
}

@JS()
@staticInterop
class ScanResults {}

extension ScanResultsExtension on ScanResults {
  /// The data image URLs in a form that can be passed as the "src" value to
  /// an image tag.
  external JSArray get dataUrls;

  /// The MIME type of `dataUrls`.
  external JSString get mimeType;
}
