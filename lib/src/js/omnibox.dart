import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSOmniboxExtension on JSChrome {
  /// The omnibox API allows you to register a keyword with Google Chrome's
  /// address bar, which is also known as the omnibox.
  external JSOmnibox get omnibox;
}

@JS()
@staticInterop
class JSOmnibox {}

extension JSOmniboxExtension on JSOmnibox {
  /// A callback passed to the onInputChanged event used for sending suggestions
  /// back to the browser.
  external void sendSuggestions(
    JSNumber requestId,
    JSArray suggestResults,
  );

  /// Sets the description and styling for the default suggestion. The default
  /// suggestion is the text that is displayed in the first suggestion row
  /// underneath the URL bar.
  external JSPromise setDefaultSuggestion(DefaultSuggestResult suggestion);

  /// User has started a keyword input session by typing the extension's
  /// keyword. This is guaranteed to be sent exactly once per input session, and
  /// before any onInputChanged events.
  external ChromeEvent get onInputStarted;

  /// User has changed what is typed into the omnibox.
  external ChromeEvent get onInputChanged;

  /// User has accepted what is typed into the omnibox.
  external ChromeEvent get onInputEntered;

  /// User has ended the keyword input session without accepting the input.
  external ChromeEvent get onInputCancelled;

  /// User has deleted a suggested result.
  external ChromeEvent get onDeleteSuggestion;
}

/// The style type.
typedef DescriptionStyleType = JSString;

/// The window disposition for the omnibox query. This is the recommended
/// context to display results. For example, if the omnibox command is to
/// navigate to a certain URL, a disposition of 'newForegroundTab' means the
/// navigation should take place in a new selected tab.
typedef OnInputEnteredDisposition = JSString;

@JS()
@staticInterop
class MatchClassification {}

extension MatchClassificationExtension on MatchClassification {
  external JSNumber get offset;

  /// The style type
  external DescriptionStyleType get type;

  external JSNumber? get length;
}

@JS()
@staticInterop
class SuggestResult {}

extension SuggestResultExtension on SuggestResult {
  /// The text that is put into the URL bar, and that is sent to the extension
  /// when the user chooses this entry.
  external JSString get content;

  /// The text that is displayed in the URL dropdown. Can contain XML-style
  /// markup for styling. The supported tags are 'url' (for a literal URL),
  /// 'match' (for highlighting text that matched what the user's query), and
  /// 'dim' (for dim helper text). The styles can be nested, eg.
  /// <dim><match>dimmed match</match></dim>. You must escape the five
  /// predefined entities to display them as text:
  /// stackoverflow.com/a/1091953/89484
  external JSString get description;

  /// Whether the suggest result can be deleted by the user.
  external JSBoolean? get deletable;

  /// An array of style ranges for the description, as provided by the
  /// extension.
  external JSArray? get descriptionStyles;
}

@JS()
@staticInterop
class DefaultSuggestResult {}

extension DefaultSuggestResultExtension on DefaultSuggestResult {
  /// The text that is displayed in the URL dropdown. Can contain XML-style
  /// markup for styling. The supported tags are 'url' (for a literal URL),
  /// 'match' (for highlighting text that matched what the user's query), and
  /// 'dim' (for dim helper text). The styles can be nested, eg.
  /// <dim><match>dimmed match</match></dim>.
  external JSString get description;

  /// An array of style ranges for the description, as provided by the
  /// extension.
  external JSArray? get descriptionStyles;
}
