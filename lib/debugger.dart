import 'chrome.dart';
export 'chrome.dart';

final _debugger = ChromeDebugger._();

extension ChromeChromeDebuggerExtension on Chrome {
  ChromeDebugger get debugger => _debugger;
}

class ChromeDebugger {
  ChromeDebugger._();
}

/// Target type.
enum TargetInfoType {
  page('page'),
  backgroundPage('background_page'),
  worker('worker'),
  other('other');

  const TargetInfoType(this.value);

  final String value;
}

/// Connection termination reason.
enum DetachReason {
  targetClosed('target_closed'),
  canceledByUser('canceled_by_user');

  const DetachReason(this.value);

  final String value;
}
