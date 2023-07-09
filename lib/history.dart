import 'chrome.dart';
export 'chrome.dart';

final _history = ChromeHistory._();

extension ChromeChromeHistoryExtension on Chrome {
  ChromeHistory get history => _history;
}

class ChromeHistory {
  ChromeHistory._();
}

/// The <a href='#transition_types'>transition type</a> for this visit from its
/// referrer.
enum TransitionType {
  link('link'),
  typed('typed'),
  autoBookmark('auto_bookmark'),
  autoSubframe('auto_subframe'),
  manualSubframe('manual_subframe'),
  generated('generated'),
  autoToplevel('auto_toplevel'),
  formSubmit('form_submit'),
  reload('reload'),
  keyword('keyword'),
  keywordGenerated('keyword_generated');

  const TransitionType(this.value);

  final String value;
}
