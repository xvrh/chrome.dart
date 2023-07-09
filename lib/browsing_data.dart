import 'chrome.dart';
export 'chrome.dart';

final _browsingData = ChromeBrowsingData._();

extension ChromeChromeBrowsingDataExtension on Chrome {
  ChromeBrowsingData get browsingData => _browsingData;
}

class ChromeBrowsingData {
  ChromeBrowsingData._();
}
