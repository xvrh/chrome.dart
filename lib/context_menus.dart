import 'src/internal_helpers.dart';
import 'tabs.dart';
import 'src/js/context_menus.dart' as $js;
export 'chrome.dart';

final _contextMenus = ChromeContextMenus._();

extension ChromeContextMenusExtension on Chrome {
  ChromeContextMenus get contextMenus => _contextMenus;
}

class ChromeContextMenus {
  ChromeContextMenus._();

  /// Creates a new context menu item. If an error occurs during creation, it
  /// may not be detected until the creation callback fires; details will be in
  /// [runtime.lastError].
  JSAny create(
    CreateProperties createProperties,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Updates a previously created context menu item.
  void update(
    JSAny id,
    UpdateProperties updateProperties,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Removes a context menu item.
  void remove(
    JSAny menuItemId,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Removes all context menu items added by this extension.
  void removeAll(JSAny? callback) => throw UnimplementedError();

  /// The maximum number of top level extension items that can be added to an
  /// extension action context menu. Any items beyond this limit will be
  /// ignored.
  int get actionMENUTOPLEVELLIMIT =>
      $js.chrome.contextMenus.ACTION_MENU_TOP_LEVEL_LIMIT as dynamic;

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

  final $js.OnClickData _wrapped;

  $js.OnClickData get toJS => _wrapped;

  /// The ID of the menu item that was clicked.
  JSAny get menuItemId => _wrapped.menuItemId;
  set menuItemId(JSAny v) {
    throw UnimplementedError();
  }

  /// The parent ID, if any, for the item clicked.
  JSAny? get parentMenuItemId => _wrapped.parentMenuItemId;
  set parentMenuItemId(JSAny? v) {
    throw UnimplementedError();
  }

  /// One of 'image', 'video', or 'audio' if the context menu was activated on
  /// one of these types of elements.
  String? get mediaType => _wrapped.mediaType;
  set mediaType(String? v) {
    throw UnimplementedError();
  }

  /// If the element is a link, the URL it points to.
  String? get linkUrl => _wrapped.linkUrl;
  set linkUrl(String? v) {
    throw UnimplementedError();
  }

  /// Will be present for elements with a 'src' URL.
  String? get srcUrl => _wrapped.srcUrl;
  set srcUrl(String? v) {
    throw UnimplementedError();
  }

  /// The URL of the page where the menu item was clicked. This property is not
  /// set if the click occured in a context where there is no current page, such
  /// as in a launcher context menu.
  String? get pageUrl => _wrapped.pageUrl;
  set pageUrl(String? v) {
    throw UnimplementedError();
  }

  ///  The URL of the frame of the element where the context menu was clicked,
  /// if it was in a frame.
  String? get frameUrl => _wrapped.frameUrl;
  set frameUrl(String? v) {
    throw UnimplementedError();
  }

  ///  The [ID of the frame](webNavigation#frame_ids) of the element where the
  /// context menu was clicked, if it was in a frame.
  int? get frameId => _wrapped.frameId;
  set frameId(int? v) {
    throw UnimplementedError();
  }

  /// The text for the context selection, if any.
  String? get selectionText => _wrapped.selectionText;
  set selectionText(String? v) {
    throw UnimplementedError();
  }

  /// A flag indicating whether the element is editable (text input, textarea,
  /// etc.).
  bool get editable => _wrapped.editable;
  set editable(bool v) {
    throw UnimplementedError();
  }

  /// A flag indicating the state of a checkbox or radio item before it was
  /// clicked.
  bool? get wasChecked => _wrapped.wasChecked;
  set wasChecked(bool? v) {
    throw UnimplementedError();
  }

  /// A flag indicating the state of a checkbox or radio item after it is
  /// clicked.
  bool? get checked => _wrapped.checked;
  set checked(bool? v) {
    throw UnimplementedError();
  }
}

class CreateProperties {
  CreateProperties.fromJS(this._wrapped);

  final $js.CreateProperties _wrapped;

  $js.CreateProperties get toJS => _wrapped;
}

class UpdateProperties {
  UpdateProperties.fromJS(this._wrapped);

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
