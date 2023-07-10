import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSWallpaperExtension on JSChrome {
  /// Use the `chrome.wallpaper` API to change the ChromeOS wallpaper.
  external JSWallpaper get wallpaper;
}

@JS()
@staticInterop
class JSWallpaper {}

extension JSWallpaperExtension on JSWallpaper {
  /// Sets wallpaper to the image at <em>url</em> or <em>wallpaperData</em> with
  /// the specified <em>layout</em>
  external JSPromise setWallpaper(JSObject details);
}

/// The supported wallpaper layouts.
typedef WallpaperLayout = JSString;
