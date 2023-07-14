import 'src/internal_helpers.dart';
import 'src/js/page_capture.dart' as $js;

export 'src/chrome.dart' show chrome;

final _pageCapture = ChromePageCapture._();

extension ChromePageCaptureExtension on Chrome {
  ChromePageCapture get pageCapture => _pageCapture;
}

class ChromePageCapture {
  ChromePageCapture._();

  /// Saves the content of the tab with given id as MHTML.
  void saveAsMHTML(
    SaveAsMhtmlDetails details,
    JSFunction callback,
  ) {
    $js.chrome.pageCapture.saveAsMHTML(
      details.toJS,
      callback,
    );
  }
}

class SaveAsMhtmlDetails {
  SaveAsMhtmlDetails.fromJS(this._wrapped);

  SaveAsMhtmlDetails({required int tabId})
      : _wrapped = $js.SaveAsMhtmlDetails(tabId: tabId);

  final $js.SaveAsMhtmlDetails _wrapped;

  $js.SaveAsMhtmlDetails get toJS => _wrapped;
}
