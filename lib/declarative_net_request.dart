import 'chrome.dart';

final _DeclarativeNetRequest = ChromeDeclarativeNetRequest._();

extension ChromeChromeDeclarativeNetRequestExtension on Chrome {
  ChromeDeclarativeNetRequest get DeclarativeNetRequest =>
      _DeclarativeNetRequest;
}

class ChromeDeclarativeNetRequest {
  ChromeDeclarativeNetRequest._();
}
