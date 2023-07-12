import 'src/internal_helpers.dart';
import 'src/js/wallpaper.dart' as $js;
export 'chrome.dart';

final _wallpaper = ChromeWallpaper._();

extension ChromeWallpaperExtension on Chrome {
  ChromeWallpaper get wallpaper => _wallpaper;
}

class ChromeWallpaper {
  ChromeWallpaper._();

  /// Sets wallpaper to the image at _url_ or _wallpaperData_ with the specified
  /// _layout_
  Future<JSAny?> setWallpaper(SetWallpaperDetails details) =>
      throw UnimplementedError();
}

/// The supported wallpaper layouts.
enum WallpaperLayout {
  stretch('STRETCH'),
  center('CENTER'),
  centerCropped('CENTER_CROPPED');

  const WallpaperLayout(this.value);

  final String value;

  String get toJS => value;
  static WallpaperLayout fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class SetWallpaperDetails {
  SetWallpaperDetails.fromJS(this._wrapped);

  final $js.SetWallpaperDetails _wrapped;

  $js.SetWallpaperDetails get toJS => _wrapped;
}
