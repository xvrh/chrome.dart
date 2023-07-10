import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSProcessesExtension on JSChrome {
  /// Use the `chrome.processes` API to interact with the browser's
  /// processes.
  external JSProcesses get processes;
}

@JS()
@staticInterop
class JSProcesses {}

extension JSProcessesExtension on JSProcesses {
  /// Returns the ID of the renderer process for the specified tab.
  /// |tabId|: The ID of the tab for which the renderer process ID is to be
  /// returned.
  external void getProcessIdForTab(
    int tabId,
    JSFunction callback,
  );

  /// Terminates the specified renderer process. Equivalent to visiting
  /// about:crash, but without changing the tab's URL.
  /// |processId|: The ID of the process to be terminated.
  external void terminate(
    int processId,
    JSFunction callback,
  );

  /// Retrieves the process information for each process ID specified.
  /// |processIds|: The list of process IDs or single process ID for which
  /// to return the process information. An empty list indicates all processes
  /// are requested.
  /// |includeMemory|: True if detailed memory usage is required. Note,
  /// collecting memory usage information incurs extra CPU usage and should
  /// only be queried for when needed.
  external void getProcessInfo(
    JSObject processIds,
    bool includeMemory,
    JSFunction callback,
  );

  /// Fired each time the Task Manager updates its process statistics,
  /// providing the dictionary of updated Process objects, indexed by process
  /// ID.
  /// |processes|: A dictionary of updated $(ref:Process) objects for each live
  /// process in the browser, indexed by process ID.  Metrics requiring
  /// aggregation over time will be populated in each Process object.
  external ChromeEvent get onUpdated;

  /// Fired each time the Task Manager updates its process statistics,
  /// providing the dictionary of updated Process objects, indexed by process
  /// ID. Identical to onUpdate, with the addition of memory usage details
  /// included in each Process object. Note, collecting memory usage
  /// information incurs extra CPU usage and should only be listened for when
  /// needed.
  /// |processes|: A dictionary of updated $(ref:Process) objects for each live
  /// process in the browser, indexed by process ID.  Memory usage details will
  /// be included in each Process object.
  external ChromeEvent get onUpdatedWithMemory;

  /// Fired each time a process is created, providing the corrseponding Process
  /// object.
  /// |process|: Details of the process that was created. Metrics requiring
  /// aggregation over time will not be populated in the object.
  external ChromeEvent get onCreated;

  /// Fired each time a process becomes unresponsive, providing the
  /// corrseponding Process object.
  /// |process|: Details of the unresponsive process. Metrics requiring
  /// aggregation over time will not be populated in the object. Only available
  /// for renderer processes.
  external ChromeEvent get onUnresponsive;

  /// Fired each time a process is terminated, providing the type of exit.
  /// |processId|: The ID of the process that exited.
  /// |exitType|: The type of exit that occurred for the process - normal,
  /// abnormal, killed, crashed. Only available for renderer processes.
  /// |exitCode|: The exit code if the process exited abnormally. Only
  /// available for renderer processes.
  external ChromeEvent get onExited;
}

/// The types of the browser processes.
typedef ProcessType = String;

@JS()
@staticInterop
class TaskInfo {}

extension TaskInfoExtension on TaskInfo {
  /// The title of the task.
  external String title;

  /// Optional tab ID, if this task represents a tab running on a renderer
  /// process.
  external int? tabId;
}

@JS()
@staticInterop
class Cache {}

extension CacheExtension on Cache {
  /// The size of the cache, in bytes.
  external double size;

  /// The part of the cache that is utilized, in bytes.
  external double liveSize;
}

@JS()
@staticInterop
class Process {}

extension ProcessExtension on Process {
  /// Unique ID of the process provided by the browser.
  external int id;

  /// The ID of the process, as provided by the OS.
  external int osProcessId;

  /// The type of process.
  external ProcessType type;

  /// The profile which the process is associated with.
  external String profile;

  /// The debugging port for Native Client processes. Zero for other process
  /// types and for NaCl processes that do not have debugging enabled.
  external int naclDebugPort;

  /// Array of TaskInfos representing the tasks running on this process.
  external JSArray tasks;

  /// The most recent measurement of the process's CPU usage, expressed as the
  /// percentage of a single CPU core used in total, by all of the process's
  /// threads. This gives a value from zero to CpuInfo.numOfProcessors*100,
  /// which can exceed 100% in multi-threaded processes.
  /// Only available when receiving the object as part of a callback from
  /// onUpdated or onUpdatedWithMemory.
  external double? cpu;

  /// The most recent measurement of the process network usage, in bytes per
  /// second. Only available when receiving the object as part of a callback
  /// from onUpdated or onUpdatedWithMemory.
  external double? network;

  /// The most recent measurement of the process private memory usage, in
  /// bytes. Only available when receiving the object as part of a callback
  /// from onUpdatedWithMemory or getProcessInfo with the includeMemory flag.
  external double? privateMemory;

  /// The most recent measurement of the process JavaScript allocated memory,
  /// in bytes. Only available when receiving the object as part of a callback
  /// from onUpdated or onUpdatedWithMemory.
  external double? jsMemoryAllocated;

  /// The most recent measurement of the process JavaScript memory used, in
  /// bytes. Only available when receiving the object as part of a callback
  /// from onUpdated or onUpdatedWithMemory.
  external double? jsMemoryUsed;

  /// The most recent measurement of the process's SQLite memory usage, in
  /// bytes. Only available when receiving the object as part of a callback
  /// from onUpdated or onUpdatedWithMemory.
  external double? sqliteMemory;

  /// The most recent information about the image cache for the process. Only
  /// available when receiving the object as part of a callback from onUpdated
  /// or onUpdatedWithMemory.
  external Cache? imageCache;

  /// The most recent information about the script cache for the process. Only
  /// available when receiving the object as part of a callback from onUpdated
  /// or onUpdatedWithMemory.
  external Cache? scriptCache;

  /// The most recent information about the CSS cache for the process. Only
  /// available when receiving the object as part of a callback from onUpdated
  /// or onUpdatedWithMemory.
  external Cache? cssCache;
}
