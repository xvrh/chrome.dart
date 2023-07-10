import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSPageCaptureExtension on JSChrome {
  /// Use the `chrome.pageCapture` API to save a tab as MHTML.
  external JSPageCapture get pageCapture;
}

@JS()
@staticInterop
class JSPageCapture {}

extension JSPageCaptureExtension on JSPageCapture {
  /// Saves the content of the tab with given id as MHTML.
  external void saveAsMHTML(
    SaveAsMHTMLDetails details,
    JSFunction callback,
  );
}

@JS()
@staticInterop
class SaveAsMHTMLDetails {
  /// The id of the tab to save as MHTML.
  external int get tabId;
}
