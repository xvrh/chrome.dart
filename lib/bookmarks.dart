import 'chrome.dart';
export 'chrome.dart';

final _bookmarks = ChromeBookmarks._();

extension ChromeChromeBookmarksExtension on Chrome {
  ChromeBookmarks get bookmarks => _bookmarks;
}

class ChromeBookmarks {
  ChromeBookmarks._();

  /// Retrieves the specified BookmarkTreeNode(s).
  void get(idOrIdList) => throw UnimplementedError();

  /// Retrieves the children of the specified BookmarkTreeNode id.
  void getChildren(id) => throw UnimplementedError();

  /// Retrieves the recently added bookmarks.
  void getRecent(numberOfItems) => throw UnimplementedError();

  /// Retrieves the entire Bookmarks hierarchy.
  void getTree() => throw UnimplementedError();

  /// Retrieves part of the Bookmarks hierarchy, starting at the specified node.
  void getSubTree(id) => throw UnimplementedError();

  /// Searches for BookmarkTreeNodes matching the given query. Queries specified
  /// with an object produce BookmarkTreeNodes matching all specified
  /// properties.
  void search(query) => throw UnimplementedError();

  /// Creates a bookmark or folder under the specified parentId.  If url is NULL
  /// or missing, it will be a folder.
  void create(bookmark) => throw UnimplementedError();

  /// Moves the specified BookmarkTreeNode to the provided location.
  void move(
    id,
    destination,
  ) =>
      throw UnimplementedError();

  /// Updates the properties of a bookmark or folder. Specify only the
  /// properties that you want to change; unspecified properties will be left
  /// unchanged.  **Note:** Currently, only 'title' and 'url' are supported.
  void update(
    id,
    changes,
  ) =>
      throw UnimplementedError();

  /// Removes a bookmark or an empty bookmark folder.
  void remove(id) => throw UnimplementedError();

  /// Recursively removes a bookmark folder.
  void removeTree(id) => throw UnimplementedError();

  /// Fired when a bookmark or folder is created.
  Stream get onCreated => throw UnimplementedError();

  /// Fired when a bookmark or folder is removed.  When a folder is removed
  /// recursively, a single notification is fired for the folder, and none for
  /// its contents.
  Stream get onRemoved => throw UnimplementedError();

  /// Fired when a bookmark or folder changes.  **Note:** Currently, only title
  /// and url changes trigger this.
  Stream get onChanged => throw UnimplementedError();

  /// Fired when a bookmark or folder is moved to a different parent folder.
  Stream get onMoved => throw UnimplementedError();

  /// Fired when the children of a folder have changed their order due to the
  /// order being sorted in the UI.  This is not called as a result of a move().
  Stream get onChildrenReordered => throw UnimplementedError();

  /// Fired when a bookmark import session is begun.  Expensive observers should
  /// ignore onCreated updates until onImportEnded is fired.  Observers should
  /// still handle other notifications immediately.
  Stream get onImportBegan => throw UnimplementedError();

  /// Fired when a bookmark import session is ended.
  Stream get onImportEnded => throw UnimplementedError();
}

/// Indicates the reason why this node is unmodifiable. The `managed` value
/// indicates that this node was configured by the system administrator. Omitted
/// if the node can be modified by the user and the extension (default).
enum BookmarkTreeNodeUnmodifiable {
  managed('managed');

  const BookmarkTreeNodeUnmodifiable(this.value);

  final String value;
}
