import 'src/internal_helpers.dart';
import 'src/js/bookmarks.dart' as $js;
export 'chrome.dart';

final _bookmarks = ChromeBookmarks._();

extension ChromeBookmarksExtension on Chrome {
  ChromeBookmarks get bookmarks => _bookmarks;
}

class ChromeBookmarks {
  ChromeBookmarks._();

  /// Retrieves the specified BookmarkTreeNode(s).
  Future<List<BookmarkTreeNode>> get(JSAny idOrIdList) =>
      throw UnimplementedError();

  /// Retrieves the children of the specified BookmarkTreeNode id.
  Future<List<BookmarkTreeNode>> getChildren(String id) =>
      throw UnimplementedError();

  /// Retrieves the recently added bookmarks.
  Future<List<BookmarkTreeNode>> getRecent(int numberOfItems) =>
      throw UnimplementedError();

  /// Retrieves the entire Bookmarks hierarchy.
  Future<List<BookmarkTreeNode>> getTree() => throw UnimplementedError();

  /// Retrieves part of the Bookmarks hierarchy, starting at the specified node.
  Future<List<BookmarkTreeNode>> getSubTree(String id) =>
      throw UnimplementedError();

  /// Searches for BookmarkTreeNodes matching the given query. Queries specified
  /// with an object produce BookmarkTreeNodes matching all specified
  /// properties.
  Future<List<BookmarkTreeNode>> search(JSAny query) =>
      throw UnimplementedError();

  /// Creates a bookmark or folder under the specified parentId.  If url is NULL
  /// or missing, it will be a folder.
  Future<BookmarkTreeNode> create(CreateDetails bookmark) =>
      throw UnimplementedError();

  /// Moves the specified BookmarkTreeNode to the provided location.
  Future<BookmarkTreeNode> move(
    String id,
    MoveDestination destination,
  ) =>
      throw UnimplementedError();

  /// Updates the properties of a bookmark or folder. Specify only the
  /// properties that you want to change; unspecified properties will be left
  /// unchanged.  **Note:** Currently, only 'title' and 'url' are supported.
  Future<BookmarkTreeNode> update(
    String id,
    UpdateChanges changes,
  ) =>
      throw UnimplementedError();

  /// Removes a bookmark or an empty bookmark folder.
  Future<void> remove(String id) => throw UnimplementedError();

  /// Recursively removes a bookmark folder.
  Future<void> removeTree(String id) => throw UnimplementedError();

  int get maxWRITEOPERATIONSPERHOUR =>
      $js.chrome.bookmarks.MAX_WRITE_OPERATIONS_PER_HOUR as dynamic;

  int get maxSUSTAINEDWRITEOPERATIONSPERMINUTE =>
      $js.chrome.bookmarks.MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE as dynamic;

  /// Fired when a bookmark or folder is created.
  Stream<OnCreatedEvent> get onCreated => throw UnimplementedError();

  /// Fired when a bookmark or folder is removed.  When a folder is removed
  /// recursively, a single notification is fired for the folder, and none for
  /// its contents.
  Stream<OnRemovedEvent> get onRemoved => throw UnimplementedError();

  /// Fired when a bookmark or folder changes.  **Note:** Currently, only title
  /// and url changes trigger this.
  Stream<OnChangedEvent> get onChanged => throw UnimplementedError();

  /// Fired when a bookmark or folder is moved to a different parent folder.
  Stream<OnMovedEvent> get onMoved => throw UnimplementedError();

  /// Fired when the children of a folder have changed their order due to the
  /// order being sorted in the UI.  This is not called as a result of a move().
  Stream<OnChildrenReorderedEvent> get onChildrenReordered =>
      throw UnimplementedError();

  /// Fired when a bookmark import session is begun.  Expensive observers should
  /// ignore onCreated updates until onImportEnded is fired.  Observers should
  /// still handle other notifications immediately.
  Stream<void> get onImportBegan => throw UnimplementedError();

  /// Fired when a bookmark import session is ended.
  Stream<void> get onImportEnded => throw UnimplementedError();
}

/// Indicates the reason why this node is unmodifiable. The [managed] value
/// indicates that this node was configured by the system administrator. Omitted
/// if the node can be modified by the user and the extension (default).
enum BookmarkTreeNodeUnmodifiable {
  managed('managed');

  const BookmarkTreeNodeUnmodifiable(this.value);

  final String value;

  String get toJS => value;
  static BookmarkTreeNodeUnmodifiable fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class BookmarkTreeNode {
  BookmarkTreeNode.fromJS(this._wrapped);

  final $js.BookmarkTreeNode _wrapped;

  $js.BookmarkTreeNode get toJS => _wrapped;

  /// The unique identifier for the node. IDs are unique within the current
  /// profile, and they remain valid even after the browser is restarted.
  String get id => _wrapped.id;
  set id(String v) {
    _wrapped.id = v;
  }

  /// The `id` of the parent folder.  Omitted for the root node.
  String? get parentId => _wrapped.parentId;
  set parentId(String? v) {
    _wrapped.parentId = v;
  }

  /// The 0-based position of this node within its parent folder.
  int? get index => _wrapped.index;
  set index(int? v) {
    _wrapped.index = v;
  }

  /// The URL navigated to when a user clicks the bookmark. Omitted for folders.
  String? get url => _wrapped.url;
  set url(String? v) {
    _wrapped.url = v;
  }

  /// The text displayed for the node.
  String get title => _wrapped.title;
  set title(String v) {
    _wrapped.title = v;
  }

  /// When this node was created, in milliseconds since the epoch (`new
  /// Date(dateAdded)`).
  double? get dateAdded => _wrapped.dateAdded;
  set dateAdded(double? v) {
    _wrapped.dateAdded = v;
  }

  /// When this node was last opened, in milliseconds since the epoch. Not set
  /// for folders.
  double? get dateLastUsed => _wrapped.dateLastUsed;
  set dateLastUsed(double? v) {
    _wrapped.dateLastUsed = v;
  }

  /// When the contents of this folder last changed, in milliseconds since the
  /// epoch.
  double? get dateGroupModified => _wrapped.dateGroupModified;
  set dateGroupModified(double? v) {
    _wrapped.dateGroupModified = v;
  }

  /// Indicates the reason why this node is unmodifiable. The [managed] value
  /// indicates that this node was configured by the system administrator or by
  /// the custodian of a supervised user. Omitted if the node can be modified by
  /// the user and the extension (default).
  BookmarkTreeNodeUnmodifiable? get unmodifiable =>
      _wrapped.unmodifiable?.let(BookmarkTreeNodeUnmodifiable.fromJS);
  set unmodifiable(BookmarkTreeNodeUnmodifiable? v) {
    _wrapped.unmodifiable = v?.toJS;
  }

  /// An ordered list of children of this node.
  List<BookmarkTreeNode>? get children => throw UnimplementedError();
  set children(List<BookmarkTreeNode>? v) {
    _wrapped.children = throw UnimplementedError();
  }
}

class CreateDetails {
  CreateDetails.fromJS(this._wrapped);

  final $js.CreateDetails _wrapped;

  $js.CreateDetails get toJS => _wrapped;

  /// Defaults to the Other Bookmarks folder.
  String? get parentId => _wrapped.parentId;
  set parentId(String? v) {
    _wrapped.parentId = v;
  }

  int? get index => _wrapped.index;
  set index(int? v) {
    _wrapped.index = v;
  }

  String? get title => _wrapped.title;
  set title(String? v) {
    _wrapped.title = v;
  }

  String? get url => _wrapped.url;
  set url(String? v) {
    _wrapped.url = v;
  }
}

class OnRemovedRemoveInfo {
  OnRemovedRemoveInfo.fromJS(this._wrapped);

  final $js.OnRemovedRemoveInfo _wrapped;

  $js.OnRemovedRemoveInfo get toJS => _wrapped;

  String get parentId => _wrapped.parentId;
  set parentId(String v) {
    _wrapped.parentId = v;
  }

  int get index => _wrapped.index;
  set index(int v) {
    _wrapped.index = v;
  }

  BookmarkTreeNode get node => BookmarkTreeNode.fromJS(_wrapped.node);
  set node(BookmarkTreeNode v) {
    _wrapped.node = v.toJS;
  }
}

class OnChangedChangeInfo {
  OnChangedChangeInfo.fromJS(this._wrapped);

  final $js.OnChangedChangeInfo _wrapped;

  $js.OnChangedChangeInfo get toJS => _wrapped;

  String get title => _wrapped.title;
  set title(String v) {
    _wrapped.title = v;
  }

  String? get url => _wrapped.url;
  set url(String? v) {
    _wrapped.url = v;
  }
}

class OnMovedMoveInfo {
  OnMovedMoveInfo.fromJS(this._wrapped);

  final $js.OnMovedMoveInfo _wrapped;

  $js.OnMovedMoveInfo get toJS => _wrapped;

  String get parentId => _wrapped.parentId;
  set parentId(String v) {
    _wrapped.parentId = v;
  }

  int get index => _wrapped.index;
  set index(int v) {
    _wrapped.index = v;
  }

  String get oldParentId => _wrapped.oldParentId;
  set oldParentId(String v) {
    _wrapped.oldParentId = v;
  }

  int get oldIndex => _wrapped.oldIndex;
  set oldIndex(int v) {
    _wrapped.oldIndex = v;
  }
}

class OnChildrenReorderedReorderInfo {
  OnChildrenReorderedReorderInfo.fromJS(this._wrapped);

  final $js.OnChildrenReorderedReorderInfo _wrapped;

  $js.OnChildrenReorderedReorderInfo get toJS => _wrapped;

  List<String> get childIds => throw UnimplementedError();
  set childIds(List<String> v) {
    _wrapped.childIds = throw UnimplementedError();
  }
}

class MoveDestination {
  MoveDestination.fromJS(this._wrapped);

  final $js.MoveDestination _wrapped;

  $js.MoveDestination get toJS => _wrapped;
}

class UpdateChanges {
  UpdateChanges.fromJS(this._wrapped);

  final $js.UpdateChanges _wrapped;

  $js.UpdateChanges get toJS => _wrapped;
}

class OnCreatedEvent {
  OnCreatedEvent({
    required this.id,
    required this.bookmark,
  });

  final String id;

  final BookmarkTreeNode bookmark;
}

class OnRemovedEvent {
  OnRemovedEvent({
    required this.id,
    required this.removeInfo,
  });

  final String id;

  final OnRemovedRemoveInfo removeInfo;
}

class OnChangedEvent {
  OnChangedEvent({
    required this.id,
    required this.changeInfo,
  });

  final String id;

  final OnChangedChangeInfo changeInfo;
}

class OnMovedEvent {
  OnMovedEvent({
    required this.id,
    required this.moveInfo,
  });

  final String id;

  final OnMovedMoveInfo moveInfo;
}

class OnChildrenReorderedEvent {
  OnChildrenReorderedEvent({
    required this.id,
    required this.reorderInfo,
  });

  final String id;

  final OnChildrenReorderedReorderInfo reorderInfo;
}
