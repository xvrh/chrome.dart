import 'dart:js_interop';

import 'system.dart';

export 'chrome.dart';
export 'system.dart';

extension JSChromeJSSystemCpuExtension on JSChromeSystem {
  /// Use the `system.cpu` API to query CPU metadata.
  external JSSystemCpu get cpu;
}

@JS()
@staticInterop
class JSSystemCpu {}

extension JSSystemCpuExtension on JSSystemCpu {
  /// Queries basic CPU information of the system.
  external JSPromise getInfo();
}

@JS()
@staticInterop
class CpuTime {}

extension CpuTimeExtension on CpuTime {
  /// The cumulative time used by userspace programs on this processor.
  external double user;

  /// The cumulative time used by kernel programs on this processor.
  external double kernel;

  /// The cumulative time spent idle by this processor.
  external double idle;

  /// The total cumulative time for this processor.  This value is equal to
  /// user + kernel + idle.
  external double total;
}

@JS()
@staticInterop
class ProcessorInfo {}

extension ProcessorInfoExtension on ProcessorInfo {
  /// Cumulative usage info for this logical processor.
  external CpuTime usage;
}

@JS()
@staticInterop
class CpuInfo {}

extension CpuInfoExtension on CpuInfo {
  /// The number of logical processors.
  external int numOfProcessors;

  /// The architecture name of the processors.
  external String archName;

  /// The model name of the processors.
  external String modelName;

  /// A set of feature codes indicating some of the processor's capabilities.
  /// The currently supported codes are "mmx", "sse", "sse2", "sse3", "ssse3",
  /// "sse4_1", "sse4_2", and "avx".
  external JSArray features;

  /// Information about each logical processor.
  external JSArray processors;

  /// List of CPU temperature readings from each thermal zone of the CPU.
  /// Temperatures are in degrees Celsius.
  ///
  /// **Currently supported on Chrome OS only.**
  external JSArray temperatures;
}
