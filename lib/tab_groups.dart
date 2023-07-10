import 'chrome.dart';
export 'chrome.dart';

final _tabGroups = ChromeTabGroups._();

extension ChromeTabGroupsExtension on Chrome {
  ChromeTabGroups get tabGroups => _tabGroups;
}

class ChromeTabGroups {
  ChromeTabGroups._();

  /// Retrieves details about the specified group.
  void get(groupId) => throw UnimplementedError();

  /// Gets all groups that have the specified properties, or all groups if no
  /// properties are specified.
  void query(queryInfo) => throw UnimplementedError();

  /// Modifies the properties of a group. Properties that are not specified in
  /// `updateProperties` are not modified.
  void update(
    groupId,
    updateProperties,
  ) =>
      throw UnimplementedError();

  /// Moves the group and all its tabs within its window, or to a new window.
  void move(
    groupId,
    moveProperties,
  ) =>
      throw UnimplementedError();

  /// Fired when a group is created.
  Stream get onCreated => throw UnimplementedError();

  /// Fired when a group is updated.
  Stream get onUpdated => throw UnimplementedError();

  /// Fired when a group is moved within a window. Move events are still fired
  /// for the individual tabs within the group, as well as for the group itself.
  /// This event is not fired when a group is moved between windows; instead, it
  /// will be removed from one window and created in another.
  Stream get onMoved => throw UnimplementedError();

  /// Fired when a group is closed, either directly by the user or automatically
  /// because it contained zero tabs.
  Stream get onRemoved => throw UnimplementedError();
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
}
