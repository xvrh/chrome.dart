import 'chrome.dart';

final _Bookmarks = ChromeBookmarks._();

extension ChromeChromeBookmarksExtension on Chrome {
  ChromeBookmarks get Bookmarks => _Bookmarks;
}

class ChromeBookmarks {
  ChromeBookmarks._();
}
