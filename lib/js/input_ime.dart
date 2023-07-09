import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSInputImeExtension on JSChrome {
  /// Use the `chrome.input.ime` API to implement a custom IME for Chrome OS.
  /// This allows your extension to handle keystrokes, set the composition, and
  /// manage the candidate window.
  external JSInputIme get InputIme;
}

@JS()
@staticInterop
class JSInputIme {}

extension JSInputImeExtension on JSInputIme {
  /// Set the current composition. If this extension does not own the active
  /// IME, this fails.
  external void setComposition();

  /// Clear the current composition. If this extension does not own the active
  /// IME, this fails.
  external void clearComposition();

  /// Commits the provided text to the current input.
  external void commitText();

  /// Sends the key events.  This function is expected to be used by virtual
  /// keyboards.  When key(s) on a virtual keyboard is pressed by a user, this
  /// function is used to propagate that event to the system.
  external void sendKeyEvents();

  /// Hides the input view window, which is popped up automatically by system.
  /// If the input view window is already hidden, this function will do nothing.
  external void hideInputView();

  /// Sets the properties of the candidate window. This fails if the extension
  /// doesn't own the active IME
  external void setCandidateWindowProperties();

  /// Sets the current candidate list. This fails if this extension doesn't own
  /// the active IME
  external void setCandidates();

  /// Set the position of the cursor in the candidate window. This is a no-op if
  /// this extension does not own the active IME.
  external void setCursorPosition();

  /// Shows/Hides an assistive window with the given properties.
  external void setAssistiveWindowProperties();

  /// Highlights/Unhighlights a button in an assistive window.
  external void setAssistiveWindowButtonHighlighted();

  /// Adds the provided menu items to the language menu when this IME is active.
  external void setMenuItems();

  /// Updates the state of the MenuItems specified
  external void updateMenuItems();

  /// Deletes the text around the caret.
  external void deleteSurroundingText();

  /// Indicates that the key event received by onKeyEvent is handled.  This
  /// should only be called if the onKeyEvent listener is asynchronous.
  external void keyEventHandled();

  /// This event is sent when an IME is activated. It signals that the IME will
  /// be receiving onKeyPress events.
  external ChromeEvent get onActivate;

  /// This event is sent when an IME is deactivated. It signals that the IME
  /// will no longer be receiving onKeyPress events.
  external ChromeEvent get onDeactivated;

  /// This event is sent when focus enters a text box. It is sent to all
  /// extensions that are listening to this event, and enabled by the user.
  external ChromeEvent get onFocus;

  /// This event is sent when focus leaves a text box. It is sent to all
  /// extensions that are listening to this event, and enabled by the user.
  external ChromeEvent get onBlur;

  /// This event is sent when the properties of the current InputContext change,
  /// such as the the type. It is sent to all extensions that are listening to
  /// this event, and enabled by the user.
  external ChromeEvent get onInputContextUpdate;

  /// Fired when a key event is sent from the operating system. The event will
  /// be sent to the extension if this extension owns the active IME. The
  /// listener function should return true if the event was handled false if it
  /// was not.  If the event will be evaluated asynchronously, this function
  /// must return undefined and the IME must later call keyEventHandled() with
  /// the result.
  external ChromeEvent get onKeyEvent;

  /// This event is sent if this extension owns the active IME.
  external ChromeEvent get onCandidateClicked;

  /// Called when the user selects a menu item
  external ChromeEvent get onMenuItemActivated;

  /// Called when the editable string around caret is changed or when the caret
  /// position is moved. The text length is limited to 100 characters for each
  /// back and forth direction.
  external ChromeEvent get onSurroundingTextChanged;

  /// This event is sent when chrome terminates ongoing text input session.
  external ChromeEvent get onReset;

  /// This event is sent when a button in an assistive window is clicked.
  external ChromeEvent get onAssistiveWindowButtonClicked;
}
