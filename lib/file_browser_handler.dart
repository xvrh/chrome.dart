import 'chrome.dart';
export 'chrome.dart';

final _fileBrowserHandler = ChromeFileBrowserHandler._();

extension ChromeFileBrowserHandlerExtension on Chrome {
  ChromeFileBrowserHandler get fileBrowserHandler => _fileBrowserHandler;
}

class ChromeFileBrowserHandler {
  ChromeFileBrowserHandler._();

  /// Fired when file system action is executed from ChromeOS file browser.
  Stream get onExecute => throw UnimplementedError();
}
