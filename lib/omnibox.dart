import 'chrome.dart';
export 'chrome.dart';

final _omnibox = ChromeOmnibox._();

extension ChromeOmniboxExtension on Chrome {
  ChromeOmnibox get omnibox => _omnibox;
}

class ChromeOmnibox {
  ChromeOmnibox._();

  /// A callback passed to the onInputChanged event used for sending suggestions
  /// back to the browser.
  void sendSuggestions(
    requestId,
    suggestResults,
  ) =>
      throw UnimplementedError();

  /// Sets the description and styling for the default suggestion. The default
  /// suggestion is the text that is displayed in the first suggestion row
  /// underneath the URL bar.
  void setDefaultSuggestion(suggestion) => throw UnimplementedError();

  /// User has started a keyword input session by typing the extension's
  /// keyword. This is guaranteed to be sent exactly once per input session, and
  /// before any onInputChanged events.
  Stream get onInputStarted => throw UnimplementedError();

  /// User has changed what is typed into the omnibox.
  Stream get onInputChanged => throw UnimplementedError();

  /// User has accepted what is typed into the omnibox.
  Stream get onInputEntered => throw UnimplementedError();

  /// User has ended the keyword input session without accepting the input.
  Stream get onInputCancelled => throw UnimplementedError();

  /// User has deleted a suggested result.
  Stream get onDeleteSuggestion => throw UnimplementedError();
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
