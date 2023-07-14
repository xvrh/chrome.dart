import 'src/internal_helpers.dart';

export 'devtools_inspected_window.dart';
export 'devtools_network.dart';
export 'devtools_panels.dart';
export 'devtools_recorder.dart';

final _chromeDevtools = ChromeDevtools._();

extension ChromeDevtoolsExtension on Chrome {
  ChromeDevtools get devtools => _chromeDevtools;
}

class ChromeDevtools {
  ChromeDevtools._();
}
