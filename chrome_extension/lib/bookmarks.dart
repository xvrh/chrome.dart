import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/bookmarks.dart' as $js;

export 'src/chrome.dart' show chrome;

final _bookmarks = ChromeBookmarks._();

extension ChromeBookmarksExtension on Chrome {
  /// Use the `chrome.bookmarks` API to create, organize, and otherwise
  /// manipulate bookmarks. Also see [Override Pages](override), which you can
  /// use to create a custom Bookmark Manager page.
  ChromeBookmarks get bookmarks => _bookmarks;
}

class ChromeBookmarks {
  ChromeBookmarks._();

  bool get isAvailable => $js.chrome.bookmarksNullable != null;

  /// Retrieves the specified BookmarkTreeNode(s).
  /// [idOrIdList] A single string-valued id, or an array of string-valued ids
  Future<List<BookmarkTreeNode>> get(Object idOrIdList) async {
    var $res = await promiseToFuture<JSArray>(
        $js.chrome.bookmarks.get(idOrIdList.toChoiceJS));
    return $res.toDart
        .cast<$js.BookmarkTreeNode>()
        .map((e) => BookmarkTreeNode.fromJS(e))
        .toList();
  }

  /// Retrieves the children of the specified BookmarkTreeNode id.
  Future<List<BookmarkTreeNode>> getChildren(String id) async {
    var $res =
        await promiseToFuture<JSArray>($js.chrome.bookmarks.getChildren(id));
    return $res.toDart
        .cast<$js.BookmarkTreeNode>()
        .map((e) => BookmarkTreeNode.fromJS(e))
        .toList();
  }

  /// Retrieves the recently added bookmarks.
  /// [numberOfItems] The maximum number of items to return.
  Future<List<BookmarkTreeNode>> getRecent(int numberOfItems) async {
    var $res = await promiseToFuture<JSArray>(
        $js.chrome.bookmarks.getRecent(numberOfItems));
    return $res.toDart
        .cast<$js.BookmarkTreeNode>()
        .map((e) => BookmarkTreeNode.fromJS(e))
        .toList();
  }

  /// Retrieves the entire Bookmarks hierarchy.
  Future<List<BookmarkTreeNode>> getTree() async {
    var $res = await promiseToFuture<JSArray>($js.chrome.bookmarks.getTree());
    return $res.toDart
        .cast<$js.BookmarkTreeNode>()
        .map((e) => BookmarkTreeNode.fromJS(e))
        .toList();
  }

  /// Retrieves part of the Bookmarks hierarchy, starting at the specified node.
  /// [id] The ID of the root of the subtree to retrieve.
  Future<List<BookmarkTreeNode>> getSubTree(String id) async {
    var $res =
        await promiseToFuture<JSArray>($js.chrome.bookmarks.getSubTree(id));
    return $res.toDart
        .cast<$js.BookmarkTreeNode>()
        .map((e) => BookmarkTreeNode.fromJS(e))
        .toList();
  }

  /// Searches for BookmarkTreeNodes matching the given query. Queries specified
  /// with an object produce BookmarkTreeNodes matching all specified
  /// properties.
  /// [query] Either a string of words and quoted phrases that are matched
  /// against bookmark URLs and titles, or an object. If an object, the
  /// properties `query`, `url`, and `title` may be specified and bookmarks
  /// matching all specified properties will be produced.
  Future<List<BookmarkTreeNode>> search(Object query) async {
    var $res = await promiseToFuture<JSArray>(
        $js.chrome.bookmarks.search(query.toChoiceJS));
    return $res.toDart
        .cast<$js.BookmarkTreeNode>()
        .map((e) => BookmarkTreeNode.fromJS(e))
        .toList();
  }

  /// Creates a bookmark or folder under the specified parentId.  If url is NULL
  /// or missing, it will be a folder.
  Future<BookmarkTreeNode> create(CreateDetails bookmark) async {
    var $res = await promiseToFuture<$js.BookmarkTreeNode>(
        $js.chrome.bookmarks.create(bookmark.toJS));
    return BookmarkTreeNode.fromJS($res);
  }

  /// Moves the specified BookmarkTreeNode to the provided location.
  Future<BookmarkTreeNode> move(
    String id,
    MoveDestination destination,
  ) async {
    var $res =
        await promiseToFuture<$js.BookmarkTreeNode>($js.chrome.bookmarks.move(
      id,
      destination.toJS,
    ));
    return BookmarkTreeNode.fromJS($res);
  }

  /// Updates the properties of a bookmark or folder. Specify only the
  /// properties that you want to change; unspecified properties will be left
  /// unchanged.  **Note:** Currently, only 'title' and 'url' are supported.
  Future<BookmarkTreeNode> update(
    String id,
    UpdateChanges changes,
  ) async {
    var $res =
        await promiseToFuture<$js.BookmarkTreeNode>($js.chrome.bookmarks.update(
      id,
      changes.toJS,
    ));
    return BookmarkTreeNode.fromJS($res);
  }

  /// Removes a bookmark or an empty bookmark folder.
  Future<void> remove(String id) async {
    await promiseToFuture<void>($js.chrome.bookmarks.remove(id));
  }

  /// Recursively removes a bookmark folder.
  Future<void> removeTree(String id) async {
    await promiseToFuture<void>($js.chrome.bookmarks.removeTree(id));
  }

  int get maxWriteOperationsPerHour =>
      $js.chrome.bookmarks.MAX_WRITE_OPERATIONS_PER_HOUR;

  int get maxSustainedWriteOperationsPerMinute =>
      $js.chrome.bookmarks.MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE;

  /// Fired when a bookmark or folder is created.
  Stream<OnCreatedEvent> get onCreated =>
      $js.chrome.bookmarks.onCreated.asStream(($c) => (
            String id,
            $js.BookmarkTreeNode bookmark,
          ) {
            $c.add(OnCreatedEvent(
              id: id,
              bookmark: BookmarkTreeNode.fromJS(bookmark),
            ));
          }.toJS);

  /// Fired when a bookmark or folder is removed.  When a folder is removed
  /// recursively, a single notification is fired for the folder, and none for
  /// its contents.
  Stream<OnRemovedEvent> get onRemoved =>
      $js.chrome.bookmarks.onRemoved.asStream(($c) => (
            String id,
            $js.OnRemovedRemoveInfo removeInfo,
          ) {
            $c.add(OnRemovedEvent(
              id: id,
              removeInfo: OnRemovedRemoveInfo.fromJS(removeInfo),
            ));
          }.toJS);

  /// Fired when a bookmark or folder changes.  **Note:** Currently, only title
  /// and url changes trigger this.
  Stream<OnChangedEvent> get onChanged =>
      $js.chrome.bookmarks.onChanged.asStream(($c) => (
            String id,
            $js.OnChangedChangeInfo changeInfo,
          ) {
            $c.add(OnChangedEvent(
              id: id,
              changeInfo: OnChangedChangeInfo.fromJS(changeInfo),
            ));
          }.toJS);

  /// Fired when a bookmark or folder is moved to a different parent folder.
  Stream<OnMovedEvent> get onMoved =>
      $js.chrome.bookmarks.onMoved.asStream(($c) => (
            String id,
            $js.OnMovedMoveInfo moveInfo,
          ) {
            $c.add(OnMovedEvent(
              id: id,
              moveInfo: OnMovedMoveInfo.fromJS(moveInfo),
            ));
          }.toJS);

  /// Fired when the children of a folder have changed their order due to the
  /// order being sorted in the UI.  This is not called as a result of a move().
  Stream<OnChildrenReorderedEvent> get onChildrenReordered =>
      $js.chrome.bookmarks.onChildrenReordered.asStream(($c) => (
            String id,
            $js.OnChildrenReorderedReorderInfo reorderInfo,
          ) {
            $c.add(OnChildrenReorderedEvent(
              id: id,
              reorderInfo: OnChildrenReorderedReorderInfo.fromJS(reorderInfo),
            ));
          }.toJS);

  /// Fired when a bookmark import session is begun.  Expensive observers should
  /// ignore onCreated updates until onImportEnded is fired.  Observers should
  /// still handle other notifications immediately.
  Stream<void> get onImportBegan =>
      $js.chrome.bookmarks.onImportBegan.asStream(($c) => () {
            $c.add(null);
          }.toJS);

  /// Fired when a bookmark import session is ended.
  Stream<void> get onImportEnded =>
      $js.chrome.bookmarks.onImportEnded.asStream(($c) => () {
            $c.add(null);
          }.toJS);
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

  BookmarkTreeNode({
    required String id,
    String? parentId,
    int? index,
    String? url,
    required String title,
    double? dateAdded,
    double? dateLastUsed,
    double? dateGroupModified,
    BookmarkTreeNodeUnmodifiable? unmodifiable,
    List<BookmarkTreeNode>? children,
  }) : _wrapped = $js.BookmarkTreeNode()
          ..id = id
          ..parentId = parentId
          ..index = index
          ..url = url
          ..title = title
          ..dateAdded = dateAdded
          ..dateLastUsed = dateLastUsed
          ..dateGroupModified = dateGroupModified
          ..unmodifiable = unmodifiable?.toJS
          ..children = children?.toJSArray((e) => e.toJS);

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
  List<BookmarkTreeNode>? get children => _wrapped.children?.toDart
      .cast<$js.BookmarkTreeNode>()
      .map((e) => BookmarkTreeNode.fromJS(e))
      .toList();
  set children(List<BookmarkTreeNode>? v) {
    _wrapped.children = v?.toJSArray((e) => e.toJS);
  }
}

class CreateDetails {
  CreateDetails.fromJS(this._wrapped);

  CreateDetails({
    String? parentId,
    int? index,
    String? title,
    String? url,
  }) : _wrapped = $js.CreateDetails(
          parentId: parentId,
          index: index,
          title: title,
          url: url,
        );

  final $js.CreateDetails _wrapped;

  $js.CreateDetails get toJS => _wrapped;
}

class OnRemovedRemoveInfo {
  OnRemovedRemoveInfo.fromJS(this._wrapped);

  OnRemovedRemoveInfo({
    required String parentId,
    required int index,
    required BookmarkTreeNode node,
  }) : _wrapped = $js.OnRemovedRemoveInfo()
          ..parentId = parentId
          ..index = index
          ..node = node.toJS;

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

  OnChangedChangeInfo({
    required String title,
    String? url,
  }) : _wrapped = $js.OnChangedChangeInfo()
          ..title = title
          ..url = url;

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

  OnMovedMoveInfo({
    required String parentId,
    required int index,
    required String oldParentId,
    required int oldIndex,
  }) : _wrapped = $js.OnMovedMoveInfo()
          ..parentId = parentId
          ..index = index
          ..oldParentId = oldParentId
          ..oldIndex = oldIndex;

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

  OnChildrenReorderedReorderInfo({required List<String> childIds})
      : _wrapped = $js.OnChildrenReorderedReorderInfo()
          ..childIds = childIds.toJSArray((e) => e);

  final $js.OnChildrenReorderedReorderInfo _wrapped;

  $js.OnChildrenReorderedReorderInfo get toJS => _wrapped;

  List<String> get childIds =>
      _wrapped.childIds.toDart.cast<String>().map((e) => e).toList();
  set childIds(List<String> v) {
    _wrapped.childIds = v.toJSArray((e) => e);
  }
}

class MoveDestination {
  MoveDestination.fromJS(this._wrapped);

  MoveDestination({
    String? parentId,
    int? index,
  }) : _wrapped = $js.MoveDestination(
          parentId: parentId,
          index: index,
        );

  final $js.MoveDestination _wrapped;

  $js.MoveDestination get toJS => _wrapped;
}

class UpdateChanges {
  UpdateChanges.fromJS(this._wrapped);

  UpdateChanges({
    String? title,
    String? url,
  }) : _wrapped = $js.UpdateChanges(
          title: title,
          url: url,
        );

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
