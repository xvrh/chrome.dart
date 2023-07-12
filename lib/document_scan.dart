import 'src/internal_helpers.dart';
import 'src/js/document_scan.dart' as $js;
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
  Future<ScanResults> scan(ScanOptions options) => throw UnimplementedError();
}

class ScanOptions {
  ScanOptions.fromJS(this._wrapped);

  final $js.ScanOptions _wrapped;

  $js.ScanOptions get toJS => _wrapped;

  /// The MIME types that are accepted by the caller.
  List<String>? get mimeTypes => throw UnimplementedError();
  set mimeTypes(List<String>? v) {
    _wrapped.mimeTypes = throw UnimplementedError();
  }

  /// The number of scanned images allowed (defaults to 1).
  int? get maxImages => _wrapped.maxImages;
  set maxImages(int? v) {
    _wrapped.maxImages = v;
  }
}

class ScanResults {
  ScanResults.fromJS(this._wrapped);

  final $js.ScanResults _wrapped;

  $js.ScanResults get toJS => _wrapped;

  /// The data image URLs in a form that can be passed as the "src" value to
  /// an image tag.
  List<String> get dataUrls => throw UnimplementedError();
  set dataUrls(List<String> v) {
    _wrapped.dataUrls = throw UnimplementedError();
  }

  /// The MIME type of `dataUrls`.
  String get mimeType => _wrapped.mimeType;
  set mimeType(String v) {
    _wrapped.mimeType = v;
  }
}
