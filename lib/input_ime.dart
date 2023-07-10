import 'chrome.dart';
export 'chrome.dart';

final _inputIme = ChromeInputIme._();

extension ChromeInputImeExtension on Chrome {
  ChromeInputIme get inputIme => _inputIme;
}

class ChromeInputIme {
  ChromeInputIme._();

  /// Set the current composition. If this extension does not own the active
  /// IME, this fails.
  void setComposition(parameters) => throw UnimplementedError();

  /// Clear the current composition. If this extension does not own the active
  /// IME, this fails.
  void clearComposition(parameters) => throw UnimplementedError();

  /// Commits the provided text to the current input.
  void commitText(parameters) => throw UnimplementedError();

  /// Sends the key events.  This function is expected to be used by virtual
  /// keyboards.  When key(s) on a virtual keyboard is pressed by a user, this
  /// function is used to propagate that event to the system.
  void sendKeyEvents(parameters) => throw UnimplementedError();

  /// Hides the input view window, which is popped up automatically by system.
  /// If the input view window is already hidden, this function will do nothing.
  void hideInputView() => throw UnimplementedError();

  /// Sets the properties of the candidate window. This fails if the extension
  /// doesn't own the active IME
  void setCandidateWindowProperties(parameters) => throw UnimplementedError();

  /// Sets the current candidate list. This fails if this extension doesn't own
  /// the active IME
  void setCandidates(parameters) => throw UnimplementedError();

  /// Set the position of the cursor in the candidate window. This is a no-op if
  /// this extension does not own the active IME.
  void setCursorPosition(parameters) => throw UnimplementedError();

  /// Shows/Hides an assistive window with the given properties.
  void setAssistiveWindowProperties(parameters) => throw UnimplementedError();

  /// Highlights/Unhighlights a button in an assistive window.
  void setAssistiveWindowButtonHighlighted(parameters) =>
      throw UnimplementedError();

  /// Adds the provided menu items to the language menu when this IME is active.
  void setMenuItems(parameters) => throw UnimplementedError();

  /// Updates the state of the MenuItems specified
  void updateMenuItems(parameters) => throw UnimplementedError();

  /// Deletes the text around the caret.
  void deleteSurroundingText(parameters) => throw UnimplementedError();

  /// Indicates that the key event received by onKeyEvent is handled.  This
  /// should only be called if the onKeyEvent listener is asynchronous.
  void keyEventHandled(
    requestId,
    response,
  ) =>
      throw UnimplementedError();

  /// This event is sent when an IME is activated. It signals that the IME will
  /// be receiving onKeyPress events.
  Stream get onActivate => throw UnimplementedError();

  /// This event is sent when an IME is deactivated. It signals that the IME
  /// will no longer be receiving onKeyPress events.
  Stream get onDeactivated => throw UnimplementedError();

  /// This event is sent when focus enters a text box. It is sent to all
  /// extensions that are listening to this event, and enabled by the user.
  Stream get onFocus => throw UnimplementedError();

  /// This event is sent when focus leaves a text box. It is sent to all
  /// extensions that are listening to this event, and enabled by the user.
  Stream get onBlur => throw UnimplementedError();

  /// This event is sent when the properties of the current InputContext change,
  /// such as the the type. It is sent to all extensions that are listening to
  /// this event, and enabled by the user.
  Stream get onInputContextUpdate => throw UnimplementedError();

  /// Fired when a key event is sent from the operating system. The event will
  /// be sent to the extension if this extension owns the active IME. The
  /// listener function should return true if the event was handled false if it
  /// was not.  If the event will be evaluated asynchronously, this function
  /// must return undefined and the IME must later call keyEventHandled() with
  /// the result.
  Stream get onKeyEvent => throw UnimplementedError();

  /// This event is sent if this extension owns the active IME.
  Stream get onCandidateClicked => throw UnimplementedError();

  /// Called when the user selects a menu item
  Stream get onMenuItemActivated => throw UnimplementedError();

  /// Called when the editable string around caret is changed or when the caret
  /// position is moved. The text length is limited to 100 characters for each
  /// back and forth direction.
  Stream get onSurroundingTextChanged => throw UnimplementedError();

  /// This event is sent when chrome terminates ongoing text input session.
  Stream get onReset => throw UnimplementedError();

  /// This event is sent when a button in an assistive window is clicked.
  Stream get onAssistiveWindowButtonClicked => throw UnimplementedError();
}

enum KeyboardEventType {
  keyup('keyup'),
  keydown('keydown');

  const KeyboardEventType(this.value);

  final String value;
}

/// Type of value this text field edits, (Text, Number, URL, etc)
enum InputContextType {
  text('text'),
  search('search'),
  tel('tel'),
  url('url'),
  email('email'),
  number('number'),
  password('password'),
  null$('null');

  const InputContextType(this.value);

  final String value;
}

/// The auto-capitalize type of the text field.
enum AutoCapitalizeType {
  characters('characters'),
  words('words'),
  sentences('sentences');

  const AutoCapitalizeType(this.value);

  final String value;
}

/// The type of menu item. Radio buttons between separators are considered
/// grouped.
enum MenuItemStyle {
  check('check'),
  radio('radio'),
  separator('separator');

  const MenuItemStyle(this.value);

  final String value;
}

/// The type of the underline to modify this segment.
enum UnderlineStyle {
  underline('underline'),
  doubleUnderline('doubleUnderline'),
  noUnderline('noUnderline');

  const UnderlineStyle(this.value);

  final String value;
}

/// Where to display the candidate window. If set to 'cursor', the window
/// follows the cursor. If set to 'composition', the window is locked to the
/// beginning of the composition.
enum WindowPosition {
  cursor('cursor'),
  composition('composition');

  const WindowPosition(this.value);

  final String value;
}

/// The screen type under which the IME is activated.
enum ScreenType {
  normal('normal'),
  login('login'),
  lock('lock'),
  secondaryLogin('secondary-login');

  const ScreenType(this.value);

  final String value;
}

/// Which mouse buttons was clicked.
enum MouseButton {
  left('left'),
  middle('middle'),
  right('right');

  const MouseButton(this.value);

  final String value;
}

/// Type of assistive window.
enum AssistiveWindowType {
  undo('undo');

  const AssistiveWindowType(this.value);

  final String value;
}

/// ID of buttons in assistive window.
enum AssistiveWindowButton {
  undo('undo'),
  addToDictionary('addToDictionary');

  const AssistiveWindowButton(this.value);

  final String value;
}
