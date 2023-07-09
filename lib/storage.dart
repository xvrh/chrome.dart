import 'chrome.dart';

final _Storage = ChromeStorage._();

extension ChromeChromeStorageExtension on Chrome {
  ChromeStorage get Storage => _Storage;
}

class ChromeStorage {
  ChromeStorage._();
}
