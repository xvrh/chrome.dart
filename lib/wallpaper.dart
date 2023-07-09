import 'chrome.dart';
export 'chrome.dart';

final _wallpaper = ChromeWallpaper._();

extension ChromeChromeWallpaperExtension on Chrome {
  ChromeWallpaper get wallpaper => _wallpaper;
}

class ChromeWallpaper {
  ChromeWallpaper._();

  /// Sets wallpaper to the image at <em>url</em> or <em>wallpaperData</em> with
  /// the specified <em>layout</em>
  void setWallpaper(details) => throw UnimplementedError();
}

/// The supported wallpaper layouts.
enum WallpaperLayout {
  stretch('STRETCH'),
  center('CENTER'),
  centerCROPPED('CENTER_CROPPED');

  const WallpaperLayout(this.value);

  final String value;
}
