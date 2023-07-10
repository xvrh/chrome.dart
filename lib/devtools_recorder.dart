import 'chrome.dart';
export 'chrome.dart';

final _devtoolsRecorder = ChromeDevtoolsRecorder._();

extension ChromeDevtoolsRecorderExtension on Chrome {
  ChromeDevtoolsRecorder get devtoolsRecorder => _devtoolsRecorder;
}

class ChromeDevtoolsRecorder {
  ChromeDevtoolsRecorder._();

  /// Registers a Recorder extension plugin.
  void registerRecorderExtensionPlugin(
    plugin,
    name,
    mediaType,
  ) =>
      throw UnimplementedError();

  /// Creates a view that can handle the replay. This view will be embedded
  /// inside the Recorder panel.
  void createView(
    title,
    pagePath,
  ) =>
      throw UnimplementedError();
}
