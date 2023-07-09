import 'chrome.dart';

final _FileBrowserHandler = ChromeFileBrowserHandler._();

extension ChromeChromeFileBrowserHandlerExtension on Chrome {
  ChromeFileBrowserHandler get FileBrowserHandler => _FileBrowserHandler;
}

class ChromeFileBrowserHandler {
  ChromeFileBrowserHandler._();
}
