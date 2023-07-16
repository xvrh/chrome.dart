import 'devtools.dart';
import 'src/internal_helpers.dart';
import 'src/js/devtools_recorder.dart' as $js;

export 'devtools.dart' show ChromeDevtools, ChromeDevtoolsExtension;
export 'src/chrome.dart' show chrome;

final _devtoolsRecorder = ChromeDevtoolsRecorder._();

extension ChromeDevtoolsRecorderExtension on ChromeDevtools {
  ChromeDevtoolsRecorder get recorder => _devtoolsRecorder;
}

class ChromeDevtoolsRecorder {
  ChromeDevtoolsRecorder._();

  /// Registers a Recorder extension plugin.
  /// [plugin] An instance implementing the RecorderExtensionPlugin interface.
  /// [name] The name of the plugin.
  /// [mediaType] The media type of the string content that the plugin
  /// produces.
  void registerRecorderExtensionPlugin(
    RecorderExtensionPlugin plugin,
    String name,
    String mediaType,
  ) {
    $js.chrome.devtools.recorder.registerRecorderExtensionPlugin(
      plugin.toJS,
      name,
      mediaType,
    );
  }

  /// Creates a view that can handle the replay. This view will be embedded
  /// inside the Recorder panel.
  /// [title] Title that is displayed next to the extension icon in the
  /// Developer Tools toolbar.
  /// [pagePath] Path of the panel's HTML page relative to the extension
  /// directory.
  RecorderView createView(
    String title,
    String pagePath,
  ) {
    return RecorderView.fromJS($js.chrome.devtools.recorder.createView(
      title,
      pagePath,
    ));
  }
}

class RecorderExtensionPlugin {
  RecorderExtensionPlugin.fromJS(this._wrapped);

  RecorderExtensionPlugin() : _wrapped = $js.RecorderExtensionPlugin();

  final $js.RecorderExtensionPlugin _wrapped;

  $js.RecorderExtensionPlugin get toJS => _wrapped;

  /// Converts a recording from the Recorder panel format into a string.
  /// [recording] A recording of the user interaction with the page. This
  /// should match <a
  /// href="https://github.com/puppeteer/replay/blob/main/docs/api/interfaces/Schema.UserFlow.md">Puppeteer's
  /// recording schema</a>.
  void stringify(Object recording) {
    _wrapped.stringify(recording.toJS);
  }

  /// Converts a step of the recording from the Recorder panel format into a
  /// string.
  /// [step] A step of the recording of a user interaction with the page. This
  /// should match <a
  /// href="https://github.com/puppeteer/replay/blob/main/docs/api/modules/Schema.md#step">Puppeteer's
  /// step schema</a>.
  void stringifyStep(Object step) {
    _wrapped.stringifyStep(step.toJS);
  }

  /// Allows the extension to implement custom replay functionality.
  /// [recording] A recording of the user interaction with the page. This
  /// should match <a
  /// href="https://github.com/puppeteer/replay/blob/main/docs/api/interfaces/Schema.UserFlow.md">Puppeteer's
  /// recording schema</a>.
  void replay(Object recording) {
    _wrapped.replay(recording.toJS);
  }
}

class RecorderView {
  RecorderView.fromJS(this._wrapped);

  RecorderView() : _wrapped = $js.RecorderView();

  final $js.RecorderView _wrapped;

  $js.RecorderView get toJS => _wrapped;

  /// Indicates that the extension wants to show this view in the Recorder
  /// panel.
  void show() {
    _wrapped.show();
  }

  /// Fired when the view is shown.
  Stream<void> get onShown => throw UnimplementedError();

  /// Fired when the view is hidden.
  Stream<void> get onHidden => throw UnimplementedError();
}
