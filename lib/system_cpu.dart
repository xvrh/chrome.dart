import 'src/internal_helpers.dart';
import 'src/js/system_cpu.dart' as $js;
export 'chrome.dart';

final _systemCpu = ChromeSystemCpu._();

extension ChromeSystemCpuExtension on Chrome {
  ChromeSystemCpu get systemCpu => _systemCpu;
}

class ChromeSystemCpu {
  ChromeSystemCpu._();

  /// Queries basic CPU information of the system.
  Future<CpuInfo> getInfo() => throw UnimplementedError();
}

class CpuTime {
  CpuTime.fromJS(this._wrapped);

  final $js.CpuTime _wrapped;

  $js.CpuTime get toJS => _wrapped;

  /// The cumulative time used by userspace programs on this processor.
  double get user => _wrapped.user;
  set user(double v) {
    throw UnimplementedError();
  }

  /// The cumulative time used by kernel programs on this processor.
  double get kernel => _wrapped.kernel;
  set kernel(double v) {
    throw UnimplementedError();
  }

  /// The cumulative time spent idle by this processor.
  double get idle => _wrapped.idle;
  set idle(double v) {
    throw UnimplementedError();
  }

  /// The total cumulative time for this processor.  This value is equal to
  /// user + kernel + idle.
  double get total => _wrapped.total;
  set total(double v) {
    throw UnimplementedError();
  }
}

class ProcessorInfo {
  ProcessorInfo.fromJS(this._wrapped);

  final $js.ProcessorInfo _wrapped;

  $js.ProcessorInfo get toJS => _wrapped;

  /// Cumulative usage info for this logical processor.
  CpuTime get usage => CpuTime.fromJS(_wrapped.usage);
  set usage(CpuTime v) {
    throw UnimplementedError();
  }
}

class CpuInfo {
  CpuInfo.fromJS(this._wrapped);

  final $js.CpuInfo _wrapped;

  $js.CpuInfo get toJS => _wrapped;

  /// The number of logical processors.
  int get numOfProcessors => _wrapped.numOfProcessors;
  set numOfProcessors(int v) {
    throw UnimplementedError();
  }

  /// The architecture name of the processors.
  String get archName => _wrapped.archName;
  set archName(String v) {
    throw UnimplementedError();
  }

  /// The model name of the processors.
  String get modelName => _wrapped.modelName;
  set modelName(String v) {
    throw UnimplementedError();
  }

  /// A set of feature codes indicating some of the processor's capabilities.
  /// The currently supported codes are "mmx", "sse", "sse2", "sse3", "ssse3",
  /// "sse4_1", "sse4_2", and "avx".
  List<String> get features => throw UnimplementedError();
  set features(List<String> v) {
    throw UnimplementedError();
  }

  /// Information about each logical processor.
  List<ProcessorInfo> get processors => throw UnimplementedError();
  set processors(List<ProcessorInfo> v) {
    throw UnimplementedError();
  }

  /// List of CPU temperature readings from each thermal zone of the CPU.
  /// Temperatures are in degrees Celsius.
  ///
  /// **Currently supported on Chrome OS only.**
  List<double> get temperatures => throw UnimplementedError();
  set temperatures(List<double> v) {
    throw UnimplementedError();
  }
}
