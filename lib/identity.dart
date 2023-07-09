import 'chrome.dart';
export 'chrome.dart';

final _identity = ChromeIdentity._();

extension ChromeChromeIdentityExtension on Chrome {
  ChromeIdentity get identity => _identity;
}

class ChromeIdentity {
  ChromeIdentity._();
}

enum AccountStatus {
  ///  Sync is enabled for the primary account.
  sync$('SYNC'),

  ///  Any primary account, if exists.
  any('ANY');

  const AccountStatus(this.value);

  final String value;
}
