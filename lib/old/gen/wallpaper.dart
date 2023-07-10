/* This file has been generated from wallpaper.json - do not edit */

/**
 * Use the `chrome.wallpaper` API to change the ChromeOS wallpaper.
 */
library chrome.wallpaper;

import '../src/common.dart';

/**
 * Accessor for the `chrome.wallpaper` namespace.
 */
final ChromeWallpaper wallpaper = ChromeWallpaper._();

class ChromeWallpaper extends ChromeApi {
  JsObject get _wallpaper => chrome['wallpaper'];

  ChromeWallpaper._();

  bool get available => _wallpaper != null;

  /**
   * Sets wallpaper to the image at _url_ or _wallpaperData_ with the specified
   * _layout_
   */
  void setWallpaper(WallpaperSetWallpaperParams details) {
    if (_wallpaper == null) _throwNotAvailable();

    _wallpaper.callMethod('setWallpaper', [jsify(details)]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.wallpaper' is not available");
  }
}

/**
 * The supported wallpaper layouts.
 */
class WallpaperLayout extends ChromeEnum {
  static const WallpaperLayout STRETCH = const WallpaperLayout._('STRETCH');
  static const WallpaperLayout CENTER = const WallpaperLayout._('CENTER');
  static const WallpaperLayout CENTER_CROPPED = const WallpaperLayout._('CENTER_CROPPED');

  static const List<WallpaperLayout> VALUES = const[STRETCH, CENTER, CENTER_CROPPED];

  const WallpaperLayout._(String str): super(str);
}

class WallpaperSetWallpaperParams extends ChromeObject {
  WallpaperSetWallpaperParams({Object? data, String? url, WallpaperLayout? layout, String? filename, bool? thumbnail}) {
    if (data != null) this.data = data;
    if (url != null) this.url = url;
    if (layout != null) this.layout = layout;
    if (filename != null) this.filename = filename;
    if (thumbnail != null) this.thumbnail = thumbnail;
  }
  WallpaperSetWallpaperParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The jpeg or png encoded wallpaper image as an ArrayBuffer.
   */
  Object get data => jsProxy['data'];
  set data(Object value) => jsProxy['data'] = jsify(value);

  /**
   * The URL of the wallpaper to be set (can be relative).
   */
  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  /**
   * The supported wallpaper layouts.
   */
  WallpaperLayout get layout => _createWallpaperLayout(jsProxy['layout']);
  set layout(WallpaperLayout value) => jsProxy['layout'] = jsify(value);

  /**
   * The file name of the saved wallpaper.
   */
  String get filename => jsProxy['filename'];
  set filename(String value) => jsProxy['filename'] = value;

  /**
   * True if a 128x60 thumbnail should be generated. Layout and ratio are not
   * supported yet.
   */
  bool get thumbnail => jsProxy['thumbnail'];
  set thumbnail(bool value) => jsProxy['thumbnail'] = value;
}

WallpaperLayout _createWallpaperLayout(String value) => WallpaperLayout.VALUES.singleWhere((ChromeEnum e) => e.value == value);