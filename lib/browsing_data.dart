import 'chrome.dart';

final _BrowsingData = ChromeBrowsingData._();

extension ChromeChromeBrowsingDataExtension on Chrome {
  ChromeBrowsingData get BrowsingData => _BrowsingData;
}

class ChromeBrowsingData {
  ChromeBrowsingData._();
}
