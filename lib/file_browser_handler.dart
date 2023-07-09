import 'chrome.dart';
export 'chrome.dart';

final _fileBrowserHandler = ChromeFileBrowserHandler._();

extension ChromeChromeFileBrowserHandlerExtension on Chrome {
  ChromeFileBrowserHandler get fileBrowserHandler => _fileBrowserHandler;
}

class ChromeFileBrowserHandler {
  ChromeFileBrowserHandler._();
}
