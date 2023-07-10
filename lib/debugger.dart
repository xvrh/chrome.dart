import 'chrome.dart';
export 'chrome.dart';

final _debugger = ChromeDebugger._();

extension ChromeDebuggerExtension on Chrome {
  ChromeDebugger get debugger => _debugger;
}

class ChromeDebugger {
  ChromeDebugger._();

  /// Attaches debugger to the given target.
  void attach(
    target,
    requiredVersion,
  ) =>
      throw UnimplementedError();

  /// Detaches debugger from the given target.
  void detach(target) => throw UnimplementedError();

  /// Sends given command to the debugging target.
  void sendCommand(
    target,
    method,
    commandParams,
  ) =>
      throw UnimplementedError();

  /// Returns the list of available debug targets.
  void getTargets() => throw UnimplementedError();

  /// Fired whenever debugging target issues instrumentation event.
  Stream get onEvent => throw UnimplementedError();

  /// Fired when browser terminates debugging session for the tab. This happens
  /// when either the tab is being closed or Chrome DevTools is being invoked
  /// for the attached tab.
  Stream get onDetach => throw UnimplementedError();
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
