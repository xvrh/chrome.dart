import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSOmniboxExtension on JSChrome {
  /// The omnibox API allows you to register a keyword with Google Chrome's
  /// address bar, which is also known as the omnibox.
  external JSOmnibox get Omnibox;
}

@JS()
@staticInterop
class JSOmnibox {}

extension JSOmniboxExtension on JSOmnibox {
  /// A callback passed to the onInputChanged event used for sending suggestions
  /// back to the browser.
  external void sendSuggestions();

  /// Sets the description and styling for the default suggestion. The default
  /// suggestion is the text that is displayed in the first suggestion row
  /// underneath the URL bar.
  external void setDefaultSuggestion();

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
