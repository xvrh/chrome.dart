/* This file has been generated - do not edit */

library chrome.input;

import '../src/common.dart';

final ChromeInput input = new ChromeInput._();

class ChromeInput {
  ChromeInput._();

  /**
   * Accessor for the `chrome.input.ime` namespace.
   */
  final ChromeInputIme ime = ChromeInputIme._();
}

/**
 * Use the `chrome.input.ime` API to implement a custom IME for Chrome OS. This
 * allows your extension to handle keystrokes, set the composition, and manage
 * the candidate window.
 */
class ChromeInputIme extends ChromeApi {
  JsObject get _input_ime => chrome['input']['ime'];

  /**
   * This event is sent when an IME is activated. It signals that the IME will
   * be receiving onKeyPress events.
   */
  Stream<OnActivateEvent> get onActivate => _onActivate.stream;
  late ChromeStreamController<OnActivateEvent> _onActivate;

  /**
   * This event is sent when an IME is deactivated. It signals that the IME will
   * no longer be receiving onKeyPress events.
   */
  Stream<String> get onDeactivated => _onDeactivated.stream;
  late ChromeStreamController<String> _onDeactivated;

  /**
   * This event is sent when focus enters a text box. It is sent to all
   * extensions that are listening to this event, and enabled by the user.
   */
  Stream<InputContext> get onFocus => _onFocus.stream;
  late ChromeStreamController<InputContext> _onFocus;

  /**
   * This event is sent when focus leaves a text box. It is sent to all
   * extensions that are listening to this event, and enabled by the user.
   */
  Stream<int> get onBlur => _onBlur.stream;
  late ChromeStreamController<int> _onBlur;

  /**
   * This event is sent when the properties of the current InputContext change,
   * such as the the type. It is sent to all extensions that are listening to
   * this event, and enabled by the user.
   */
  Stream<InputContext> get onInputContextUpdate => _onInputContextUpdate.stream;
  late ChromeStreamController<InputContext> _onInputContextUpdate;

  /**
   * Fired when a key event is sent from the operating system. The event will be
   * sent to the extension if this extension owns the active IME. The listener
   * function should return true if the event was handled false if it was not.
   * If the event will be evaluated asynchronously, this function must return
   * undefined and the IME must later call keyEventHandled() with the result.
   */
  Stream<OnKeyEventEvent> get onKeyEvent => _onKeyEvent.stream;
  late ChromeStreamController<OnKeyEventEvent> _onKeyEvent;

  /**
   * This event is sent if this extension owns the active IME.
   */
  Stream<OnCandidateClickedEvent> get onCandidateClicked => _onCandidateClicked.stream;
  late ChromeStreamController<OnCandidateClickedEvent> _onCandidateClicked;

  /**
   * Called when the user selects a menu item
   */
  Stream<OnMenuItemActivatedEvent> get onMenuItemActivated => _onMenuItemActivated.stream;
  late ChromeStreamController<OnMenuItemActivatedEvent> _onMenuItemActivated;

  /**
   * Called when the editable string around caret is changed or when the caret
   * position is moved. The text length is limited to 100 characters for each
   * back and forth direction.
   */
  Stream<OnSurroundingTextChangedEvent> get onSurroundingTextChanged => _onSurroundingTextChanged.stream;
  late ChromeStreamController<OnSurroundingTextChangedEvent> _onSurroundingTextChanged;

  /**
   * This event is sent when chrome terminates ongoing text input session.
   */
  Stream<String> get onReset => _onReset.stream;
  late ChromeStreamController<String> _onReset;

  /**
   * This event is sent when a button in an assistive window is clicked.
   */
  Stream<Map> get onAssistiveWindowButtonClicked => _onAssistiveWindowButtonClicked.stream;
  late ChromeStreamController<Map> _onAssistiveWindowButtonClicked;

  ChromeInputIme._() {
    var getApi = () => _input_ime;
    _onActivate = ChromeStreamController<OnActivateEvent>.twoArgs(getApi, 'onActivate', _createOnActivateEvent);
    _onDeactivated = ChromeStreamController<String>.oneArg(getApi, 'onDeactivated', selfConverter);
    _onFocus = ChromeStreamController<InputContext>.oneArg(getApi, 'onFocus', _createInputContext);
    _onBlur = ChromeStreamController<int>.oneArg(getApi, 'onBlur', selfConverter);
    _onInputContextUpdate = ChromeStreamController<InputContext>.oneArg(getApi, 'onInputContextUpdate', _createInputContext);
    _onKeyEvent = ChromeStreamController<OnKeyEventEvent>.threeArgs(getApi, 'onKeyEvent', _createOnKeyEventEvent);
    _onCandidateClicked = ChromeStreamController<OnCandidateClickedEvent>.threeArgs(getApi, 'onCandidateClicked', _createOnCandidateClickedEvent);
    _onMenuItemActivated = ChromeStreamController<OnMenuItemActivatedEvent>.twoArgs(getApi, 'onMenuItemActivated', _createOnMenuItemActivatedEvent);
    _onSurroundingTextChanged = ChromeStreamController<OnSurroundingTextChangedEvent>.twoArgs(getApi, 'onSurroundingTextChanged', _createOnSurroundingTextChangedEvent);
    _onReset = ChromeStreamController<String>.oneArg(getApi, 'onReset', selfConverter);
    _onAssistiveWindowButtonClicked = ChromeStreamController<Map>.oneArg(getApi, 'onAssistiveWindowButtonClicked', mapify);
  }

  bool get available => _input_ime != null;

  /**
   * Set the current composition. If this extension does not own the active IME,
   * this fails.
   */
  void setComposition(InputImeSetCompositionParams parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('setComposition', [jsify(parameters)]);
  }

  /**
   * Clear the current composition. If this extension does not own the active
   * IME, this fails.
   */
  void clearComposition(InputImeClearCompositionParams parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('clearComposition', [jsify(parameters)]);
  }

  /**
   * Commits the provided text to the current input.
   */
  void commitText(InputImeCommitTextParams parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('commitText', [jsify(parameters)]);
  }

  /**
   * Sends the key events.  This function is expected to be used by virtual
   * keyboards.  When key(s) on a virtual keyboard is pressed by a user, this
   * function is used to propagate that event to the system.
   */
  void sendKeyEvents(InputImeSendKeyEventsParams parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('sendKeyEvents', [jsify(parameters)]);
  }

  /**
   * Hides the input view window, which is popped up automatically by system. If
   * the input view window is already hidden, this function will do nothing.
   */
  void hideInputView() {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('hideInputView');
  }

  /**
   * Sets the properties of the candidate window. This fails if the extension
   * doesn't own the active IME
   */
  void setCandidateWindowProperties(InputImeSetCandidateWindowPropertiesParams parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('setCandidateWindowProperties', [jsify(parameters)]);
  }

  /**
   * Sets the current candidate list. This fails if this extension doesn't own
   * the active IME
   */
  void setCandidates(InputImeSetCandidatesParams parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('setCandidates', [jsify(parameters)]);
  }

  /**
   * Set the position of the cursor in the candidate window. This is a no-op if
   * this extension does not own the active IME.
   */
  void setCursorPosition(InputImeSetCursorPositionParams parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('setCursorPosition', [jsify(parameters)]);
  }

  /**
   * Shows/Hides an assistive window with the given properties.
   */
  void setAssistiveWindowProperties(InputImeSetAssistiveWindowPropertiesParams parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('setAssistiveWindowProperties', [jsify(parameters)]);
  }

  /**
   * Highlights/Unhighlights a button in an assistive window.
   */
  void setAssistiveWindowButtonHighlighted(InputImeSetAssistiveWindowButtonHighlightedParams parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('setAssistiveWindowButtonHighlighted', [jsify(parameters)]);
  }

  /**
   * Adds the provided menu items to the language menu when this IME is active.
   */
  void setMenuItems(MenuParameters parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('setMenuItems', [jsify(parameters)]);
  }

  /**
   * Updates the state of the MenuItems specified
   */
  void updateMenuItems(MenuParameters parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('updateMenuItems', [jsify(parameters)]);
  }

  /**
   * Deletes the text around the caret.
   */
  void deleteSurroundingText(InputImeDeleteSurroundingTextParams parameters) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('deleteSurroundingText', [jsify(parameters)]);
  }

  /**
   * Indicates that the key event received by onKeyEvent is handled.  This
   * should only be called if the onKeyEvent listener is asynchronous.
   * 
   * [requestId] Request id of the event that was handled.  This should come
   * from keyEvent.requestId
   * 
   * [response] True if the keystroke was handled, false if not
   */
  void keyEventHandled(String requestId, bool response) {
    if (_input_ime == null) _throwNotAvailable();

    _input_ime.callMethod('keyEventHandled', [requestId, response]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.input.ime' is not available");
  }
}

/**
 * This event is sent when an IME is activated. It signals that the IME will be
 * receiving onKeyPress events.
 */
class OnActivateEvent {
  /**
   * ID of the engine receiving the event
   */
  final String engineID;

  /**
   * The screen type under which the IME is activated.
   */
  final ScreenType screen;

  OnActivateEvent(this.engineID, this.screen);
}

/**
 * Fired when a key event is sent from the operating system. The event will be
 * sent to the extension if this extension owns the active IME. The listener
 * function should return true if the event was handled false if it was not.  If
 * the event will be evaluated asynchronously, this function must return
 * undefined and the IME must later call keyEventHandled() with the result.
 */
class OnKeyEventEvent {
  /**
   * ID of the engine receiving the event
   */
  final String engineID;

  /**
   * Data on the key event
   */
  final KeyboardEvent keyData;

  /**
   * ID of the request. If the event listener returns undefined, then
   * `keyEventHandled` must be called later with this `requestId`.
   */
  final String requestId;

  OnKeyEventEvent(this.engineID, this.keyData, this.requestId);
}

/**
 * This event is sent if this extension owns the active IME.
 */
class OnCandidateClickedEvent {
  /**
   * ID of the engine receiving the event
   */
  final String engineID;

  /**
   * ID of the candidate that was clicked.
   */
  final int candidateID;

  /**
   * Which mouse buttons was clicked.
   */
  final MouseButton button;

  OnCandidateClickedEvent(this.engineID, this.candidateID, this.button);
}

/**
 * Called when the user selects a menu item
 */
class OnMenuItemActivatedEvent {
  /**
   * ID of the engine receiving the event
   */
  final String engineID;

  /**
   * Name of the MenuItem which was activated
   */
  final String name;

  OnMenuItemActivatedEvent(this.engineID, this.name);
}

/**
 * Called when the editable string around caret is changed or when the caret
 * position is moved. The text length is limited to 100 characters for each back
 * and forth direction.
 */
class OnSurroundingTextChangedEvent {
  /**
   * ID of the engine receiving the event
   */
  final String engineID;

  /**
   * The surrounding information.
   */
  final Map surroundingInfo;

  OnSurroundingTextChangedEvent(this.engineID, this.surroundingInfo);
}

class KeyboardEventType extends ChromeEnum {
  static const KeyboardEventType KEYUP = const KeyboardEventType._('keyup');
  static const KeyboardEventType KEYDOWN = const KeyboardEventType._('keydown');

  static const List<KeyboardEventType> VALUES = const[KEYUP, KEYDOWN];

  const KeyboardEventType._(String str): super(str);
}

/**
 * Type of value this text field edits, (Text, Number, URL, etc)
 */
class InputContextType extends ChromeEnum {
  static const InputContextType TEXT = const InputContextType._('text');
  static const InputContextType SEARCH = const InputContextType._('search');
  static const InputContextType TEL = const InputContextType._('tel');
  static const InputContextType URL = const InputContextType._('url');
  static const InputContextType EMAIL = const InputContextType._('email');
  static const InputContextType NUMBER = const InputContextType._('number');
  static const InputContextType PASSWORD = const InputContextType._('password');
  static const InputContextType NULL = const InputContextType._('null');

  static const List<InputContextType> VALUES = const[TEXT, SEARCH, TEL, URL, EMAIL, NUMBER, PASSWORD, NULL];

  const InputContextType._(String str): super(str);
}

/**
 * The auto-capitalize type of the text field.
 */
class AutoCapitalizeType extends ChromeEnum {
  static const AutoCapitalizeType CHARACTERS = const AutoCapitalizeType._('characters');
  static const AutoCapitalizeType WORDS = const AutoCapitalizeType._('words');
  static const AutoCapitalizeType SENTENCES = const AutoCapitalizeType._('sentences');

  static const List<AutoCapitalizeType> VALUES = const[CHARACTERS, WORDS, SENTENCES];

  const AutoCapitalizeType._(String str): super(str);
}

/**
 * The type of menu item. Radio buttons between separators are considered
 * grouped.
 */
class MenuItemStyle extends ChromeEnum {
  static const MenuItemStyle CHECK = const MenuItemStyle._('check');
  static const MenuItemStyle RADIO = const MenuItemStyle._('radio');
  static const MenuItemStyle SEPARATOR = const MenuItemStyle._('separator');

  static const List<MenuItemStyle> VALUES = const[CHECK, RADIO, SEPARATOR];

  const MenuItemStyle._(String str): super(str);
}

/**
 * The type of the underline to modify this segment.
 */
class UnderlineStyle extends ChromeEnum {
  static const UnderlineStyle UNDERLINE = const UnderlineStyle._('underline');
  static const UnderlineStyle DOUBLE_UNDERLINE = const UnderlineStyle._('doubleUnderline');
  static const UnderlineStyle NO_UNDERLINE = const UnderlineStyle._('noUnderline');

  static const List<UnderlineStyle> VALUES = const[UNDERLINE, DOUBLE_UNDERLINE, NO_UNDERLINE];

  const UnderlineStyle._(String str): super(str);
}

/**
 * Where to display the candidate window. If set to 'cursor', the window follows
 * the cursor. If set to 'composition', the window is locked to the beginning of
 * the composition.
 */
class WindowPosition extends ChromeEnum {
  static const WindowPosition CURSOR = const WindowPosition._('cursor');
  static const WindowPosition COMPOSITION = const WindowPosition._('composition');

  static const List<WindowPosition> VALUES = const[CURSOR, COMPOSITION];

  const WindowPosition._(String str): super(str);
}

/**
 * The screen type under which the IME is activated.
 */
class ScreenType extends ChromeEnum {
  static const ScreenType NORMAL = const ScreenType._('normal');
  static const ScreenType LOGIN = const ScreenType._('login');
  static const ScreenType LOCK = const ScreenType._('lock');
  static const ScreenType SECONDARY_LOGIN = const ScreenType._('secondary-login');

  static const List<ScreenType> VALUES = const[NORMAL, LOGIN, LOCK, SECONDARY_LOGIN];

  const ScreenType._(String str): super(str);
}

/**
 * Which mouse buttons was clicked.
 */
class MouseButton extends ChromeEnum {
  static const MouseButton LEFT = const MouseButton._('left');
  static const MouseButton MIDDLE = const MouseButton._('middle');
  static const MouseButton RIGHT = const MouseButton._('right');

  static const List<MouseButton> VALUES = const[LEFT, MIDDLE, RIGHT];

  const MouseButton._(String str): super(str);
}

/**
 * Type of assistive window.
 */
class AssistiveWindowType extends ChromeEnum {
  static const AssistiveWindowType UNDO = const AssistiveWindowType._('undo');

  static const List<AssistiveWindowType> VALUES = const[UNDO];

  const AssistiveWindowType._(String str): super(str);
}

/**
 * ID of buttons in assistive window.
 */
class AssistiveWindowButton extends ChromeEnum {
  static const AssistiveWindowButton UNDO = const AssistiveWindowButton._('undo');
  static const AssistiveWindowButton ADD_TO_DICTIONARY = const AssistiveWindowButton._('addToDictionary');

  static const List<AssistiveWindowButton> VALUES = const[UNDO, ADD_TO_DICTIONARY];

  const AssistiveWindowButton._(String str): super(str);
}

class PropertiesInputIme extends ChromeObject {
  PropertiesInputIme({bool? visible, bool? cursorVisible, bool? vertical, int? pageSize, String? auxiliaryText, bool? auxiliaryTextVisible, int? totalCandidates, int? currentCandidateIndex, WindowPosition? windowPosition}) {
    if (visible != null) this.visible = visible;
    if (cursorVisible != null) this.cursorVisible = cursorVisible;
    if (vertical != null) this.vertical = vertical;
    if (pageSize != null) this.pageSize = pageSize;
    if (auxiliaryText != null) this.auxiliaryText = auxiliaryText;
    if (auxiliaryTextVisible != null) this.auxiliaryTextVisible = auxiliaryTextVisible;
    if (totalCandidates != null) this.totalCandidates = totalCandidates;
    if (currentCandidateIndex != null) this.currentCandidateIndex = currentCandidateIndex;
    if (windowPosition != null) this.windowPosition = windowPosition;
  }
  PropertiesInputIme.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * True to show the Candidate window, false to hide it.
   */
  bool get visible => jsProxy['visible'];
  set visible(bool value) => jsProxy['visible'] = value;

  /**
   * True to show the cursor, false to hide it.
   */
  bool get cursorVisible => jsProxy['cursorVisible'];
  set cursorVisible(bool value) => jsProxy['cursorVisible'] = value;

  /**
   * True if the candidate window should be rendered vertical, false to make it
   * horizontal.
   */
  bool get vertical => jsProxy['vertical'];
  set vertical(bool value) => jsProxy['vertical'] = value;

  /**
   * The number of candidates to display per page.
   */
  int get pageSize => jsProxy['pageSize'];
  set pageSize(int value) => jsProxy['pageSize'] = value;

  /**
   * Text that is shown at the bottom of the candidate window.
   */
  String get auxiliaryText => jsProxy['auxiliaryText'];
  set auxiliaryText(String value) => jsProxy['auxiliaryText'] = value;

  /**
   * True to display the auxiliary text, false to hide it.
   */
  bool get auxiliaryTextVisible => jsProxy['auxiliaryTextVisible'];
  set auxiliaryTextVisible(bool value) => jsProxy['auxiliaryTextVisible'] = value;

  /**
   * The total number of candidates for the candidate window.
   */
  int get totalCandidates => jsProxy['totalCandidates'];
  set totalCandidates(int value) => jsProxy['totalCandidates'] = value;

  /**
   * The index of the current chosen candidate out of total candidates.
   */
  int get currentCandidateIndex => jsProxy['currentCandidateIndex'];
  set currentCandidateIndex(int value) => jsProxy['currentCandidateIndex'] = value;

  /**
   * Where to display the candidate window.
   */
  WindowPosition get windowPosition => _createWindowPosition(jsProxy['windowPosition']);
  set windowPosition(WindowPosition value) => jsProxy['windowPosition'] = jsify(value);
}

class UsageInputIme extends ChromeObject {
  UsageInputIme({String? title, String? body}) {
    if (title != null) this.title = title;
    if (body != null) this.body = body;
  }
  UsageInputIme.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The title string of details description.
   */
  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  /**
   * The body string of detail description.
   */
  String get body => jsProxy['body'];
  set body(String value) => jsProxy['body'] = value;
}

/**
 * See http://www.w3.org/TR/DOM-Level-3-Events/#events-KeyboardEvent
 */
class KeyboardEvent extends ChromeObject {
  KeyboardEvent({KeyboardEventType? type, String? requestId, String? extensionId, String? key, String? code, int? keyCode, bool? altKey, bool? altgrKey, bool? ctrlKey, bool? shiftKey, bool? capsLock}) {
    if (type != null) this.type = type;
    if (requestId != null) this.requestId = requestId;
    if (extensionId != null) this.extensionId = extensionId;
    if (key != null) this.key = key;
    if (code != null) this.code = code;
    if (keyCode != null) this.keyCode = keyCode;
    if (altKey != null) this.altKey = altKey;
    if (altgrKey != null) this.altgrKey = altgrKey;
    if (ctrlKey != null) this.ctrlKey = ctrlKey;
    if (shiftKey != null) this.shiftKey = shiftKey;
    if (capsLock != null) this.capsLock = capsLock;
  }
  KeyboardEvent.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * One of keyup or keydown.
   */
  KeyboardEventType get type => _createKeyboardEventType(jsProxy['type']);
  set type(KeyboardEventType value) => jsProxy['type'] = jsify(value);

  /**
   * (Deprecated) The ID of the request. Use the `requestId` param from the
   * `onKeyEvent` event instead.
   */
  String get requestId => jsProxy['requestId'];
  set requestId(String value) => jsProxy['requestId'] = value;

  /**
   * The extension ID of the sender of this keyevent.
   */
  String get extensionId => jsProxy['extensionId'];
  set extensionId(String value) => jsProxy['extensionId'] = value;

  /**
   * Value of the key being pressed
   */
  String get key => jsProxy['key'];
  set key(String value) => jsProxy['key'] = value;

  /**
   * Value of the physical key being pressed. The value is not affected by
   * current keyboard layout or modifier state.
   */
  String get code => jsProxy['code'];
  set code(String value) => jsProxy['code'] = value;

  /**
   * The deprecated HTML keyCode, which is system- and implementation-dependent
   * numerical code signifying the unmodified identifier associated with the key
   * pressed.
   */
  int get keyCode => jsProxy['keyCode'];
  set keyCode(int value) => jsProxy['keyCode'] = value;

  /**
   * Whether or not the ALT key is pressed.
   */
  bool get altKey => jsProxy['altKey'];
  set altKey(bool value) => jsProxy['altKey'] = value;

  /**
   * Whether or not the ALTGR key is pressed.
   */
  bool get altgrKey => jsProxy['altgrKey'];
  set altgrKey(bool value) => jsProxy['altgrKey'] = value;

  /**
   * Whether or not the CTRL key is pressed.
   */
  bool get ctrlKey => jsProxy['ctrlKey'];
  set ctrlKey(bool value) => jsProxy['ctrlKey'] = value;

  /**
   * Whether or not the SHIFT key is pressed.
   */
  bool get shiftKey => jsProxy['shiftKey'];
  set shiftKey(bool value) => jsProxy['shiftKey'] = value;

  /**
   * Whether or not the CAPS_LOCK is enabled.
   */
  bool get capsLock => jsProxy['capsLock'];
  set capsLock(bool value) => jsProxy['capsLock'] = value;
}

/**
 * Describes an input Context
 */
class InputContext extends ChromeObject {
  InputContext({int? contextID, InputContextType? type, bool? autoCorrect, bool? autoComplete, AutoCapitalizeType? autoCapitalize, bool? spellCheck, bool? shouldDoLearning}) {
    if (contextID != null) this.contextID = contextID;
    if (type != null) this.type = type;
    if (autoCorrect != null) this.autoCorrect = autoCorrect;
    if (autoComplete != null) this.autoComplete = autoComplete;
    if (autoCapitalize != null) this.autoCapitalize = autoCapitalize;
    if (spellCheck != null) this.spellCheck = spellCheck;
    if (shouldDoLearning != null) this.shouldDoLearning = shouldDoLearning;
  }
  InputContext.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * This is used to specify targets of text field operations.  This ID becomes
   * invalid as soon as onBlur is called.
   */
  int get contextID => jsProxy['contextID'];
  set contextID(int value) => jsProxy['contextID'] = value;

  /**
   * Type of value this text field edits, (Text, Number, URL, etc)
   */
  InputContextType get type => _createInputContextType(jsProxy['type']);
  set type(InputContextType value) => jsProxy['type'] = jsify(value);

  /**
   * Whether the text field wants auto-correct.
   */
  bool get autoCorrect => jsProxy['autoCorrect'];
  set autoCorrect(bool value) => jsProxy['autoCorrect'] = value;

  /**
   * Whether the text field wants auto-complete.
   */
  bool get autoComplete => jsProxy['autoComplete'];
  set autoComplete(bool value) => jsProxy['autoComplete'] = value;

  /**
   * The auto-capitalize type of the text field.
   */
  AutoCapitalizeType get autoCapitalize => _createAutoCapitalizeType(jsProxy['autoCapitalize']);
  set autoCapitalize(AutoCapitalizeType value) => jsProxy['autoCapitalize'] = jsify(value);

  /**
   * Whether the text field wants spell-check.
   */
  bool get spellCheck => jsProxy['spellCheck'];
  set spellCheck(bool value) => jsProxy['spellCheck'] = value;

  /**
   * Whether text entered into the text field should be used to improve typing
   * suggestions for the user.
   */
  bool get shouldDoLearning => jsProxy['shouldDoLearning'];
  set shouldDoLearning(bool value) => jsProxy['shouldDoLearning'] = value;
}

/**
 * A menu item used by an input method to interact with the user from the
 * language menu.
 */
class MenuItem extends ChromeObject {
  MenuItem({String? id, String? label, MenuItemStyle? style, bool? visible, bool? checked, bool? enabled}) {
    if (id != null) this.id = id;
    if (label != null) this.label = label;
    if (style != null) this.style = style;
    if (visible != null) this.visible = visible;
    if (checked != null) this.checked = checked;
    if (enabled != null) this.enabled = enabled;
  }
  MenuItem.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * String that will be passed to callbacks referencing this MenuItem.
   */
  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  /**
   * Text displayed in the menu for this item.
   */
  String get label => jsProxy['label'];
  set label(String value) => jsProxy['label'] = value;

  /**
   * The type of menu item.
   */
  MenuItemStyle get style => _createMenuItemStyle(jsProxy['style']);
  set style(MenuItemStyle value) => jsProxy['style'] = jsify(value);

  /**
   * Indicates this item is visible.
   */
  bool get visible => jsProxy['visible'];
  set visible(bool value) => jsProxy['visible'] = value;

  /**
   * Indicates this item should be drawn with a check.
   */
  bool get checked => jsProxy['checked'];
  set checked(bool value) => jsProxy['checked'] = value;

  /**
   * Indicates this item is enabled.
   */
  bool get enabled => jsProxy['enabled'];
  set enabled(bool value) => jsProxy['enabled'] = value;
}

/**
 * Properties of the assistive window.
 */
class AssistiveWindowProperties extends ChromeObject {
  AssistiveWindowProperties({AssistiveWindowType? type, bool? visible, String? announceString}) {
    if (type != null) this.type = type;
    if (visible != null) this.visible = visible;
    if (announceString != null) this.announceString = announceString;
  }
  AssistiveWindowProperties.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  AssistiveWindowType get type => _createAssistiveWindowType(jsProxy['type']);
  set type(AssistiveWindowType value) => jsProxy['type'] = jsify(value);

  /**
   * Sets true to show AssistiveWindow, sets false to hide.
   */
  bool get visible => jsProxy['visible'];
  set visible(bool value) => jsProxy['visible'] = value;

  /**
   * Strings for ChromeVox to announce.
   */
  String get announceString => jsProxy['announceString'];
  set announceString(String value) => jsProxy['announceString'] = value;
}

class MenuParameters extends ChromeObject {
  MenuParameters({String? engineID, List<MenuItem>? items}) {
    if (engineID != null) this.engineID = engineID;
    if (items != null) this.items = items;
  }
  MenuParameters.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the engine to use.
   */
  String get engineID => jsProxy['engineID'];
  set engineID(String value) => jsProxy['engineID'] = value;

  /**
   * MenuItems to add or update. They will be added in the order they exist in
   * the array.
   */
  List<MenuItem> get items => listify(jsProxy['items'], _createMenuItem);
  set items(List<MenuItem> value) => jsProxy['items'] = jsify(value);
}

class InputImeSetCompositionParams extends ChromeObject {
  InputImeSetCompositionParams({int? contextID, String? text, int? selectionStart, int? selectionEnd, int? cursor, List<Map>? segments}) {
    if (contextID != null) this.contextID = contextID;
    if (text != null) this.text = text;
    if (selectionStart != null) this.selectionStart = selectionStart;
    if (selectionEnd != null) this.selectionEnd = selectionEnd;
    if (cursor != null) this.cursor = cursor;
    if (segments != null) this.segments = segments;
  }
  InputImeSetCompositionParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the context where the composition text will be set
   */
  int get contextID => jsProxy['contextID'];
  set contextID(int value) => jsProxy['contextID'] = value;

  /**
   * Text to set
   */
  String get text => jsProxy['text'];
  set text(String value) => jsProxy['text'] = value;

  /**
   * Position in the text that the selection starts at.
   */
  int get selectionStart => jsProxy['selectionStart'];
  set selectionStart(int value) => jsProxy['selectionStart'] = value;

  /**
   * Position in the text that the selection ends at.
   */
  int get selectionEnd => jsProxy['selectionEnd'];
  set selectionEnd(int value) => jsProxy['selectionEnd'] = value;

  /**
   * Position in the text of the cursor.
   */
  int get cursor => jsProxy['cursor'];
  set cursor(int value) => jsProxy['cursor'] = value;

  /**
   * List of segments and their associated types.
   */
  List<Map> get segments => listify(jsProxy['segments'], mapify);
  set segments(List<Map> value) => jsProxy['segments'] = jsify(value);
}

class InputImeClearCompositionParams extends ChromeObject {
  InputImeClearCompositionParams({int? contextID}) {
    if (contextID != null) this.contextID = contextID;
  }
  InputImeClearCompositionParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the context where the composition will be cleared
   */
  int get contextID => jsProxy['contextID'];
  set contextID(int value) => jsProxy['contextID'] = value;
}

class InputImeCommitTextParams extends ChromeObject {
  InputImeCommitTextParams({int? contextID, String? text}) {
    if (contextID != null) this.contextID = contextID;
    if (text != null) this.text = text;
  }
  InputImeCommitTextParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the context where the text will be committed
   */
  int get contextID => jsProxy['contextID'];
  set contextID(int value) => jsProxy['contextID'] = value;

  /**
   * The text to commit
   */
  String get text => jsProxy['text'];
  set text(String value) => jsProxy['text'] = value;
}

class InputImeSendKeyEventsParams extends ChromeObject {
  InputImeSendKeyEventsParams({int? contextID, List<KeyboardEvent>? keyData}) {
    if (contextID != null) this.contextID = contextID;
    if (keyData != null) this.keyData = keyData;
  }
  InputImeSendKeyEventsParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the context where the key events will be sent, or zero to send key
   * events to non-input field.
   */
  int get contextID => jsProxy['contextID'];
  set contextID(int value) => jsProxy['contextID'] = value;

  /**
   * Data on the key event.
   */
  List<KeyboardEvent> get keyData => listify(jsProxy['keyData'], _createKeyboardEvent);
  set keyData(List<KeyboardEvent> value) => jsProxy['keyData'] = jsify(value);
}

class InputImeSetCandidateWindowPropertiesParams extends ChromeObject {
  InputImeSetCandidateWindowPropertiesParams({String? engineID, PropertiesInputIme? properties}) {
    if (engineID != null) this.engineID = engineID;
    if (properties != null) this.properties = properties;
  }
  InputImeSetCandidateWindowPropertiesParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the engine to set properties on.
   */
  String get engineID => jsProxy['engineID'];
  set engineID(String value) => jsProxy['engineID'] = value;

  PropertiesInputIme get properties => _createPropertiesInputIme(jsProxy['properties']);
  set properties(PropertiesInputIme value) => jsProxy['properties'] = jsify(value);
}

class InputImeSetCandidatesParams extends ChromeObject {
  InputImeSetCandidatesParams({int? contextID, List<Map>? candidates}) {
    if (contextID != null) this.contextID = contextID;
    if (candidates != null) this.candidates = candidates;
  }
  InputImeSetCandidatesParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the context that owns the candidate window.
   */
  int get contextID => jsProxy['contextID'];
  set contextID(int value) => jsProxy['contextID'] = value;

  /**
   * List of candidates to show in the candidate window
   */
  List<Map> get candidates => listify(jsProxy['candidates'], mapify);
  set candidates(List<Map> value) => jsProxy['candidates'] = jsify(value);
}

class InputImeSetCursorPositionParams extends ChromeObject {
  InputImeSetCursorPositionParams({int? contextID, int? candidateID}) {
    if (contextID != null) this.contextID = contextID;
    if (candidateID != null) this.candidateID = candidateID;
  }
  InputImeSetCursorPositionParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the context that owns the candidate window.
   */
  int get contextID => jsProxy['contextID'];
  set contextID(int value) => jsProxy['contextID'] = value;

  /**
   * ID of the candidate to select.
   */
  int get candidateID => jsProxy['candidateID'];
  set candidateID(int value) => jsProxy['candidateID'] = value;
}

class InputImeSetAssistiveWindowPropertiesParams extends ChromeObject {
  InputImeSetAssistiveWindowPropertiesParams({int? contextID, AssistiveWindowProperties? properties}) {
    if (contextID != null) this.contextID = contextID;
    if (properties != null) this.properties = properties;
  }
  InputImeSetAssistiveWindowPropertiesParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the context owning the assistive window.
   */
  int get contextID => jsProxy['contextID'];
  set contextID(int value) => jsProxy['contextID'] = value;

  /**
   * Properties of the assistive window.
   */
  AssistiveWindowProperties get properties => _createAssistiveWindowProperties(jsProxy['properties']);
  set properties(AssistiveWindowProperties value) => jsProxy['properties'] = jsify(value);
}

class InputImeSetAssistiveWindowButtonHighlightedParams extends ChromeObject {
  InputImeSetAssistiveWindowButtonHighlightedParams({int? contextID, AssistiveWindowButton? buttonID, AssistiveWindowType? windowType, String? announceString, bool? highlighted}) {
    if (contextID != null) this.contextID = contextID;
    if (buttonID != null) this.buttonID = buttonID;
    if (windowType != null) this.windowType = windowType;
    if (announceString != null) this.announceString = announceString;
    if (highlighted != null) this.highlighted = highlighted;
  }
  InputImeSetAssistiveWindowButtonHighlightedParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the context owning the assistive window.
   */
  int get contextID => jsProxy['contextID'];
  set contextID(int value) => jsProxy['contextID'] = value;

  /**
   * The ID of the button
   */
  AssistiveWindowButton get buttonID => _createAssistiveWindowButton(jsProxy['buttonID']);
  set buttonID(AssistiveWindowButton value) => jsProxy['buttonID'] = jsify(value);

  /**
   * The window type the button belongs to.
   */
  AssistiveWindowType get windowType => _createAssistiveWindowType(jsProxy['windowType']);
  set windowType(AssistiveWindowType value) => jsProxy['windowType'] = jsify(value);

  /**
   * The text for the screenreader to announce.
   */
  String get announceString => jsProxy['announceString'];
  set announceString(String value) => jsProxy['announceString'] = value;

  /**
   * Whether the button should be highlighted.
   */
  bool get highlighted => jsProxy['highlighted'];
  set highlighted(bool value) => jsProxy['highlighted'] = value;
}

class InputImeDeleteSurroundingTextParams extends ChromeObject {
  InputImeDeleteSurroundingTextParams({String? engineID, int? contextID, int? offset, int? length}) {
    if (engineID != null) this.engineID = engineID;
    if (contextID != null) this.contextID = contextID;
    if (offset != null) this.offset = offset;
    if (length != null) this.length = length;
  }
  InputImeDeleteSurroundingTextParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * ID of the engine receiving the event.
   */
  String get engineID => jsProxy['engineID'];
  set engineID(String value) => jsProxy['engineID'] = value;

  /**
   * ID of the context where the surrounding text will be deleted.
   */
  int get contextID => jsProxy['contextID'];
  set contextID(int value) => jsProxy['contextID'] = value;

  /**
   * The offset from the caret position where deletion will start. This value
   * can be negative.
   */
  int get offset => jsProxy['offset'];
  set offset(int value) => jsProxy['offset'] = value;

  /**
   * The number of characters to be deleted
   */
  int get length => jsProxy['length'];
  set length(int value) => jsProxy['length'] = value;
}

OnActivateEvent _createOnActivateEvent(String engineID, JsObject screen) =>
    OnActivateEvent(engineID, _createScreenType(screen));
InputContext _createInputContext(JsObject jsProxy) => InputContext.fromProxy(jsProxy);
OnKeyEventEvent _createOnKeyEventEvent(String engineID, JsObject keyData, String requestId) =>
    OnKeyEventEvent(engineID, _createKeyboardEvent(keyData), requestId);
OnCandidateClickedEvent _createOnCandidateClickedEvent(String engineID, int candidateID, JsObject button) =>
    OnCandidateClickedEvent(engineID, candidateID, _createMouseButton(button));
OnMenuItemActivatedEvent _createOnMenuItemActivatedEvent(String engineID, String name) =>
    OnMenuItemActivatedEvent(engineID, name);
OnSurroundingTextChangedEvent _createOnSurroundingTextChangedEvent(String engineID, JsObject surroundingInfo) =>
    OnSurroundingTextChangedEvent(engineID, mapify(surroundingInfo));
WindowPosition _createWindowPosition(String value) => WindowPosition.VALUES.singleWhere((ChromeEnum e) => e.value == value);
KeyboardEventType _createKeyboardEventType(String value) => KeyboardEventType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
InputContextType _createInputContextType(String value) => InputContextType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
AutoCapitalizeType _createAutoCapitalizeType(String value) => AutoCapitalizeType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
MenuItemStyle _createMenuItemStyle(String value) => MenuItemStyle.VALUES.singleWhere((ChromeEnum e) => e.value == value);
AssistiveWindowType _createAssistiveWindowType(String value) => AssistiveWindowType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
MenuItem _createMenuItem(JsObject jsProxy) => MenuItem.fromProxy(jsProxy);
KeyboardEvent _createKeyboardEvent(JsObject jsProxy) => KeyboardEvent.fromProxy(jsProxy);
PropertiesInputIme _createPropertiesInputIme(JsObject jsProxy) => PropertiesInputIme.fromProxy(jsProxy);
AssistiveWindowProperties _createAssistiveWindowProperties(JsObject jsProxy) => AssistiveWindowProperties.fromProxy(jsProxy);
AssistiveWindowButton _createAssistiveWindowButton(String value) => AssistiveWindowButton.VALUES.singleWhere((ChromeEnum e) => e.value == value);
ScreenType _createScreenType(String value) => ScreenType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
MouseButton _createMouseButton(String value) => MouseButton.VALUES.singleWhere((ChromeEnum e) => e.value == value);
