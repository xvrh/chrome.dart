import 'chrome.dart';

final _FileSystemProvider = ChromeFileSystemProvider._();

extension ChromeChromeFileSystemProviderExtension on Chrome {
  ChromeFileSystemProvider get FileSystemProvider => _FileSystemProvider;
}

class ChromeFileSystemProvider {
  ChromeFileSystemProvider._();
}
