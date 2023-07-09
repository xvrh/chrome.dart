import 'chrome.dart';
export 'chrome.dart';

final _webNavigation = ChromeWebNavigation._();

extension ChromeChromeWebNavigationExtension on Chrome {
  ChromeWebNavigation get webNavigation => _webNavigation;
}

class ChromeWebNavigation {
  ChromeWebNavigation._();
}

/// Cause of the navigation. The same transition types as defined in the history
/// API are used. These are the same transition types as defined in the <a
/// href="history#transition_types">history API</a> except with `"start_page"`
/// in place of `"auto_toplevel"` (for backwards compatibility).
enum TransitionType {
  link('link'),
  typed('typed'),
  autoBookmark('auto_bookmark'),
  autoSubframe('auto_subframe'),
  manualSubframe('manual_subframe'),
  generated('generated'),
  startPage('start_page'),
  formSubmit('form_submit'),
  reload('reload'),
  keyword('keyword'),
  keywordGenerated('keyword_generated');

  const TransitionType(this.value);

  final String value;
}

enum TransitionQualifier {
  clientRedirect('client_redirect'),
  serverRedirect('server_redirect'),
  forwardBack('forward_back'),
  fromAddressBar('from_address_bar');

  const TransitionQualifier(this.value);

  final String value;
}
