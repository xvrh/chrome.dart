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
    JSAny callback,
  );
}

@JS()
@staticInterop
@anonymous
class SaveAsMHTMLDetails {
  external factory SaveAsMHTMLDetails(
      {
      /// The id of the tab to save as MHTML.
      int tabId});
}
