import 'chrome.dart';
export 'chrome.dart';

final _storage = ChromeStorage._();

extension ChromeChromeStorageExtension on Chrome {
  ChromeStorage get storage => _storage;
}

class ChromeStorage {
  ChromeStorage._();

  /// Fired when one or more items change.
  Stream get onChanged => throw UnimplementedError();
}

/// The storage area's access level.
enum AccessLevel {
  trustedContexts('TRUSTED_CONTEXTS'),
  trustedAndUntrustedContexts('TRUSTED_AND_UNTRUSTED_CONTEXTS');

  const AccessLevel(this.value);

  final String value;
}
