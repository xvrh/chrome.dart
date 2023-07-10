import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDevtoolsRecorderExtension on JSChrome {
  /// Use the `chrome.devtools.recorder` API to customize the Recorder panel in
  /// DevTools.
  external JSDevtoolsRecorder get devtoolsRecorder;
}

@JS()
@staticInterop
class JSDevtoolsRecorder {}

extension JSDevtoolsRecorderExtension on JSDevtoolsRecorder {
  /// Registers a Recorder extension plugin.
  external void registerRecorderExtensionPlugin(
    RecorderExtensionPlugin plugin,
    String name,
    String mediaType,
  );

  /// Creates a view that can handle the replay. This view will be embedded
  /// inside the Recorder panel.
  external RecorderView createView(
    String title,
    String pagePath,
  );
}

@JS()
@staticInterop
class RecorderExtensionPlugin {}

@JS()
@staticInterop
class RecorderView {}
