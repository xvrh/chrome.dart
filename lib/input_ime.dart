import 'chrome.dart';
export 'chrome.dart';

final _inputIme = ChromeInputIme._();

extension ChromeChromeInputImeExtension on Chrome {
  ChromeInputIme get inputIme => _inputIme;
}

class ChromeInputIme {
  ChromeInputIme._();
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
