import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSInputImeExtension on JSChrome {
  /// Use the `chrome.input.ime` API to implement a custom IME for Chrome OS.
  /// This allows your extension to handle keystrokes, set the composition, and
  /// manage the candidate window.
  external JSInputIme get inputIme;
}

@JS()
@staticInterop
class JSInputIme {}

extension JSInputImeExtension on JSInputIme {
  /// Set the current composition. If this extension does not own the active
  /// IME, this fails.
  external void setComposition(parameters);

  /// Clear the current composition. If this extension does not own the active
  /// IME, this fails.
  external void clearComposition(parameters);

  /// Commits the provided text to the current input.
  external void commitText(parameters);

  /// Sends the key events.  This function is expected to be used by virtual
  /// keyboards.  When key(s) on a virtual keyboard is pressed by a user, this
  /// function is used to propagate that event to the system.
  external void sendKeyEvents(parameters);

  /// Hides the input view window, which is popped up automatically by system.
  /// If the input view window is already hidden, this function will do nothing.
  external void hideInputView();

  /// Sets the properties of the candidate window. This fails if the extension
  /// doesn't own the active IME
  external void setCandidateWindowProperties(parameters);

  /// Sets the current candidate list. This fails if this extension doesn't own
  /// the active IME
  external void setCandidates(parameters);

  /// Set the position of the cursor in the candidate window. This is a no-op if
  /// this extension does not own the active IME.
  external void setCursorPosition(parameters);

  /// Shows/Hides an assistive window with the given properties.
  external void setAssistiveWindowProperties(parameters);

  /// Highlights/Unhighlights a button in an assistive window.
  external void setAssistiveWindowButtonHighlighted(parameters);

  /// Adds the provided menu items to the language menu when this IME is active.
  external void setMenuItems(parameters);

  /// Updates the state of the MenuItems specified
  external void updateMenuItems(parameters);

  /// Deletes the text around the caret.
  external void deleteSurroundingText(parameters);

  /// Indicates that the key event received by onKeyEvent is handled.  This
  /// should only be called if the onKeyEvent listener is asynchronous.
  external void keyEventHandled(
    requestId,
    response,
  );

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

typedef KeyboardEventType = JSString;

/// Type of value this text field edits, (Text, Number, URL, etc)
typedef InputContextType = JSString;

/// The auto-capitalize type of the text field.
typedef AutoCapitalizeType = JSString;

/// The type of menu item. Radio buttons between separators are considered
/// grouped.
typedef MenuItemStyle = JSString;

/// The type of the underline to modify this segment.
typedef UnderlineStyle = JSString;

/// Where to display the candidate window. If set to 'cursor', the window
/// follows the cursor. If set to 'composition', the window is locked to the
/// beginning of the composition.
typedef WindowPosition = JSString;

/// The screen type under which the IME is activated.
typedef ScreenType = JSString;

/// Which mouse buttons was clicked.
typedef MouseButton = JSString;

/// Type of assistive window.
typedef AssistiveWindowType = JSString;

/// ID of buttons in assistive window.
typedef AssistiveWindowButton = JSString;

@JS()
@staticInterop
class KeyboardEvent {
  /// One of keyup or keydown.
  external JSAny get type;

  /// (Deprecated) The ID of the request. Use the `requestId` param from the
  /// `onKeyEvent` event instead.
  external JSAny? get requestId;

  /// The extension ID of the sender of this keyevent.
  external JSAny? get extensionId;

  /// Value of the key being pressed
  external JSAny get key;

  /// Value of the physical key being pressed. The value is not affected by
  /// current keyboard layout or modifier state.
  external JSAny get code;

  /// The deprecated HTML keyCode, which is system- and implementation-dependent
  /// numerical code signifying the unmodified identifier associated with the
  /// key pressed.
  external JSAny? get keyCode;

  /// Whether or not the ALT key is pressed.
  external JSAny? get altKey;

  /// Whether or not the ALTGR key is pressed.
  external JSAny? get altgrKey;

  /// Whether or not the CTRL key is pressed.
  external JSAny? get ctrlKey;

  /// Whether or not the SHIFT key is pressed.
  external JSAny? get shiftKey;

  /// Whether or not the CAPS_LOCK is enabled.
  external JSAny? get capsLock;
}

@JS()
@staticInterop
class InputContext {
  /// This is used to specify targets of text field operations.  This ID becomes
  /// invalid as soon as onBlur is called.
  external JSAny get contextID;

  /// Type of value this text field edits, (Text, Number, URL, etc)
  external JSAny get type;

  /// Whether the text field wants auto-correct.
  external JSAny get autoCorrect;

  /// Whether the text field wants auto-complete.
  external JSAny get autoComplete;

  /// The auto-capitalize type of the text field.
  external JSAny get autoCapitalize;

  /// Whether the text field wants spell-check.
  external JSAny get spellCheck;

  /// Whether text entered into the text field should be used to improve typing
  /// suggestions for the user.
  external JSAny get shouldDoLearning;
}

@JS()
@staticInterop
class MenuItem {
  /// String that will be passed to callbacks referencing this MenuItem.
  external JSAny get id;

  /// Text displayed in the menu for this item.
  external JSAny? get label;

  /// The type of menu item.
  external JSAny? get style;

  /// Indicates this item is visible.
  external JSAny? get visible;

  /// Indicates this item should be drawn with a check.
  external JSAny? get checked;

  /// Indicates this item is enabled.
  external JSAny? get enabled;
}

@JS()
@staticInterop
class AssistiveWindowProperties {
  external JSAny get type;

  /// Sets true to show AssistiveWindow, sets false to hide.
  external JSAny get visible;

  /// Strings for ChromeVox to announce.
  external JSAny? get announceString;
}

@JS()
@staticInterop
class MenuParameters {
  /// ID of the engine to use.
  external JSAny get engineID;

  /// MenuItems to add or update. They will be added in the order they exist in
  /// the array.
  external JSArray get items;
}
