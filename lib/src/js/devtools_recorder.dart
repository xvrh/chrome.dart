import 'dart:js_interop';

import 'chrome.dart';
import 'devtools.dart';

export 'chrome.dart';
export 'devtools.dart';

extension JSChromeJSDevtoolsRecorderExtension on JSChromeDevtools {
  /// Use the `chrome.devtools.recorder` API to customize the Recorder panel in
  /// DevTools.
  external JSDevtoolsRecorder get recorder;
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

extension RecorderExtensionPluginExtension on RecorderExtensionPlugin {
  /// Converts a recording from the Recorder panel format into a string.
  external void stringify(JSAny recording);

  /// Converts a step of the recording from the Recorder panel format into a
  /// string.
  external void stringifyStep(JSAny step);

  /// Allows the extension to implement custom replay functionality.
  external void replay(JSAny recording);
}

@JS()
@staticInterop
class RecorderView {}

extension RecorderViewExtension on RecorderView {
  /// Indicates that the extension wants to show this view in the Recorder
  /// panel.
  external void show();

  /// Fired when the view is shown.
  external ChromeEvent get onShown;

  /// Fired when the view is hidden.
  external ChromeEvent get onHidden;
}
