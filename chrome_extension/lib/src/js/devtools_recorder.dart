import 'dart:js_interop';

import 'chrome.dart';
import 'devtools.dart';

export 'chrome.dart';
export 'devtools.dart';

extension JSChromeJSDevtoolsRecorderExtension on JSChromeDevtools {
  /// Use the `chrome.devtools.recorder` API to customize the Recorder panel in
  /// DevTools.
  @JS('recorder')
  external JSDevtoolsRecorder? get recorderNullable;

  /// Use the `chrome.devtools.recorder` API to customize the Recorder panel in
  /// DevTools.
  JSDevtoolsRecorder get recorder {
    var recorderNullable = this.recorderNullable;
    if (recorderNullable == null) {
      throw ApiNotAvailableException('chrome.devtools.recorder');
    }
    return recorderNullable;
  }
}

@JS()
@staticInterop
class JSDevtoolsRecorder {}

extension JSDevtoolsRecorderExtension on JSDevtoolsRecorder {
  /// Registers a Recorder extension plugin.
  external void registerRecorderExtensionPlugin(
    /// An instance implementing the RecorderExtensionPlugin interface.
    RecorderExtensionPlugin plugin,

    /// The name of the plugin.
    String name,

    /// The media type of the string content that the plugin produces.
    String mediaType,
  );

  /// Creates a view that can handle the replay. This view will be embedded
  /// inside the Recorder panel.
  external RecorderView createView(
    /// Title that is displayed next to the extension icon in the Developer
    /// Tools toolbar.
    String title,

    /// Path of the panel's HTML page relative to the extension directory.
    String pagePath,
  );
}

@JS()
@staticInterop
@anonymous
class RecorderExtensionPlugin {
  external factory RecorderExtensionPlugin();
}

@JS()
@staticInterop
class RecorderView {}

extension RecorderViewExtension on RecorderView {
  /// Indicates that the extension wants to show this view in the Recorder
  /// panel.
  external void show();

  /// Fired when the view is shown.
  external Event get onShown;

  /// Fired when the view is hidden.
  external Event get onHidden;
}
