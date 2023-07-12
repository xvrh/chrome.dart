import 'src/internal_helpers.dart';
import 'src/js/devtools_recorder.dart' as $js;
export 'chrome.dart';

final _devtoolsRecorder = ChromeDevtoolsRecorder._();

extension ChromeDevtoolsRecorderExtension on Chrome {
  ChromeDevtoolsRecorder get devtoolsRecorder => _devtoolsRecorder;
}

class ChromeDevtoolsRecorder {
  ChromeDevtoolsRecorder._();

  /// Registers a Recorder extension plugin.
  void registerRecorderExtensionPlugin(
    RecorderExtensionPlugin plugin,
    String name,
    String mediaType,
  ) =>
      throw UnimplementedError();

  /// Creates a view that can handle the replay. This view will be embedded
  /// inside the Recorder panel.
  RecorderView createView(
    String title,
    String pagePath,
  ) =>
      throw UnimplementedError();
}

class RecorderExtensionPlugin {
  RecorderExtensionPlugin.fromJS(this._wrapped);

  final $js.RecorderExtensionPlugin _wrapped;

  $js.RecorderExtensionPlugin get toJS => _wrapped;

  /// Converts a recording from the Recorder panel format into a string.
  void stringify(JSAny recording) => throw UnimplementedError();

  /// Converts a step of the recording from the Recorder panel format into a
  /// string.
  void stringifyStep(JSAny step) => throw UnimplementedError();

  /// Allows the extension to implement custom replay functionality.
  void replay(JSAny recording) => throw UnimplementedError();
}

class RecorderView {
  RecorderView.fromJS(this._wrapped);

  final $js.RecorderView _wrapped;

  $js.RecorderView get toJS => _wrapped;

  /// Indicates that the extension wants to show this view in the Recorder
  /// panel.
  void show() => throw UnimplementedError();

  /// Fired when the view is shown.
  Stream<void> get onShown => throw UnimplementedError();

  /// Fired when the view is hidden.
  Stream<void> get onHidden => throw UnimplementedError();
}
