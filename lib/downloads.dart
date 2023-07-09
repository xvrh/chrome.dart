import 'chrome.dart';

final _Downloads = ChromeDownloads._();

extension ChromeChromeDownloadsExtension on Chrome {
  ChromeDownloads get Downloads => _Downloads;
}

class ChromeDownloads {
  ChromeDownloads._();
}
