import 'chrome.dart';
export 'chrome.dart';

final _runtime = ChromeRuntime._();

extension ChromeChromeRuntimeExtension on Chrome {
  ChromeRuntime get runtime => _runtime;
}

class ChromeRuntime {
  ChromeRuntime._();
}

/// The operating system Chrome is running on.
enum PlatformOs {
  mac('mac'),
  win('win'),
  android('android'),
  cros('cros'),
  linux('linux'),
  openbsd('openbsd'),
  fuchsia('fuchsia');

  const PlatformOs(this.value);

  final String value;
}

/// The machine's processor architecture.
enum PlatformArch {
  arm('arm'),
  arm64('arm64'),
  x8632('x86-32'),
  x8664('x86-64'),
  mips('mips'),
  mips64('mips64');

  const PlatformArch(this.value);

  final String value;
}

/// The native client architecture. This may be different from arch on some
/// platforms.
enum PlatformNaclArch {
  arm('arm'),
  x8632('x86-32'),
  x8664('x86-64'),
  mips('mips'),
  mips64('mips64');

  const PlatformNaclArch(this.value);

  final String value;
}

/// Result of the update check.
enum RequestUpdateCheckStatus {
  throttled('throttled'),
  noUpdate('no_update'),
  updateAvailable('update_available');

  const RequestUpdateCheckStatus(this.value);

  final String value;
}

/// The reason that this event is being dispatched.
enum OnInstalledReason {
  install('install'),
  update('update'),
  chromeUpdate('chrome_update'),
  sharedModuleUpdate('shared_module_update');

  const OnInstalledReason(this.value);

  final String value;
}

/// The reason that the event is being dispatched. 'app_update' is used when the
/// restart is needed because the application is updated to a newer version.
/// 'os_update' is used when the restart is needed because the browser/OS is
/// updated to a newer version. 'periodic' is used when the system runs for more
/// than the permitted uptime set in the enterprise policy.
enum OnRestartRequiredReason {
  appUpdate('app_update'),
  osUpdate('os_update'),
  periodic('periodic');

  const OnRestartRequiredReason(this.value);

  final String value;
}

enum ContextType {
  tab('TAB'),
  popup('POPUP'),
  background('BACKGROUND'),
  offscreenDOCUMENT('OFFSCREEN_DOCUMENT');

  const ContextType(this.value);

  final String value;
}
