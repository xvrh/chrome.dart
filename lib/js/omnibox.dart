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
    requestId,
    suggestResults,
  );

  /// Sets the description and styling for the default suggestion. The default
  /// suggestion is the text that is displayed in the first suggestion row
  /// underneath the URL bar.
  external void setDefaultSuggestion(suggestion);

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

@JS()
@staticInterop
class DescriptionStyleType {}

@JS()
@staticInterop
class OnInputEnteredDisposition {}

@JS()
@staticInterop
class MatchClassification {
  external JSAny get offset;

  /// The style type
  external JSAny get type;

  external JSAny? get length;
}

@JS()
@staticInterop
class SuggestResult {
  /// The text that is put into the URL bar, and that is sent to the extension
  /// when the user chooses this entry.
  external JSAny get content;

  /// The text that is displayed in the URL dropdown. Can contain XML-style
  /// markup for styling. The supported tags are 'url' (for a literal URL),
  /// 'match' (for highlighting text that matched what the user's query), and
  /// 'dim' (for dim helper text). The styles can be nested, eg.
  /// <dim><match>dimmed match</match></dim>. You must escape the five
  /// predefined entities to display them as text:
  /// stackoverflow.com/a/1091953/89484
  external JSAny get description;

  /// Whether the suggest result can be deleted by the user.
  external JSAny? get deletable;

  /// An array of style ranges for the description, as provided by the
  /// extension.
  external JSArray? get descriptionStyles;
}

@JS()
@staticInterop
class DefaultSuggestResult {
  /// The text that is displayed in the URL dropdown. Can contain XML-style
  /// markup for styling. The supported tags are 'url' (for a literal URL),
  /// 'match' (for highlighting text that matched what the user's query), and
  /// 'dim' (for dim helper text). The styles can be nested, eg.
  /// <dim><match>dimmed match</match></dim>.
  external JSAny get description;

  /// An array of style ranges for the description, as provided by the
  /// extension.
  external JSArray? get descriptionStyles;
}
