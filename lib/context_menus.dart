import 'chrome.dart';
export 'chrome.dart';

final _contextMenus = ChromeContextMenus._();

extension ChromeChromeContextMenusExtension on Chrome {
  ChromeContextMenus get contextMenus => _contextMenus;
}

class ChromeContextMenus {
  ChromeContextMenus._();
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
}

/// The type of menu item.
enum ItemType {
  normal('normal'),
  checkbox('checkbox'),
  radio('radio'),
  separator('separator');

  const ItemType(this.value);

  final String value;
}
