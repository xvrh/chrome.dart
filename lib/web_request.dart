import 'chrome.dart';

final _WebRequest = ChromeWebRequest._();

extension ChromeChromeWebRequestExtension on Chrome {
  ChromeWebRequest get WebRequest => _WebRequest;
}

class ChromeWebRequest {
  ChromeWebRequest._();
}
