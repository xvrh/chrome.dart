import 'chrome.dart';

final _ContextMenus = ChromeContextMenus._();

extension ChromeChromeContextMenusExtension on Chrome {
  ChromeContextMenus get ContextMenus => _ContextMenus;
}

class ChromeContextMenus {
  ChromeContextMenus._();
}
