import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSScriptingExtension on JSChrome {
  ///  Use the `chrome.scripting` API to execute script in different
  ///  contexts.
  external JSScripting get Scripting;
}

@JS()
@staticInterop
class JSScripting {}

extension JSScriptingExtension on JSScripting {
  ///  An object available for content scripts running in isolated worlds to use
  ///  and modify as a JS object. One instance exists per frame and is shared
  ///  between all content scripts for a given extension. This object is
  ///  initialized when the frame is created, before document_start.
  ///  TODO(crbug.com/1054624): Enable this once implementation is complete.
  external void globalParams();
}
