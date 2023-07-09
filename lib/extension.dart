import 'chrome.dart';
export 'chrome.dart';

final _extension = ChromeExtension._();

extension ChromeChromeExtensionExtension on Chrome {
  ChromeExtension get extension => _extension;
}

class ChromeExtension {
  ChromeExtension._();
}

/// The type of extension view.
enum ViewType {
  tab('tab'),
  popup('popup');

  const ViewType(this.value);

  final String value;
}
