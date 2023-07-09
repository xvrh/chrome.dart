import 'chrome.dart';
export 'chrome.dart';

final _dom = ChromeDom._();

extension ChromeChromeDomExtension on Chrome {
  ChromeDom get dom => _dom;
}

class ChromeDom {
  ChromeDom._();
}
