import 'dart:typed_data';

import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../../runner/runner_client.dart';
import 'package:chrome_apis/wallpaper.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  test('setWallpaper', () async {
    var data = Uint8List(0);
    await chrome.wallpaper.setWallpaper(SetWallpaperDetails(
        data: data.buffer,
        layout: WallpaperLayout.center,
        filename: 'filename.png'));
  }, skip: 'Only works in ChromeOS');
}
