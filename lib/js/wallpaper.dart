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
  external JSPromise setWallpaper(SetWallpaperDetails details);
}

/// The supported wallpaper layouts.
typedef WallpaperLayout = JSString;

@JS()
@staticInterop
class SetWallpaperDetails {
  /// The jpeg or png encoded wallpaper image as an ArrayBuffer.
  external JSAny? get data;

  /// The URL of the wallpaper to be set (can be relative).
  external String? get url;

  /// The supported wallpaper layouts.
  external WallpaperLayout get layout;

  /// The file name of the saved wallpaper.
  external String get filename;

  /// True if a 128x60 thumbnail should be generated. Layout and ratio are not
  /// supported yet.
  external bool? get thumbnail;
}
