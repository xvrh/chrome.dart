import 'chrome.dart';
export 'chrome.dart';

final _processes = ChromeProcesses._();

extension ChromeProcessesExtension on Chrome {
  ChromeProcesses get processes => _processes;
}

class ChromeProcesses {
  ChromeProcesses._();

  /// Returns the ID of the renderer process for the specified tab.
  /// |tabId|: The ID of the tab for which the renderer process ID is to be
  /// returned.
  void getProcessIdForTab(tabId) => throw UnimplementedError();

  /// Terminates the specified renderer process. Equivalent to visiting
  /// about:crash, but without changing the tab's URL.
  /// |processId|: The ID of the process to be terminated.
  void terminate(processId) => throw UnimplementedError();

  /// Retrieves the process information for each process ID specified.
  /// |processIds|: The list of process IDs or single process ID for which
  /// to return the process information. An empty list indicates all processes
  /// are requested.
  /// |includeMemory|: True if detailed memory usage is required. Note,
  /// collecting memory usage information incurs extra CPU usage and should
  /// only be queried for when needed.
  void getProcessInfo(
    processIds,
    includeMemory,
  ) =>
      throw UnimplementedError();

  /// Fired each time the Task Manager updates its process statistics,
  /// providing the dictionary of updated Process objects, indexed by process
  /// ID.
  /// |processes|: A dictionary of updated $(ref:Process) objects for each live
  /// process in the browser, indexed by process ID.  Metrics requiring
  /// aggregation over time will be populated in each Process object.
  Stream get onUpdated => throw UnimplementedError();

  /// Fired each time the Task Manager updates its process statistics,
  /// providing the dictionary of updated Process objects, indexed by process
  /// ID. Identical to onUpdate, with the addition of memory usage details
  /// included in each Process object. Note, collecting memory usage
  /// information incurs extra CPU usage and should only be listened for when
  /// needed.
  /// |processes|: A dictionary of updated $(ref:Process) objects for each live
  /// process in the browser, indexed by process ID.  Memory usage details will
  /// be included in each Process object.
  Stream get onUpdatedWithMemory => throw UnimplementedError();

  /// Fired each time a process is created, providing the corrseponding Process
  /// object.
  /// |process|: Details of the process that was created. Metrics requiring
  /// aggregation over time will not be populated in the object.
  Stream get onCreated => throw UnimplementedError();

  /// Fired each time a process becomes unresponsive, providing the
  /// corrseponding Process object.
  /// |process|: Details of the unresponsive process. Metrics requiring
  /// aggregation over time will not be populated in the object. Only available
  /// for renderer processes.
  Stream get onUnresponsive => throw UnimplementedError();

  /// Fired each time a process is terminated, providing the type of exit.
  /// |processId|: The ID of the process that exited.
  /// |exitType|: The type of exit that occurred for the process - normal,
  /// abnormal, killed, crashed. Only available for renderer processes.
  /// |exitCode|: The exit code if the process exited abnormally. Only
  /// available for renderer processes.
  Stream get onExited => throw UnimplementedError();
}

/// The types of the browser processes.
enum ProcessType {
  browser('browser'),
  renderer('renderer'),
  extension('extension'),
  notification('notification'),
  plugin('plugin'),
  worker('worker'),
  nacl('nacl'),
  serviceWorker('service_worker'),
  utility('utility'),
  gpu('gpu'),
  other('other');

  const ProcessType(this.value);

  final String value;
}
