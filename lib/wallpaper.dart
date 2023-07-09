import 'chrome.dart';

final _Wallpaper = ChromeWallpaper._();

extension ChromeChromeWallpaperExtension on Chrome {
  ChromeWallpaper get Wallpaper => _Wallpaper;
}

class ChromeWallpaper {
  ChromeWallpaper._();
}
