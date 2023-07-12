import 'src/internal_helpers.dart';
import 'src/js/page_capture.dart' as $js;
export 'chrome.dart';

final _pageCapture = ChromePageCapture._();

extension ChromePageCaptureExtension on Chrome {
  ChromePageCapture get pageCapture => _pageCapture;
}

class ChromePageCapture {
  ChromePageCapture._();

  /// Saves the content of the tab with given id as MHTML.
  void saveAsMHTML(
    SaveAsMHTMLDetails details,
    JSAny callback,
  ) =>
      throw UnimplementedError();
}

class SaveAsMHTMLDetails {
  SaveAsMHTMLDetails.fromJS(this._wrapped);

  final $js.SaveAsMHTMLDetails _wrapped;

  $js.SaveAsMHTMLDetails get toJS => _wrapped;
}
