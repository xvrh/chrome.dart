import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSBookmarksExtension on JSChrome {
  /// Use the `chrome.bookmarks` API to create, organize, and otherwise
  /// manipulate bookmarks. Also see <a href='override'>Override Pages</a>,
  /// which you can use to create a custom Bookmark Manager page.
  external JSBookmarks get Bookmarks;
}

@JS()
@staticInterop
class JSBookmarks {}

extension JSBookmarksExtension on JSBookmarks {
  /// Retrieves the specified BookmarkTreeNode(s).
  external void get();

  /// Retrieves the children of the specified BookmarkTreeNode id.
  external void getChildren();

  /// Retrieves the recently added bookmarks.
  external void getRecent();

  /// Retrieves the entire Bookmarks hierarchy.
  external void getTree();

  /// Retrieves part of the Bookmarks hierarchy, starting at the specified node.
  external void getSubTree();

  /// Searches for BookmarkTreeNodes matching the given query. Queries specified
  /// with an object produce BookmarkTreeNodes matching all specified
  /// properties.
  external void search();

  /// Creates a bookmark or folder under the specified parentId.  If url is NULL
  /// or missing, it will be a folder.
  external void create();

  /// Moves the specified BookmarkTreeNode to the provided location.
  external void move();

  /// Updates the properties of a bookmark or folder. Specify only the
  /// properties that you want to change; unspecified properties will be left
  /// unchanged.  <b>Note:</b> Currently, only 'title' and 'url' are supported.
  external void update();

  /// Removes a bookmark or an empty bookmark folder.
  external void remove();

  /// Recursively removes a bookmark folder.
  external void removeTree();

  /// Fired when a bookmark or folder is created.
  external ChromeEvent get onCreated;

  /// Fired when a bookmark or folder is removed.  When a folder is removed
  /// recursively, a single notification is fired for the folder, and none for
  /// its contents.
  external ChromeEvent get onRemoved;

  /// Fired when a bookmark or folder changes.  <b>Note:</b> Currently, only
  /// title and url changes trigger this.
  external ChromeEvent get onChanged;

  /// Fired when a bookmark or folder is moved to a different parent folder.
  external ChromeEvent get onMoved;

  /// Fired when the children of a folder have changed their order due to the
  /// order being sorted in the UI.  This is not called as a result of a move().
  external ChromeEvent get onChildrenReordered;

  /// Fired when a bookmark import session is begun.  Expensive observers should
  /// ignore onCreated updates until onImportEnded is fired.  Observers should
  /// still handle other notifications immediately.
  external ChromeEvent get onImportBegan;

  /// Fired when a bookmark import session is ended.
  external ChromeEvent get onImportEnded;
}
