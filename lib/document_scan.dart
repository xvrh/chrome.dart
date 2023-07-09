import 'chrome.dart';

final _DocumentScan = ChromeDocumentScan._();

extension ChromeChromeDocumentScanExtension on Chrome {
  ChromeDocumentScan get DocumentScan => _DocumentScan;
}

class ChromeDocumentScan {
  ChromeDocumentScan._();
}
