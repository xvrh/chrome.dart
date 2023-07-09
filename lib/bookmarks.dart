import 'chrome.dart';
export 'chrome.dart';

final _bookmarks = ChromeBookmarks._();

extension ChromeChromeBookmarksExtension on Chrome {
  ChromeBookmarks get bookmarks => _bookmarks;
}

class ChromeBookmarks {
  ChromeBookmarks._();
}

/// Indicates the reason why this node is unmodifiable. The <var>managed</var>
/// value indicates that this node was configured by the system administrator.
/// Omitted if the node can be modified by the user and the extension (default).
enum BookmarkTreeNodeUnmodifiable {
  managed('managed');

  const BookmarkTreeNodeUnmodifiable(this.value);

  final String value;
}
