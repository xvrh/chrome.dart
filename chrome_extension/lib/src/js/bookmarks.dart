import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSBookmarksExtension on JSChrome {
  /// Use the `chrome.bookmarks` API to create, organize, and otherwise
  /// manipulate bookmarks. Also see [Override Pages](override), which you can
  /// use to create a custom Bookmark Manager page.
  external JSBookmarks get bookmarks;
}

@JS()
@staticInterop
class JSBookmarks {}

extension JSBookmarksExtension on JSBookmarks {
  /// Retrieves the specified BookmarkTreeNode(s).
  external JSPromise get(

      /// A single string-valued id, or an array of string-valued ids
      JSAny idOrIdList);

  /// Retrieves the children of the specified BookmarkTreeNode id.
  external JSPromise getChildren(String id);

  /// Retrieves the recently added bookmarks.
  external JSPromise getRecent(

      /// The maximum number of items to return.
      int numberOfItems);

  /// Retrieves the entire Bookmarks hierarchy.
  external JSPromise getTree();

  /// Retrieves part of the Bookmarks hierarchy, starting at the specified node.
  external JSPromise getSubTree(

      /// The ID of the root of the subtree to retrieve.
      String id);

  /// Searches for BookmarkTreeNodes matching the given query. Queries specified
  /// with an object produce BookmarkTreeNodes matching all specified
  /// properties.
  external JSPromise search(

      /// Either a string of words and quoted phrases that are matched against
      /// bookmark URLs and titles, or an object. If an object, the properties
      /// `query`, `url`, and `title` may be specified and bookmarks matching all
      /// specified properties will be produced.
      JSAny query);

  /// Creates a bookmark or folder under the specified parentId.  If url is NULL
  /// or missing, it will be a folder.
  external JSPromise create(CreateDetails bookmark);

  /// Moves the specified BookmarkTreeNode to the provided location.
  external JSPromise move(
    String id,
    MoveDestination destination,
  );

  /// Updates the properties of a bookmark or folder. Specify only the
  /// properties that you want to change; unspecified properties will be left
  /// unchanged.  **Note:** Currently, only 'title' and 'url' are supported.
  external JSPromise update(
    String id,
    UpdateChanges changes,
  );

  /// Removes a bookmark or an empty bookmark folder.
  external JSPromise remove(String id);

  /// Recursively removes a bookmark folder.
  external JSPromise removeTree(String id);

  /// Fired when a bookmark or folder is created.
  external Event get onCreated;

  /// Fired when a bookmark or folder is removed.  When a folder is removed
  /// recursively, a single notification is fired for the folder, and none for
  /// its contents.
  external Event get onRemoved;

  /// Fired when a bookmark or folder changes.  **Note:** Currently, only title
  /// and url changes trigger this.
  external Event get onChanged;

  /// Fired when a bookmark or folder is moved to a different parent folder.
  external Event get onMoved;

  /// Fired when the children of a folder have changed their order due to the
  /// order being sorted in the UI.  This is not called as a result of a move().
  external Event get onChildrenReordered;

  /// Fired when a bookmark import session is begun.  Expensive observers should
  /// ignore onCreated updates until onImportEnded is fired.  Observers should
  /// still handle other notifications immediately.
  external Event get onImportBegan;

  /// Fired when a bookmark import session is ended.
  external Event get onImportEnded;

  external int get MAX_WRITE_OPERATIONS_PER_HOUR;

  external int get MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE;
}

/// Indicates the reason why this node is unmodifiable. The [managed] value
/// indicates that this node was configured by the system administrator. Omitted
/// if the node can be modified by the user and the extension (default).
typedef BookmarkTreeNodeUnmodifiable = String;

@JS()
@staticInterop
class BookmarkTreeNode {}

extension BookmarkTreeNodeExtension on BookmarkTreeNode {
  /// The unique identifier for the node. IDs are unique within the current
  /// profile, and they remain valid even after the browser is restarted.
  external String id;

  /// The `id` of the parent folder.  Omitted for the root node.
  external String? parentId;

  /// The 0-based position of this node within its parent folder.
  external int? index;

  /// The URL navigated to when a user clicks the bookmark. Omitted for folders.
  external String? url;

  /// The text displayed for the node.
  external String title;

  /// When this node was created, in milliseconds since the epoch (`new
  /// Date(dateAdded)`).
  external double? dateAdded;

  /// When this node was last opened, in milliseconds since the epoch. Not set
  /// for folders.
  external double? dateLastUsed;

  /// When the contents of this folder last changed, in milliseconds since the
  /// epoch.
  external double? dateGroupModified;

  /// Indicates the reason why this node is unmodifiable. The [managed] value
  /// indicates that this node was configured by the system administrator or by
  /// the custodian of a supervised user. Omitted if the node can be modified by
  /// the user and the extension (default).
  external BookmarkTreeNodeUnmodifiable? unmodifiable;

  /// An ordered list of children of this node.
  external JSArray? children;
}

@JS()
@staticInterop
@anonymous
class CreateDetails {
  external factory CreateDetails({
    /// Defaults to the Other Bookmarks folder.
    String? parentId,
    int? index,
    String? title,
    String? url,
  });
}

@JS()
@staticInterop
class OnRemovedRemoveInfo {}

extension OnRemovedRemoveInfoExtension on OnRemovedRemoveInfo {
  external String parentId;

  external int index;

  external BookmarkTreeNode node;
}

@JS()
@staticInterop
class OnChangedChangeInfo {}

extension OnChangedChangeInfoExtension on OnChangedChangeInfo {
  external String title;

  external String? url;
}

@JS()
@staticInterop
class OnMovedMoveInfo {}

extension OnMovedMoveInfoExtension on OnMovedMoveInfo {
  external String parentId;

  external int index;

  external String oldParentId;

  external int oldIndex;
}

@JS()
@staticInterop
class OnChildrenReorderedReorderInfo {}

extension OnChildrenReorderedReorderInfoExtension
    on OnChildrenReorderedReorderInfo {
  external JSArray childIds;
}

@JS()
@staticInterop
@anonymous
class MoveDestination {
  external factory MoveDestination({
    String? parentId,
    int? index,
  });
}

@JS()
@staticInterop
@anonymous
class UpdateChanges {
  external factory UpdateChanges({
    String? title,
    String? url,
  });
}
