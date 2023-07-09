import 'chrome.dart';
export 'chrome.dart';

final _systemDisplay = ChromeSystemDisplay._();

extension ChromeChromeSystemDisplayExtension on Chrome {
  ChromeSystemDisplay get systemDisplay => _systemDisplay;
}

class ChromeSystemDisplay {
  ChromeSystemDisplay._();
}

///  Layout position, i.e. edge of parent that the display is attached to.
enum LayoutPosition {
  top('top'),
  right('right'),
  bottom('bottom'),
  left('left');

  const LayoutPosition(this.value);

  final String value;
}

///  Mirror mode, i.e. different ways of how a display is mirrored to other
///  displays.
enum MirrorMode {
  ///  Use the default mode (extended or unified desktop).
  off('off'),

  ///  The default source display will be mirrored to all other displays.
  normal('normal'),

  ///  The specified source display will be mirrored to the provided
  ///  destination displays. All other connected displays will be extended.
  mixed('mixed');

  const MirrorMode(this.value);

  final String value;
}
