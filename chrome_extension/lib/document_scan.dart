import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/document_scan.dart' as $js;

export 'src/chrome.dart' show chrome;

final _documentScan = ChromeDocumentScan._();

extension ChromeDocumentScanExtension on Chrome {
  ChromeDocumentScan get documentScan => _documentScan;
}

class ChromeDocumentScan {
  ChromeDocumentScan._();

  bool get isAvailable => $js.chrome.documentScanNullable != null;

  /// Performs a document scan.  On success, the PNG data will be
  /// sent to the callback.
  /// |options| : Object containing scan parameters.
  /// |callback| : Called with the result and data from the scan.
  Future<ScanResults> scan(ScanOptions options) async {
    var $res = await promiseToFuture<$js.ScanResults>(
        $js.chrome.documentScan.scan(options.toJS));
    return ScanResults.fromJS($res);
  }
}

class ScanOptions {
  ScanOptions.fromJS(this._wrapped);

  ScanOptions({
    List<String>? mimeTypes,
    int? maxImages,
  }) : _wrapped = $js.ScanOptions(
          mimeTypes: mimeTypes?.toJSArray((e) => e),
          maxImages: maxImages,
        );

  final $js.ScanOptions _wrapped;

  $js.ScanOptions get toJS => _wrapped;
}

class ScanResults {
  ScanResults.fromJS(this._wrapped);

  ScanResults({
    required List<String> dataUrls,
    required String mimeType,
  }) : _wrapped = $js.ScanResults()
          ..dataUrls = dataUrls.toJSArray((e) => e)
          ..mimeType = mimeType;

  final $js.ScanResults _wrapped;

  $js.ScanResults get toJS => _wrapped;

  /// The data image URLs in a form that can be passed as the "src" value to
  /// an image tag.
  List<String> get dataUrls =>
      _wrapped.dataUrls.toDart.cast<String>().map((e) => e).toList();
  set dataUrls(List<String> v) {
    _wrapped.dataUrls = v.toJSArray((e) => e);
  }

  /// The MIME type of `dataUrls`.
  String get mimeType => _wrapped.mimeType;
  set mimeType(String v) {
    _wrapped.mimeType = v;
  }
}
