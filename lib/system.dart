import 'src/internal_helpers.dart';

export 'system_cpu.dart';
export 'system_display.dart';
export 'system_memory.dart';
export 'system_network.dart';
export 'system_storage.dart';

final _chromeSystem = ChromeSystem._();

extension ChromeSystemExtension on Chrome {
  ChromeSystem get system => _chromeSystem;
}

class ChromeSystem {
  ChromeSystem._();
}
