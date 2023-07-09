import 'chrome.dart';
export 'chrome.dart';

final _management = ChromeManagement._();

extension ChromeChromeManagementExtension on Chrome {
  ChromeManagement get management => _management;
}

class ChromeManagement {
  ChromeManagement._();
}

/// These are all possible app launch types.
enum LaunchType {
  openASREGULARTAB('OPEN_AS_REGULAR_TAB'),
  openASPINNEDTAB('OPEN_AS_PINNED_TAB'),
  openASWINDOW('OPEN_AS_WINDOW'),
  openFULLSCREEN('OPEN_FULL_SCREEN');

  const LaunchType(this.value);

  final String value;
}

/// A reason the item is disabled.
enum ExtensionDisabledReason {
  unknown('unknown'),
  permissionsIncrease('permissions_increase');

  const ExtensionDisabledReason(this.value);

  final String value;
}

/// The type of this extension, app, or theme.
enum ExtensionType {
  extension('extension'),
  hostedApp('hosted_app'),
  packagedApp('packaged_app'),
  legacyPackagedApp('legacy_packaged_app'),
  theme('theme'),
  loginScreenExtension('login_screen_extension');

  const ExtensionType(this.value);

  final String value;
}

/// How the extension was installed. One of<br><var>admin</var>: The extension
/// was installed because of an administrative
/// policy,<br><var>development</var>: The extension was loaded unpacked in
/// developer mode,<br><var>normal</var>: The extension was installed normally
/// via a .crx file,<br><var>sideload</var>: The extension was installed by
/// other software on the machine,<br><var>other</var>: The extension was
/// installed by other means.
enum ExtensionInstallType {
  admin('admin'),
  development('development'),
  normal('normal'),
  sideload('sideload'),
  other('other');

  const ExtensionInstallType(this.value);

  final String value;
}
