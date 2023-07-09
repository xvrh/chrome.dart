import 'chrome.dart';

final _Dom = ChromeDom._();

extension ChromeChromeDomExtension on Chrome {
  ChromeDom get Dom => _Dom;
}

class ChromeDom {
  ChromeDom._();
}
