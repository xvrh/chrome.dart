import 'src/internal_helpers.dart';
import 'src/js/tab_groups.dart' as $js;
export 'chrome.dart';

final _tabGroups = ChromeTabGroups._();

extension ChromeTabGroupsExtension on Chrome {
  ChromeTabGroups get tabGroups => _tabGroups;
}

class ChromeTabGroups {
  ChromeTabGroups._();

  /// Retrieves details about the specified group.
  Future<TabGroup> get(int groupId) => throw UnimplementedError();

  /// Gets all groups that have the specified properties, or all groups if no
  /// properties are specified.
  Future<List<TabGroup>> query(QueryInfo queryInfo) =>
      throw UnimplementedError();

  /// Modifies the properties of a group. Properties that are not specified in
  /// [updateProperties] are not modified.
  Future<TabGroup?> update(
    int groupId,
    UpdateProperties updateProperties,
  ) =>
      throw UnimplementedError();

  /// Moves the group and all its tabs within its window, or to a new window.
  Future<TabGroup?> move(
    int groupId,
    MoveProperties moveProperties,
  ) =>
      throw UnimplementedError();

  /// An ID that represents the absence of a group.
  int get tabGROUPIDNONE => $js.chrome.tabGroups.TAB_GROUP_ID_NONE as dynamic;

  /// Fired when a group is created.
  Stream<TabGroup> get onCreated => throw UnimplementedError();

  /// Fired when a group is updated.
  Stream<TabGroup> get onUpdated => throw UnimplementedError();

  /// Fired when a group is moved within a window. Move events are still fired
  /// for the individual tabs within the group, as well as for the group itself.
  /// This event is not fired when a group is moved between windows; instead, it
  /// will be removed from one window and created in another.
  Stream<TabGroup> get onMoved => throw UnimplementedError();

  /// Fired when a group is closed, either directly by the user or automatically
  /// because it contained zero tabs.
  Stream<TabGroup> get onRemoved => throw UnimplementedError();
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

  final $js.TabGroup _wrapped;

  $js.TabGroup get toJS => _wrapped;

  /// The ID of the group. Group IDs are unique within a browser session.
  int get id => _wrapped.id;
  set id(int v) {
    throw UnimplementedError();
  }

  /// Whether the group is collapsed. A collapsed group is one whose tabs are
  /// hidden.
  bool get collapsed => _wrapped.collapsed;
  set collapsed(bool v) {
    throw UnimplementedError();
  }

  /// The group's color.
  Color get color => Color.fromJS(_wrapped.color);
  set color(Color v) {
    throw UnimplementedError();
  }

  /// The title of the group.
  String? get title => _wrapped.title;
  set title(String? v) {
    throw UnimplementedError();
  }

  /// The ID of the window that contains the group.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    throw UnimplementedError();
  }
}

class QueryInfo {
  QueryInfo.fromJS(this._wrapped);

  final $js.QueryInfo _wrapped;

  $js.QueryInfo get toJS => _wrapped;
}

class UpdateProperties {
  UpdateProperties.fromJS(this._wrapped);

  final $js.UpdateProperties _wrapped;

  $js.UpdateProperties get toJS => _wrapped;
}

class MoveProperties {
  MoveProperties.fromJS(this._wrapped);

  final $js.MoveProperties _wrapped;

  $js.MoveProperties get toJS => _wrapped;
}
