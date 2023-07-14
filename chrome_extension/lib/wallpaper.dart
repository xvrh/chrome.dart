import 'src/internal_helpers.dart';
import 'src/js/wallpaper.dart' as $js;

export 'src/chrome.dart' show chrome;

final _wallpaper = ChromeWallpaper._();

extension ChromeWallpaperExtension on Chrome {
  ChromeWallpaper get wallpaper => _wallpaper;
}

class ChromeWallpaper {
  ChromeWallpaper._();

  /// Sets wallpaper to the image at _url_ or _wallpaperData_ with the specified
  /// _layout_
  Future<Object?> setWallpaper(SetWallpaperDetails details) {
    var $completer = Completer<Object?>();
    $js.chrome.wallpaper.setWallpaper(
      details.toJS,
      (JSAny? thumbnail) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(thumbnail);
        }
      }.toJS,
    );
    return $completer.future;
  }
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

  SetWallpaperDetails({
    Object? data,
    String? url,
    required WallpaperLayout layout,
    required String filename,
    bool? thumbnail,
  }) : _wrapped = $js.SetWallpaperDetails(
          data: data?.toJS,
          url: url,
          layout: layout.toJS,
          filename: filename,
          thumbnail: thumbnail,
        );

  final $js.SetWallpaperDetails _wrapped;

  $js.SetWallpaperDetails get toJS => _wrapped;
}
