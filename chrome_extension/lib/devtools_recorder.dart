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
  void stringify(Object recording) {
    _wrapped.stringify(recording.toJS);
  }

  /// Converts a step of the recording from the Recorder panel format into a
  /// string.
  void stringifyStep(Object step) {
    _wrapped.stringifyStep(step.toJS);
  }

  /// Allows the extension to implement custom replay functionality.
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
