import 'src/internal_helpers.dart';
import 'src/js/context_menus.dart' as $js;
import 'tabs.dart';

export 'src/chrome.dart' show chrome;

final _contextMenus = ChromeContextMenus._();

extension ChromeContextMenusExtension on Chrome {
  ChromeContextMenus get contextMenus => _contextMenus;
}

class ChromeContextMenus {
  ChromeContextMenus._();

  /// Creates a new context menu item. If an error occurs during creation, it
  /// may not be detected until the creation callback fires; details will be in
  /// [runtime.lastError].
  /// [callback] Called when the item has been created in the browser. If an
  /// error occurs during creation, details will be available in
  /// [runtime.lastError].
  Object create(
    CreateProperties createProperties,
    JSFunction? callback,
  ) {
    return $js.chrome.contextMenus.create(
      createProperties.toJS,
      callback,
    );
  }

  /// Updates a previously created context menu item.
  /// [id] The ID of the item to update.
  /// [updateProperties] The properties to update. Accepts the same values as
  /// the [contextMenus.create] function.
  Future<void> update(
    Object id,
    UpdateProperties updateProperties,
  ) {
    var $completer = Completer<void>();
    $js.chrome.contextMenus.update(
      id.toJS,
      updateProperties.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Removes a context menu item.
  /// [menuItemId] The ID of the context menu item to remove.
  Future<void> remove(Object menuItemId) {
    var $completer = Completer<void>();
    $js.chrome.contextMenus.remove(
      menuItemId.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Removes all context menu items added by this extension.
  Future<void> removeAll() {
    var $completer = Completer<void>();
    $js.chrome.contextMenus.removeAll(() {
      if (checkRuntimeLastError($completer)) {
        $completer.complete(null);
      }
    }.toJS);
    return $completer.future;
  }

  /// The maximum number of top level extension items that can be added to an
  /// extension action context menu. Any items beyond this limit will be
  /// ignored.
  int get actionMenuTopLevelLimit =>
      ($js.chrome.contextMenus.ACTION_MENU_TOP_LEVEL_LIMIT as dynamic);

  /// Fired when a context menu item is clicked.
  Stream<OnClickedEvent> get onClicked => throw UnimplementedError();
}

/// The different contexts a menu can appear in. Specifying 'all' is equivalent
/// to the combination of all other contexts except for 'launcher'. The
/// 'launcher' context is only supported by apps and is used to add menu items
/// to the context menu that appears when clicking the app icon in the
/// launcher/taskbar/dock/etc. Different platforms might put limitations on what
/// is actually supported in a launcher context menu.
enum ContextType {
  all('all'),
  page('page'),
  frame('frame'),
  selection('selection'),
  link('link'),
  editable('editable'),
  image('image'),
  video('video'),
  audio('audio'),
  launcher('launcher'),
  browserAction('browser_action'),
  pageAction('page_action'),
  action('action');

  const ContextType(this.value);

  final String value;

  String get toJS => value;
  static ContextType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The type of menu item.
enum ItemType {
  normal('normal'),
  checkbox('checkbox'),
  radio('radio'),
  separator('separator');

  const ItemType(this.value);

  final String value;

  String get toJS => value;
  static ItemType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class OnClickData {
  OnClickData.fromJS(this._wrapped);

  OnClickData({
    required Object menuItemId,
    Object? parentMenuItemId,
    String? mediaType,
    String? linkUrl,
    String? srcUrl,
    String? pageUrl,
    String? frameUrl,
    int? frameId,
    String? selectionText,
    required bool editable,
    bool? wasChecked,
    bool? checked,
  }) : _wrapped = $js.OnClickData()
          ..menuItemId = menuItemId.toJS
          ..parentMenuItemId = parentMenuItemId?.toJS
          ..mediaType = mediaType
          ..linkUrl = linkUrl
          ..srcUrl = srcUrl
          ..pageUrl = pageUrl
          ..frameUrl = frameUrl
          ..frameId = frameId
          ..selectionText = selectionText
          ..editable = editable
          ..wasChecked = wasChecked
          ..checked = checked;

  final $js.OnClickData _wrapped;

  $js.OnClickData get toJS => _wrapped;

  /// The ID of the menu item that was clicked.
  Object get menuItemId => _wrapped.menuItemId;
  set menuItemId(Object v) {
    _wrapped.menuItemId = v.toJS;
  }

  /// The parent ID, if any, for the item clicked.
  Object? get parentMenuItemId => _wrapped.parentMenuItemId;
  set parentMenuItemId(Object? v) {
    _wrapped.parentMenuItemId = v?.toJS;
  }

  /// One of 'image', 'video', or 'audio' if the context menu was activated on
  /// one of these types of elements.
  String? get mediaType => _wrapped.mediaType;
  set mediaType(String? v) {
    _wrapped.mediaType = v;
  }

  /// If the element is a link, the URL it points to.
  String? get linkUrl => _wrapped.linkUrl;
  set linkUrl(String? v) {
    _wrapped.linkUrl = v;
  }

  /// Will be present for elements with a 'src' URL.
  String? get srcUrl => _wrapped.srcUrl;
  set srcUrl(String? v) {
    _wrapped.srcUrl = v;
  }

  /// The URL of the page where the menu item was clicked. This property is not
  /// set if the click occured in a context where there is no current page, such
  /// as in a launcher context menu.
  String? get pageUrl => _wrapped.pageUrl;
  set pageUrl(String? v) {
    _wrapped.pageUrl = v;
  }

  ///  The URL of the frame of the element where the context menu was clicked,
  /// if it was in a frame.
  String? get frameUrl => _wrapped.frameUrl;
  set frameUrl(String? v) {
    _wrapped.frameUrl = v;
  }

  ///  The [ID of the frame](webNavigation#frame_ids) of the element where the
  /// context menu was clicked, if it was in a frame.
  int? get frameId => _wrapped.frameId;
  set frameId(int? v) {
    _wrapped.frameId = v;
  }

  /// The text for the context selection, if any.
  String? get selectionText => _wrapped.selectionText;
  set selectionText(String? v) {
    _wrapped.selectionText = v;
  }

  /// A flag indicating whether the element is editable (text input, textarea,
  /// etc.).
  bool get editable => _wrapped.editable;
  set editable(bool v) {
    _wrapped.editable = v;
  }

  /// A flag indicating the state of a checkbox or radio item before it was
  /// clicked.
  bool? get wasChecked => _wrapped.wasChecked;
  set wasChecked(bool? v) {
    _wrapped.wasChecked = v;
  }

  /// A flag indicating the state of a checkbox or radio item after it is
  /// clicked.
  bool? get checked => _wrapped.checked;
  set checked(bool? v) {
    _wrapped.checked = v;
  }
}

class CreateProperties {
  CreateProperties.fromJS(this._wrapped);

  CreateProperties({
    ItemType? type,
    String? id,
    String? title,
    bool? checked,
    List<ContextType>? contexts,
    bool? visible,
    JSFunction? onclick,
    Object? parentId,
    List<String>? documentUrlPatterns,
    List<String>? targetUrlPatterns,
    bool? enabled,
  }) : _wrapped = $js.CreateProperties(
          type: type?.toJS,
          id: id,
          title: title,
          checked: checked,
          contexts: contexts?.toJSArray((e) => e.toJS),
          visible: visible,
          onclick: onclick,
          parentId: parentId?.toJS,
          documentUrlPatterns: documentUrlPatterns?.toJSArray((e) => e),
          targetUrlPatterns: targetUrlPatterns?.toJSArray((e) => e),
          enabled: enabled,
        );

  final $js.CreateProperties _wrapped;

  $js.CreateProperties get toJS => _wrapped;
}

class UpdateProperties {
  UpdateProperties.fromJS(this._wrapped);

  UpdateProperties({
    ItemType? type,
    String? title,
    bool? checked,
    List<ContextType>? contexts,
    bool? visible,
    JSFunction? onclick,
    Object? parentId,
    List<String>? documentUrlPatterns,
    List<String>? targetUrlPatterns,
    bool? enabled,
  }) : _wrapped = $js.UpdateProperties(
          type: type?.toJS,
          title: title,
          checked: checked,
          contexts: contexts?.toJSArray((e) => e.toJS),
          visible: visible,
          onclick: onclick,
          parentId: parentId?.toJS,
          documentUrlPatterns: documentUrlPatterns?.toJSArray((e) => e),
          targetUrlPatterns: targetUrlPatterns?.toJSArray((e) => e),
          enabled: enabled,
        );

  final $js.UpdateProperties _wrapped;

  $js.UpdateProperties get toJS => _wrapped;
}

class OnClickedEvent {
  OnClickedEvent({
    required this.info,
    required this.tab,
  });

  /// Information about the item clicked and the context where the click
  /// happened.
  final OnClickData info;

  /// The details of the tab where the click took place. If the click did not
  /// take place in a tab, this parameter will be missing.
  final Tab? tab;
}
