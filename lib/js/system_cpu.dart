import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSystemCpuExtension on JSChrome {
  ///  Use the `system.cpu` API to query CPU metadata.
  external JSSystemCpu get systemCpu;
}

@JS()
@staticInterop
class JSSystemCpu {}

extension JSSystemCpuExtension on JSSystemCpu {
  ///  Queries basic CPU information of the system.
  external void getInfo(callback);
}

@JS()
@staticInterop
class CpuTime {
  ///  The cumulative time used by userspace programs on this processor.
  external JSAny get user;

  ///  The cumulative time used by kernel programs on this processor.
  external JSAny get kernel;

  ///  The cumulative time spent idle by this processor.
  external JSAny get idle;

  ///  The total cumulative time for this processor.  This value is equal to
  ///  user + kernel + idle.
  external JSAny get total;
}

@JS()
@staticInterop
class ProcessorInfo {
  ///  Cumulative usage info for this logical processor.
  external JSAny get usage;
}

@JS()
@staticInterop
class CpuInfo {
  ///  The number of logical processors.
  external JSAny get numOfProcessors;

  ///  The architecture name of the processors.
  external JSAny get archName;

  ///  The model name of the processors.
  external JSAny get modelName;

  ///  A set of feature codes indicating some of the processor's capabilities.
  ///  The currently supported codes are "mmx", "sse", "sse2", "sse3", "ssse3",
  ///  "sse4_1", "sse4_2", and "avx".
  external JSArray get features;

  ///  Information about each logical processor.
  external JSArray get processors;

  ///  List of CPU temperature readings from each thermal zone of the CPU.
  ///  Temperatures are in degrees Celsius.
  ///
  ///  <b>Currently supported on Chrome OS only.</b>
  external JSArray get temperatures;
}
