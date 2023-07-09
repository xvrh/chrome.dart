import 'chrome.dart';
export 'chrome.dart';

final _omnibox = ChromeOmnibox._();

extension ChromeChromeOmniboxExtension on Chrome {
  ChromeOmnibox get omnibox => _omnibox;
}

class ChromeOmnibox {
  ChromeOmnibox._();
}

/// The style type.
enum DescriptionStyleType {
  url('url'),
  match('match'),
  dim('dim');

  const DescriptionStyleType(this.value);

  final String value;
}

/// The window disposition for the omnibox query. This is the recommended
/// context to display results. For example, if the omnibox command is to
/// navigate to a certain URL, a disposition of 'newForegroundTab' means the
/// navigation should take place in a new selected tab.
enum OnInputEnteredDisposition {
  currentTab('currentTab'),
  newForegroundTab('newForegroundTab'),
  newBackgroundTab('newBackgroundTab');

  const OnInputEnteredDisposition(this.value);

  final String value;
}
