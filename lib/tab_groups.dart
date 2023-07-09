import 'chrome.dart';
export 'chrome.dart';

final _tabGroups = ChromeTabGroups._();

extension ChromeChromeTabGroupsExtension on Chrome {
  ChromeTabGroups get tabGroups => _tabGroups;
}

class ChromeTabGroups {
  ChromeTabGroups._();
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
