import 'chrome.dart';
export 'chrome.dart';

final _documentScan = ChromeDocumentScan._();

extension ChromeDocumentScanExtension on Chrome {
  ChromeDocumentScan get documentScan => _documentScan;
}

class ChromeDocumentScan {
  ChromeDocumentScan._();

  /// Performs a document scan.  On success, the PNG data will be
  /// sent to the callback.
  /// |options| : Object containing scan parameters.
  /// |callback| : Called with the result and data from the scan.
  void scan(options) => throw UnimplementedError();
}
