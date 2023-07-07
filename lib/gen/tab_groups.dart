/* This file has been generated from tab_groups.json - do not edit */

/**
 * Use the `chrome.tabGroups` API to interact with the browser's tab grouping
 * system. You can use this API to modify and rearrange tab groups in the
 * browser. To group and ungroup tabs, or to query what tabs are in groups, use
 * the `chrome.tabs` API.
 */
library chrome.tabGroups;

import '../src/common.dart';

/**
 * Accessor for the `chrome.tabGroups` namespace.
 */
final ChromeTabGroups tabGroups = ChromeTabGroups._();

class ChromeTabGroups extends ChromeApi {
  JsObject get _tabGroups => chrome['tabGroups'];

  /**
   * Fired when a group is created.
   */
  Stream<TabGroup> get onCreated => _onCreated.stream;
  late ChromeStreamController<TabGroup> _onCreated;

  /**
   * Fired when a group is updated.
   */
  Stream<TabGroup> get onUpdated => _onUpdated.stream;
  late ChromeStreamController<TabGroup> _onUpdated;

  /**
   * Fired when a group is moved within a window. Move events are still fired
   * for the individual tabs within the group, as well as for the group itself.
   * This event is not fired when a group is moved between windows; instead, it
   * will be removed from one window and created in another.
   */
  Stream<TabGroup> get onMoved => _onMoved.stream;
  late ChromeStreamController<TabGroup> _onMoved;

  /**
   * Fired when a group is closed, either directly by the user or automatically
   * because it contained zero tabs.
   */
  Stream<TabGroup> get onRemoved => _onRemoved.stream;
  late ChromeStreamController<TabGroup> _onRemoved;

  ChromeTabGroups._() {
    var getApi = () => _tabGroups;
    _onCreated = ChromeStreamController<TabGroup>.oneArg(getApi, 'onCreated', _createTabGroup);
    _onUpdated = ChromeStreamController<TabGroup>.oneArg(getApi, 'onUpdated', _createTabGroup);
    _onMoved = ChromeStreamController<TabGroup>.oneArg(getApi, 'onMoved', _createTabGroup);
    _onRemoved = ChromeStreamController<TabGroup>.oneArg(getApi, 'onRemoved', _createTabGroup);
  }

  bool get available => _tabGroups != null;

  /**
   * An ID that represents the absence of a group.
   */
  int get TAB_GROUP_ID_NONE => _tabGroups['TAB_GROUP_ID_NONE'];

  /**
   * Retrieves details about the specified group.
   */
  void get(int groupId) {
    if (_tabGroups == null) _throwNotAvailable();

    _tabGroups.callMethod('get', [groupId]);
  }

  /**
   * Gets all groups that have the specified properties, or all groups if no
   * properties are specified.
   */
  void query(TabGroupsQueryParams queryInfo) {
    if (_tabGroups == null) _throwNotAvailable();

    _tabGroups.callMethod('query', [jsify(queryInfo)]);
  }

  /**
   * Modifies the properties of a group. Properties that are not specified in
   * [updateProperties] are not modified.
   * 
   * [groupId] The ID of the group to modify.
   */
  void update(int groupId, TabGroupsUpdateParams updateProperties) {
    if (_tabGroups == null) _throwNotAvailable();

    _tabGroups.callMethod('update', [groupId, jsify(updateProperties)]);
  }

  /**
   * Moves the group and all its tabs within its window, or to a new window.
   * 
   * [groupId] The ID of the group to move.
   */
  void move(int groupId, TabGroupsMoveParams moveProperties) {
    if (_tabGroups == null) _throwNotAvailable();

    _tabGroups.callMethod('move', [groupId, jsify(moveProperties)]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.tabGroups' is not available");
  }
}

/**
 * The group's color.
 */
class Color extends ChromeEnum {
  static const Color GREY = const Color._('grey');
  static const Color BLUE = const Color._('blue');
  static const Color RED = const Color._('red');
  static const Color YELLOW = const Color._('yellow');
  static const Color GREEN = const Color._('green');
  static const Color PINK = const Color._('pink');
  static const Color PURPLE = const Color._('purple');
  static const Color CYAN = const Color._('cyan');
  static const Color ORANGE = const Color._('orange');

  static const List<Color> VALUES = const[GREY, BLUE, RED, YELLOW, GREEN, PINK, PURPLE, CYAN, ORANGE];

  const Color._(String str): super(str);
}

class TabGroup extends ChromeObject {
  TabGroup({int? id, bool? collapsed, Color? color, String? title, int? windowId}) {
    if (id != null) this.id = id;
    if (collapsed != null) this.collapsed = collapsed;
    if (color != null) this.color = color;
    if (title != null) this.title = title;
    if (windowId != null) this.windowId = windowId;
  }
  TabGroup.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The ID of the group. Group IDs are unique within a browser session.
   */
  int get id => jsProxy['id'];
  set id(int value) => jsProxy['id'] = value;

  /**
   * Whether the group is collapsed. A collapsed group is one whose tabs are
   * hidden.
   */
  bool get collapsed => jsProxy['collapsed'];
  set collapsed(bool value) => jsProxy['collapsed'] = value;

  /**
   * The group's color.
   */
  Color get color => _createColor(jsProxy['color']);
  set color(Color value) => jsProxy['color'] = jsify(value);

  /**
   * The title of the group.
   */
  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  /**
   * The ID of the window that contains the group.
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;
}

class TabGroupsQueryParams extends ChromeObject {
  TabGroupsQueryParams({bool? collapsed, Color? color, String? title, int? windowId}) {
    if (collapsed != null) this.collapsed = collapsed;
    if (color != null) this.color = color;
    if (title != null) this.title = title;
    if (windowId != null) this.windowId = windowId;
  }
  TabGroupsQueryParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Whether the groups are collapsed.
   */
  bool get collapsed => jsProxy['collapsed'];
  set collapsed(bool value) => jsProxy['collapsed'] = value;

  /**
   * The color of the groups.
   */
  Color get color => _createColor(jsProxy['color']);
  set color(Color value) => jsProxy['color'] = jsify(value);

  /**
   * Match group titles against a pattern.
   */
  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  /**
   * The ID of the parent window, or [windows.WINDOW_ID_CURRENT] for the
   * [current window](windows#current-window).
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;
}

class TabGroupsUpdateParams extends ChromeObject {
  TabGroupsUpdateParams({bool? collapsed, Color? color, String? title}) {
    if (collapsed != null) this.collapsed = collapsed;
    if (color != null) this.color = color;
    if (title != null) this.title = title;
  }
  TabGroupsUpdateParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Whether the group should be collapsed.
   */
  bool get collapsed => jsProxy['collapsed'];
  set collapsed(bool value) => jsProxy['collapsed'] = value;

  /**
   * The color of the group.
   */
  Color get color => _createColor(jsProxy['color']);
  set color(Color value) => jsProxy['color'] = jsify(value);

  /**
   * The title of the group.
   */
  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;
}

class TabGroupsMoveParams extends ChromeObject {
  TabGroupsMoveParams({int? windowId, int? index}) {
    if (windowId != null) this.windowId = windowId;
    if (index != null) this.index = index;
  }
  TabGroupsMoveParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The window to move the group to. Defaults to the window the group is
   * currently in. Note that groups can only be moved to and from windows with
   * [windows.WindowType] type `"normal"`.
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;

  /**
   * The position to move the group to. Use `-1` to place the group at the end
   * of the window.
   */
  int get index => jsProxy['index'];
  set index(int value) => jsProxy['index'] = value;
}

TabGroup _createTabGroup(JsObject jsProxy) => TabGroup.fromProxy(jsProxy);
Color _createColor(String value) => Color.VALUES.singleWhere((ChromeEnum e) => e.value == value);
