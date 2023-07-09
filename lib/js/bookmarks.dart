import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSBookmarksExtension on JSChrome {
  /// Use the `chrome.bookmarks` API to create, organize, and otherwise
  /// manipulate bookmarks. Also see <a href='override'>Override Pages</a>,
  /// which you can use to create a custom Bookmark Manager page.
  external JSBookmarks get bookmarks;
}

@JS()
@staticInterop
class JSBookmarks {}

extension JSBookmarksExtension on JSBookmarks {
  /// Retrieves the specified BookmarkTreeNode(s).
  external void get(idOrIdList);

  /// Retrieves the children of the specified BookmarkTreeNode id.
  external void getChildren(id);

  /// Retrieves the recently added bookmarks.
  external void getRecent(numberOfItems);

  /// Retrieves the entire Bookmarks hierarchy.
  external void getTree();

  /// Retrieves part of the Bookmarks hierarchy, starting at the specified node.
  external void getSubTree(id);

  /// Searches for BookmarkTreeNodes matching the given query. Queries specified
  /// with an object produce BookmarkTreeNodes matching all specified
  /// properties.
  external void search(query);

  /// Creates a bookmark or folder under the specified parentId.  If url is NULL
  /// or missing, it will be a folder.
  external void create(bookmark);

  /// Moves the specified BookmarkTreeNode to the provided location.
  external void move(
    id,
    destination,
  );

  /// Updates the properties of a bookmark or folder. Specify only the
  /// properties that you want to change; unspecified properties will be left
  /// unchanged.  <b>Note:</b> Currently, only 'title' and 'url' are supported.
  external void update(
    id,
    changes,
  );

  /// Removes a bookmark or an empty bookmark folder.
  external void remove(id);

  /// Recursively removes a bookmark folder.
  external void removeTree(id);

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

@JS()
@staticInterop
class BookmarkTreeNodeUnmodifiable {}

@JS()
@staticInterop
class BookmarkTreeNode {
  /// The unique identifier for the node. IDs are unique within the current
  /// profile, and they remain valid even after the browser is restarted.
  external JSAny get id;

  /// The `id` of the parent folder.  Omitted for the root node.
  external JSAny? get parentId;

  /// The 0-based position of this node within its parent folder.
  external JSAny? get index;

  /// The URL navigated to when a user clicks the bookmark. Omitted for folders.
  external JSAny? get url;

  /// The text displayed for the node.
  external JSAny get title;

  /// When this node was created, in milliseconds since the epoch (`new
  /// Date(dateAdded)`).
  external JSAny? get dateAdded;

  /// When this node was last opened, in milliseconds since the epoch. Not set
  /// for folders.
  external JSAny? get dateLastUsed;

  /// When the contents of this folder last changed, in milliseconds since the
  /// epoch.
  external JSAny? get dateGroupModified;

  /// Indicates the reason why this node is unmodifiable. The <var>managed</var>
  /// value indicates that this node was configured by the system administrator
  /// or by the custodian of a supervised user. Omitted if the node can be
  /// modified by the user and the extension (default).
  external JSAny? get unmodifiable;

  /// An ordered list of children of this node.
  external JSArray? get children;
}

@JS()
@staticInterop
class CreateDetails {
  /// Defaults to the Other Bookmarks folder.
  external JSAny? get parentId;

  external JSAny? get index;

  external JSAny? get title;

  external JSAny? get url;
}
