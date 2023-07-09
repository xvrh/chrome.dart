import 'chrome.dart';
export 'chrome.dart';

final _documentScan = ChromeDocumentScan._();

extension ChromeChromeDocumentScanExtension on Chrome {
  ChromeDocumentScan get documentScan => _documentScan;
}

class ChromeDocumentScan {
  ChromeDocumentScan._();
}
