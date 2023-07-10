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
    JSString name,
    JSString mediaType,
  );

  /// Creates a view that can handle the replay. This view will be embedded
  /// inside the Recorder panel.
  external RecorderView createView(
    JSString title,
    JSString pagePath,
  );
}

@JS()
@staticInterop
class RecorderExtensionPlugin {}

extension RecorderExtensionPluginExtension on RecorderExtensionPlugin {}

@JS()
@staticInterop
class RecorderView {}

extension RecorderViewExtension on RecorderView {}