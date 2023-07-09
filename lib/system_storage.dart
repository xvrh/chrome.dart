import 'chrome.dart';

final _SystemStorage = ChromeSystemStorage._();

extension ChromeChromeSystemStorageExtension on Chrome {
  ChromeSystemStorage get SystemStorage => _SystemStorage;
}

class ChromeSystemStorage {
  ChromeSystemStorage._();
}
