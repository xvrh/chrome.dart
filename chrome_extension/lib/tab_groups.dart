import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/tab_groups.dart' as $js;

export 'src/chrome.dart' show chrome;

final _tabGroups = ChromeTabGroups._();

extension ChromeTabGroupsExtension on Chrome {
  ChromeTabGroups get tabGroups => _tabGroups;
}

class ChromeTabGroups {
  ChromeTabGroups._();

  /// Retrieves details about the specified group.
  Future<TabGroup> get(int groupId) async {
    var $res =
        await promiseToFuture<$js.TabGroup>($js.chrome.tabGroups.get(groupId));
    return TabGroup.fromJS($res);
  }

  /// Gets all groups that have the specified properties, or all groups if no
  /// properties are specified.
  Future<List<TabGroup>> query(QueryInfo queryInfo) async {
    var $res = await promiseToFuture<JSArray>(
        $js.chrome.tabGroups.query(queryInfo.toJS));
    return $res.toDart
        .cast<$js.TabGroup>()
        .map((e) => TabGroup.fromJS(e))
        .toList();
  }

  /// Modifies the properties of a group. Properties that are not specified in
  /// [updateProperties] are not modified.
  /// [groupId] The ID of the group to modify.
  Future<TabGroup?> update(
    int groupId,
    UpdateProperties updateProperties,
  ) async {
    var $res = await promiseToFuture<$js.TabGroup?>($js.chrome.tabGroups.update(
      groupId,
      updateProperties.toJS,
    ));
    return $res?.let(TabGroup.fromJS);
  }

  /// Moves the group and all its tabs within its window, or to a new window.
  /// [groupId] The ID of the group to move.
  Future<TabGroup?> move(
    int groupId,
    MoveProperties moveProperties,
  ) async {
    var $res = await promiseToFuture<$js.TabGroup?>($js.chrome.tabGroups.move(
      groupId,
      moveProperties.toJS,
    ));
    return $res?.let(TabGroup.fromJS);
  }

  /// An ID that represents the absence of a group.
  int get tabGroupIdNone => $js.chrome.tabGroups.TAB_GROUP_ID_NONE;

  /// Fired when a group is created.
  Stream<TabGroup> get onCreated =>
      $js.chrome.tabGroups.onCreated.asStream(($c) => ($js.TabGroup group) {
            $c.add(TabGroup.fromJS(group));
          }.toJS);

  /// Fired when a group is updated.
  Stream<TabGroup> get onUpdated =>
      $js.chrome.tabGroups.onUpdated.asStream(($c) => ($js.TabGroup group) {
            $c.add(TabGroup.fromJS(group));
          }.toJS);

  /// Fired when a group is moved within a window. Move events are still fired
  /// for the individual tabs within the group, as well as for the group itself.
  /// This event is not fired when a group is moved between windows; instead, it
  /// will be removed from one window and created in another.
  Stream<TabGroup> get onMoved =>
      $js.chrome.tabGroups.onMoved.asStream(($c) => ($js.TabGroup group) {
            $c.add(TabGroup.fromJS(group));
          }.toJS);

  /// Fired when a group is closed, either directly by the user or automatically
  /// because it contained zero tabs.
  Stream<TabGroup> get onRemoved =>
      $js.chrome.tabGroups.onRemoved.asStream(($c) => ($js.TabGroup group) {
            $c.add(TabGroup.fromJS(group));
          }.toJS);
}

/// The group's color.
enum Color {
  grey('grey'),
  blue('blue'),
  red('red'),
  yellow('yellow'),
  green('green'),
  pink('pink'),
  purple('purple'),
  cyan('cyan'),
  orange('orange');

  const Color(this.value);

  final String value;

  String get toJS => value;
  static Color fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class TabGroup {
  TabGroup.fromJS(this._wrapped);

  TabGroup({
    required int id,
    required bool collapsed,
    required Color color,
    String? title,
    required int windowId,
  }) : _wrapped = $js.TabGroup()
          ..id = id
          ..collapsed = collapsed
          ..color = color.toJS
          ..title = title
          ..windowId = windowId;

  final $js.TabGroup _wrapped;

  $js.TabGroup get toJS => _wrapped;

  /// The ID of the group. Group IDs are unique within a browser session.
  int get id => _wrapped.id;
  set id(int v) {
    _wrapped.id = v;
  }

  /// Whether the group is collapsed. A collapsed group is one whose tabs are
  /// hidden.
  bool get collapsed => _wrapped.collapsed;
  set collapsed(bool v) {
    _wrapped.collapsed = v;
  }

  /// The group's color.
  Color get color => Color.fromJS(_wrapped.color);
  set color(Color v) {
    _wrapped.color = v.toJS;
  }

  /// The title of the group.
  String? get title => _wrapped.title;
  set title(String? v) {
    _wrapped.title = v;
  }

  /// The ID of the window that contains the group.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    _wrapped.windowId = v;
  }
}

class QueryInfo {
  QueryInfo.fromJS(this._wrapped);

  QueryInfo({
    bool? collapsed,
    Color? color,
    String? title,
    int? windowId,
  }) : _wrapped = $js.QueryInfo(
          collapsed: collapsed,
          color: color?.toJS,
          title: title,
          windowId: windowId,
        );

  final $js.QueryInfo _wrapped;

  $js.QueryInfo get toJS => _wrapped;
}

class UpdateProperties {
  UpdateProperties.fromJS(this._wrapped);

  UpdateProperties({
    bool? collapsed,
    Color? color,
    String? title,
  }) : _wrapped = $js.UpdateProperties(
          collapsed: collapsed,
          color: color?.toJS,
          title: title,
        );

  final $js.UpdateProperties _wrapped;

  $js.UpdateProperties get toJS => _wrapped;
}

class MoveProperties {
  MoveProperties.fromJS(this._wrapped);

  MoveProperties({
    int? windowId,
    required int index,
  }) : _wrapped = $js.MoveProperties(
          windowId: windowId,
          index: index,
        );

  final $js.MoveProperties _wrapped;

  $js.MoveProperties get toJS => _wrapped;
}