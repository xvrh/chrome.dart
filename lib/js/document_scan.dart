import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDocumentScanExtension on JSChrome {
  ///  Use the `chrome.documentScan` API to discover and retrieve
  ///  images from attached paper document scanners.
  external JSDocumentScan get DocumentScan;
}

@JS()
@staticInterop
class JSDocumentScan {}

extension JSDocumentScanExtension on JSDocumentScan {
  ///  Performs a document scan.  On success, the PNG data will be
  ///  sent to the callback.
  ///  |options| : Object containing scan parameters.
  ///  |callback| : Called with the result and data from the scan.
  external void scan();
}
