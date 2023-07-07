/* This file has been generated from processes.idl - do not edit */

/**
 * Use the `chrome.processes` API to interact with the browser's processes.
 */
library chrome.processes;

import '../src/common.dart';

/**
 * Accessor for the `chrome.processes` namespace.
 */
final ChromeProcesses processes = ChromeProcesses._();

class ChromeProcesses extends ChromeApi {
  JsObject get _processes => chrome['processes'];

  Stream<Object> get onUpdated => _onUpdated.stream;
  late ChromeStreamController<Object> _onUpdated;

  Stream<Object> get onUpdatedWithMemory => _onUpdatedWithMemory.stream;
  late ChromeStreamController<Object> _onUpdatedWithMemory;

  Stream<Process> get onCreated => _onCreated.stream;
  late ChromeStreamController<Process> _onCreated;

  Stream<Process> get onUnresponsive => _onUnresponsive.stream;
  late ChromeStreamController<Process> _onUnresponsive;

  Stream<OnExitedEvent> get onExited => _onExited.stream;
  late ChromeStreamController<OnExitedEvent> _onExited;

  ChromeProcesses._() {
    var getApi = () => _processes;
    _onUpdated = ChromeStreamController<Object>.oneArg(getApi, 'onUpdated', selfConverter);
    _onUpdatedWithMemory = ChromeStreamController<Object>.oneArg(getApi, 'onUpdatedWithMemory', selfConverter);
    _onCreated = ChromeStreamController<Process>.oneArg(getApi, 'onCreated', _createProcess);
    _onUnresponsive = ChromeStreamController<Process>.oneArg(getApi, 'onUnresponsive', _createProcess);
    _onExited = ChromeStreamController<OnExitedEvent>.threeArgs(getApi, 'onExited', _createOnExitedEvent);
  }

  bool get available => _processes != null;

  /**
   * Returns the ID of the renderer process for the specified tab.
   * [tabId]: The ID of the tab for which the renderer process ID is to be
   * returned.
   * 
   * Returns:
   * A callback to return the ID of the renderer process of a tab.
   * [processId]: Process ID of the tab's renderer process.
   */
  Future<int> getProcessIdForTab(int tabId) {
    if (_processes == null) _throwNotAvailable();

    var completer =  ChromeCompleter<int>.oneArg();
    _processes.callMethod('getProcessIdForTab', [tabId, completer.callback]);
    return completer.future;
  }

  /**
   * Terminates the specified renderer process. Equivalent to visiting
   * about:crash, but without changing the tab's URL.
   * [processId]: The ID of the process to be terminated.
   * 
   * Returns:
   * A callback to report the status of the termination.
   * [didTerminate]: True if terminating the process was successful, and false
   * otherwise.
   */
  Future<bool> terminate(int processId) {
    if (_processes == null) _throwNotAvailable();

    var completer =  ChromeCompleter<bool>.oneArg();
    _processes.callMethod('terminate', [processId, completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves the process information for each process ID specified.
   * [processIds]: The list of process IDs or single process ID for which to
   * return the process information. An empty list indicates all processes are
   * requested.
   * [includeMemory]: True if detailed memory usage is required. Note,
   * collecting memory usage information incurs extra CPU usage and should only
   * be queried for when needed.
   * 
   * Returns:
   * A callback called when the processes information is collected.
   * [processes]: A dictionary of [Process] objects for each requested process
   * that is a live child process of the current browser process, indexed by
   * process ID. Metrics requiring aggregation over time will not be populated
   * in each Process object.
   */
  Future<Object> getProcessInfo(Object processIds, bool includeMemory) {
    if (_processes == null) _throwNotAvailable();

    var completer =  ChromeCompleter<Object>.oneArg();
    _processes.callMethod('getProcessInfo', [jsify(processIds), includeMemory, completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.processes' is not available");
  }
}

class OnExitedEvent {
  final int processId;

  final int exitType;

  final int exitCode;

  OnExitedEvent(this.processId, this.exitType, this.exitCode);
}

/**
 * The types of the browser processes.
 */
class ProcessType extends ChromeEnum {
  static const ProcessType BROWSER = const ProcessType._('browser');
  static const ProcessType RENDERER = const ProcessType._('renderer');
  static const ProcessType EXTENSION = const ProcessType._('extension');
  static const ProcessType NOTIFICATION = const ProcessType._('notification');
  static const ProcessType PLUGIN = const ProcessType._('plugin');
  static const ProcessType WORKER = const ProcessType._('worker');
  static const ProcessType NACL = const ProcessType._('nacl');
  static const ProcessType SERVICE_WORKER = const ProcessType._('service_worker');
  static const ProcessType UTILITY = const ProcessType._('utility');
  static const ProcessType GPU = const ProcessType._('gpu');
  static const ProcessType OTHER = const ProcessType._('other');

  static const List<ProcessType> VALUES = const[BROWSER, RENDERER, EXTENSION, NOTIFICATION, PLUGIN, WORKER, NACL, SERVICE_WORKER, UTILITY, GPU, OTHER];

  const ProcessType._(String str): super(str);
}

/**
 * An object that represents a Chrome task running on a process. Several tasks
 * can share the same process.
 */
class TaskInfo extends ChromeObject {
  TaskInfo({String? title, int? tabId}) {
    if (title != null) this.title = title;
    if (tabId != null) this.tabId = tabId;
  }
  TaskInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

/**
 * The Cache object contains information about the size and utilization of a
 * cache used by the browser.
 */
class Cache extends ChromeObject {
  Cache({num? size, num? liveSize}) {
    if (size != null) this.size = size;
    if (liveSize != null) this.liveSize = liveSize;
  }
  Cache.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  num get size => jsProxy['size'];
  set size(num value) => jsProxy['size'] = jsify(value);

  num get liveSize => jsProxy['liveSize'];
  set liveSize(num value) => jsProxy['liveSize'] = jsify(value);
}

/**
 * An object containing information about one of the browser's processes.
 */
class Process extends ChromeObject {
  Process({int? id, int? osProcessId, ProcessType? type, String? profile, int? naclDebugPort, List<TaskInfo>? tasks, num? cpu, num? network, num? privateMemory, num? jsMemoryAllocated, num? jsMemoryUsed, num? sqliteMemory, Cache? imageCache, Cache? scriptCache, Cache? cssCache}) {
    if (id != null) this.id = id;
    if (osProcessId != null) this.osProcessId = osProcessId;
    if (type != null) this.type = type;
    if (profile != null) this.profile = profile;
    if (naclDebugPort != null) this.naclDebugPort = naclDebugPort;
    if (tasks != null) this.tasks = tasks;
    if (cpu != null) this.cpu = cpu;
    if (network != null) this.network = network;
    if (privateMemory != null) this.privateMemory = privateMemory;
    if (jsMemoryAllocated != null) this.jsMemoryAllocated = jsMemoryAllocated;
    if (jsMemoryUsed != null) this.jsMemoryUsed = jsMemoryUsed;
    if (sqliteMemory != null) this.sqliteMemory = sqliteMemory;
    if (imageCache != null) this.imageCache = imageCache;
    if (scriptCache != null) this.scriptCache = scriptCache;
    if (cssCache != null) this.cssCache = cssCache;
  }
  Process.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get id => jsProxy['id'];
  set id(int value) => jsProxy['id'] = value;

  int get osProcessId => jsProxy['osProcessId'];
  set osProcessId(int value) => jsProxy['osProcessId'] = value;

  ProcessType get type => _createProcessType(jsProxy['type']);
  set type(ProcessType value) => jsProxy['type'] = jsify(value);

  String get profile => jsProxy['profile'];
  set profile(String value) => jsProxy['profile'] = value;

  int get naclDebugPort => jsProxy['naclDebugPort'];
  set naclDebugPort(int value) => jsProxy['naclDebugPort'] = value;

  List<TaskInfo> get tasks => listify(jsProxy['tasks'], _createTaskInfo);
  set tasks(List<TaskInfo> value) => jsProxy['tasks'] = jsify(value);

  num get cpu => jsProxy['cpu'];
  set cpu(num value) => jsProxy['cpu'] = jsify(value);

  num get network => jsProxy['network'];
  set network(num value) => jsProxy['network'] = jsify(value);

  num get privateMemory => jsProxy['privateMemory'];
  set privateMemory(num value) => jsProxy['privateMemory'] = jsify(value);

  num get jsMemoryAllocated => jsProxy['jsMemoryAllocated'];
  set jsMemoryAllocated(num value) => jsProxy['jsMemoryAllocated'] = jsify(value);

  num get jsMemoryUsed => jsProxy['jsMemoryUsed'];
  set jsMemoryUsed(num value) => jsProxy['jsMemoryUsed'] = jsify(value);

  num get sqliteMemory => jsProxy['sqliteMemory'];
  set sqliteMemory(num value) => jsProxy['sqliteMemory'] = jsify(value);

  Cache get imageCache => _createCache(jsProxy['imageCache']);
  set imageCache(Cache value) => jsProxy['imageCache'] = jsify(value);

  Cache get scriptCache => _createCache(jsProxy['scriptCache']);
  set scriptCache(Cache value) => jsProxy['scriptCache'] = jsify(value);

  Cache get cssCache => _createCache(jsProxy['cssCache']);
  set cssCache(Cache value) => jsProxy['cssCache'] = jsify(value);
}

Process _createProcess(JsObject jsProxy) => Process.fromProxy(jsProxy);
OnExitedEvent _createOnExitedEvent(int processId, int exitType, int exitCode) =>
    OnExitedEvent(processId, exitType, exitCode);
ProcessType _createProcessType(String value) => ProcessType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
TaskInfo _createTaskInfo(JsObject jsProxy) => TaskInfo.fromProxy(jsProxy);
Cache _createCache(JsObject jsProxy) => Cache.fromProxy(jsProxy);
