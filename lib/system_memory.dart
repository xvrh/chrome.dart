import 'src/internal_helpers.dart';
import 'src/js/system_memory.dart' as $js;
export 'chrome.dart';

final _systemMemory = ChromeSystemMemory._();

extension ChromeSystemMemoryExtension on Chrome {
  ChromeSystemMemory get systemMemory => _systemMemory;
}

class ChromeSystemMemory {
  ChromeSystemMemory._();

  /// Get physical memory information.
  Future<MemoryInfo> getInfo() => throw UnimplementedError();
}

class MemoryInfo {
  MemoryInfo.fromJS(this._wrapped);

  final $js.MemoryInfo _wrapped;

  $js.MemoryInfo get toJS => _wrapped;

  /// The total amount of physical memory capacity, in bytes.
  double get capacity => _wrapped.capacity;
  set capacity(double v) {
    _wrapped.capacity = v;
  }

  /// The amount of available capacity, in bytes.
  double get availableCapacity => _wrapped.availableCapacity;
  set availableCapacity(double v) {
    _wrapped.availableCapacity = v;
  }
}
