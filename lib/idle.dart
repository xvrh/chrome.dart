import 'chrome.dart';
export 'chrome.dart';

final _idle = ChromeIdle._();

extension ChromeChromeIdleExtension on Chrome {
  ChromeIdle get idle => _idle;
}

class ChromeIdle {
  ChromeIdle._();
}

enum IdleState {
  active('active'),
  idle('idle'),
  locked('locked');

  const IdleState(this.value);

  final String value;
}
