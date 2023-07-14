import 'input.dart';
import 'src/internal_helpers.dart';
import 'src/js/input_ime.dart' as $js;

export 'input.dart' show ChromeInput, ChromeInputExtension;
export 'src/chrome.dart' show chrome;

final _inputIme = ChromeInputIme._();

extension ChromeInputImeExtension on ChromeInput {
  ChromeInputIme get ime => _inputIme;
}

class ChromeInputIme {
  ChromeInputIme._();

  /// Set the current composition. If this extension does not own the active
  /// IME, this fails.
  Future<bool> setComposition(SetCompositionParameters parameters) {
    var $completer = Completer<bool>();
    $js.chrome.input.ime.setComposition(
      parameters.toJS,
      (bool success) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(success);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Clear the current composition. If this extension does not own the active
  /// IME, this fails.
  Future<bool> clearComposition(ClearCompositionParameters parameters) {
    var $completer = Completer<bool>();
    $js.chrome.input.ime.clearComposition(
      parameters.toJS,
      (bool success) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(success);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Commits the provided text to the current input.
  Future<bool> commitText(CommitTextParameters parameters) {
    var $completer = Completer<bool>();
    $js.chrome.input.ime.commitText(
      parameters.toJS,
      (bool success) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(success);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Sends the key events.  This function is expected to be used by virtual
  /// keyboards.  When key(s) on a virtual keyboard is pressed by a user, this
  /// function is used to propagate that event to the system.
  Future<void> sendKeyEvents(SendKeyEventsParameters parameters) {
    var $completer = Completer<void>();
    $js.chrome.input.ime.sendKeyEvents(
      parameters.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Hides the input view window, which is popped up automatically by system.
  /// If the input view window is already hidden, this function will do nothing.
  void hideInputView() {
    $js.chrome.input.ime.hideInputView();
  }

  /// Sets the properties of the candidate window. This fails if the extension
  /// doesn't own the active IME
  Future<bool> setCandidateWindowProperties(
      SetCandidateWindowPropertiesParameters parameters) {
    var $completer = Completer<bool>();
    $js.chrome.input.ime.setCandidateWindowProperties(
      parameters.toJS,
      (bool success) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(success);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the current candidate list. This fails if this extension doesn't own
  /// the active IME
  Future<bool> setCandidates(SetCandidatesParameters parameters) {
    var $completer = Completer<bool>();
    $js.chrome.input.ime.setCandidates(
      parameters.toJS,
      (bool success) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(success);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Set the position of the cursor in the candidate window. This is a no-op if
  /// this extension does not own the active IME.
  Future<bool> setCursorPosition(SetCursorPositionParameters parameters) {
    var $completer = Completer<bool>();
    $js.chrome.input.ime.setCursorPosition(
      parameters.toJS,
      (bool success) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(success);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Shows/Hides an assistive window with the given properties.
  Future<bool> setAssistiveWindowProperties(
      SetAssistiveWindowPropertiesParameters parameters) {
    var $completer = Completer<bool>();
    $js.chrome.input.ime.setAssistiveWindowProperties(
      parameters.toJS,
      (bool success) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(success);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Highlights/Unhighlights a button in an assistive window.
  Future<void> setAssistiveWindowButtonHighlighted(
      SetAssistiveWindowButtonHighlightedParameters parameters) {
    var $completer = Completer<void>();
    $js.chrome.input.ime.setAssistiveWindowButtonHighlighted(
      parameters.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Adds the provided menu items to the language menu when this IME is active.
  Future<void> setMenuItems(MenuParameters parameters) {
    var $completer = Completer<void>();
    $js.chrome.input.ime.setMenuItems(
      parameters.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Updates the state of the MenuItems specified
  Future<void> updateMenuItems(MenuParameters parameters) {
    var $completer = Completer<void>();
    $js.chrome.input.ime.updateMenuItems(
      parameters.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Deletes the text around the caret.
  Future<void> deleteSurroundingText(
      DeleteSurroundingTextParameters parameters) {
    var $completer = Completer<void>();
    $js.chrome.input.ime.deleteSurroundingText(
      parameters.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Indicates that the key event received by onKeyEvent is handled.  This
  /// should only be called if the onKeyEvent listener is asynchronous.
  void keyEventHandled(
    String requestId,
    bool response,
  ) {
    $js.chrome.input.ime.keyEventHandled(
      requestId,
      response,
    );
  }

  /// This event is sent when an IME is activated. It signals that the IME will
  /// be receiving onKeyPress events.
  Stream<OnActivateEvent> get onActivate => throw UnimplementedError();

  /// This event is sent when an IME is deactivated. It signals that the IME
  /// will no longer be receiving onKeyPress events.
  Stream<String> get onDeactivated => throw UnimplementedError();

  /// This event is sent when focus enters a text box. It is sent to all
  /// extensions that are listening to this event, and enabled by the user.
  Stream<InputContext> get onFocus => throw UnimplementedError();

  /// This event is sent when focus leaves a text box. It is sent to all
  /// extensions that are listening to this event, and enabled by the user.
  Stream<int> get onBlur => throw UnimplementedError();

  /// This event is sent when the properties of the current InputContext change,
  /// such as the the type. It is sent to all extensions that are listening to
  /// this event, and enabled by the user.
  Stream<InputContext> get onInputContextUpdate => throw UnimplementedError();

  /// Fired when a key event is sent from the operating system. The event will
  /// be sent to the extension if this extension owns the active IME. The
  /// listener function should return true if the event was handled false if it
  /// was not.  If the event will be evaluated asynchronously, this function
  /// must return undefined and the IME must later call keyEventHandled() with
  /// the result.
  Stream<OnKeyEventEvent> get onKeyEvent => throw UnimplementedError();

  /// This event is sent if this extension owns the active IME.
  Stream<OnCandidateClickedEvent> get onCandidateClicked =>
      throw UnimplementedError();

  /// Called when the user selects a menu item
  Stream<OnMenuItemActivatedEvent> get onMenuItemActivated =>
      throw UnimplementedError();

  /// Called when the editable string around caret is changed or when the caret
  /// position is moved. The text length is limited to 100 characters for each
  /// back and forth direction.
  Stream<OnSurroundingTextChangedEvent> get onSurroundingTextChanged =>
      throw UnimplementedError();

  /// This event is sent when chrome terminates ongoing text input session.
  Stream<String> get onReset => throw UnimplementedError();

  /// This event is sent when a button in an assistive window is clicked.
  Stream<OnAssistiveWindowButtonClickedDetails>
      get onAssistiveWindowButtonClicked => throw UnimplementedError();
}

enum KeyboardEventType {
  keyup('keyup'),
  keydown('keydown');

  const KeyboardEventType(this.value);

  final String value;

  String get toJS => value;
  static KeyboardEventType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
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

  String get toJS => value;
  static InputContextType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The auto-capitalize type of the text field.
enum AutoCapitalizeType {
  characters('characters'),
  words('words'),
  sentences('sentences');

  const AutoCapitalizeType(this.value);

  final String value;

  String get toJS => value;
  static AutoCapitalizeType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The type of menu item. Radio buttons between separators are considered
/// grouped.
enum MenuItemStyle {
  check('check'),
  radio('radio'),
  separator('separator');

  const MenuItemStyle(this.value);

  final String value;

  String get toJS => value;
  static MenuItemStyle fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The type of the underline to modify this segment.
enum UnderlineStyle {
  underline('underline'),
  doubleUnderline('doubleUnderline'),
  noUnderline('noUnderline');

  const UnderlineStyle(this.value);

  final String value;

  String get toJS => value;
  static UnderlineStyle fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Where to display the candidate window. If set to 'cursor', the window
/// follows the cursor. If set to 'composition', the window is locked to the
/// beginning of the composition.
enum WindowPosition {
  cursor('cursor'),
  composition('composition');

  const WindowPosition(this.value);

  final String value;

  String get toJS => value;
  static WindowPosition fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The screen type under which the IME is activated.
enum ScreenType {
  normal('normal'),
  login('login'),
  lock('lock'),
  secondaryLogin('secondary-login');

  const ScreenType(this.value);

  final String value;

  String get toJS => value;
  static ScreenType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Which mouse buttons was clicked.
enum MouseButton {
  left('left'),
  middle('middle'),
  right('right');

  const MouseButton(this.value);

  final String value;

  String get toJS => value;
  static MouseButton fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Type of assistive window.
enum AssistiveWindowType {
  undo('undo');

  const AssistiveWindowType(this.value);

  final String value;

  String get toJS => value;
  static AssistiveWindowType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// ID of buttons in assistive window.
enum AssistiveWindowButton {
  undo('undo'),
  addToDictionary('addToDictionary');

  const AssistiveWindowButton(this.value);

  final String value;

  String get toJS => value;
  static AssistiveWindowButton fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class KeyboardEvent {
  KeyboardEvent.fromJS(this._wrapped);

  KeyboardEvent({
    required KeyboardEventType type,
    String? requestId,
    String? extensionId,
    required String key,
    required String code,
    int? keyCode,
    bool? altKey,
    bool? altgrKey,
    bool? ctrlKey,
    bool? shiftKey,
    bool? capsLock,
  }) : _wrapped = $js.KeyboardEvent()
          ..type = type.toJS
          ..requestId = requestId
          ..extensionId = extensionId
          ..key = key
          ..code = code
          ..keyCode = keyCode
          ..altKey = altKey
          ..altgrKey = altgrKey
          ..ctrlKey = ctrlKey
          ..shiftKey = shiftKey
          ..capsLock = capsLock;

  final $js.KeyboardEvent _wrapped;

  $js.KeyboardEvent get toJS => _wrapped;

  /// One of keyup or keydown.
  KeyboardEventType get type => KeyboardEventType.fromJS(_wrapped.type);
  set type(KeyboardEventType v) {
    _wrapped.type = v.toJS;
  }

  /// (Deprecated) The ID of the request. Use the `requestId` param from the
  /// `onKeyEvent` event instead.
  String? get requestId => _wrapped.requestId;
  set requestId(String? v) {
    _wrapped.requestId = v;
  }

  /// The extension ID of the sender of this keyevent.
  String? get extensionId => _wrapped.extensionId;
  set extensionId(String? v) {
    _wrapped.extensionId = v;
  }

  /// Value of the key being pressed
  String get key => _wrapped.key;
  set key(String v) {
    _wrapped.key = v;
  }

  /// Value of the physical key being pressed. The value is not affected by
  /// current keyboard layout or modifier state.
  String get code => _wrapped.code;
  set code(String v) {
    _wrapped.code = v;
  }

  /// The deprecated HTML keyCode, which is system- and implementation-dependent
  /// numerical code signifying the unmodified identifier associated with the
  /// key pressed.
  int? get keyCode => _wrapped.keyCode;
  set keyCode(int? v) {
    _wrapped.keyCode = v;
  }

  /// Whether or not the ALT key is pressed.
  bool? get altKey => _wrapped.altKey;
  set altKey(bool? v) {
    _wrapped.altKey = v;
  }

  /// Whether or not the ALTGR key is pressed.
  bool? get altgrKey => _wrapped.altgrKey;
  set altgrKey(bool? v) {
    _wrapped.altgrKey = v;
  }

  /// Whether or not the CTRL key is pressed.
  bool? get ctrlKey => _wrapped.ctrlKey;
  set ctrlKey(bool? v) {
    _wrapped.ctrlKey = v;
  }

  /// Whether or not the SHIFT key is pressed.
  bool? get shiftKey => _wrapped.shiftKey;
  set shiftKey(bool? v) {
    _wrapped.shiftKey = v;
  }

  /// Whether or not the CAPS_LOCK is enabled.
  bool? get capsLock => _wrapped.capsLock;
  set capsLock(bool? v) {
    _wrapped.capsLock = v;
  }
}

class InputContext {
  InputContext.fromJS(this._wrapped);

  InputContext({
    required int contextID,
    required InputContextType type,
    required bool autoCorrect,
    required bool autoComplete,
    required AutoCapitalizeType autoCapitalize,
    required bool spellCheck,
    required bool shouldDoLearning,
  }) : _wrapped = $js.InputContext()
          ..contextID = contextID
          ..type = type.toJS
          ..autoCorrect = autoCorrect
          ..autoComplete = autoComplete
          ..autoCapitalize = autoCapitalize.toJS
          ..spellCheck = spellCheck
          ..shouldDoLearning = shouldDoLearning;

  final $js.InputContext _wrapped;

  $js.InputContext get toJS => _wrapped;

  /// This is used to specify targets of text field operations.  This ID becomes
  /// invalid as soon as onBlur is called.
  int get contextID => _wrapped.contextID;
  set contextID(int v) {
    _wrapped.contextID = v;
  }

  /// Type of value this text field edits, (Text, Number, URL, etc)
  InputContextType get type => InputContextType.fromJS(_wrapped.type);
  set type(InputContextType v) {
    _wrapped.type = v.toJS;
  }

  /// Whether the text field wants auto-correct.
  bool get autoCorrect => _wrapped.autoCorrect;
  set autoCorrect(bool v) {
    _wrapped.autoCorrect = v;
  }

  /// Whether the text field wants auto-complete.
  bool get autoComplete => _wrapped.autoComplete;
  set autoComplete(bool v) {
    _wrapped.autoComplete = v;
  }

  /// The auto-capitalize type of the text field.
  AutoCapitalizeType get autoCapitalize =>
      AutoCapitalizeType.fromJS(_wrapped.autoCapitalize);
  set autoCapitalize(AutoCapitalizeType v) {
    _wrapped.autoCapitalize = v.toJS;
  }

  /// Whether the text field wants spell-check.
  bool get spellCheck => _wrapped.spellCheck;
  set spellCheck(bool v) {
    _wrapped.spellCheck = v;
  }

  /// Whether text entered into the text field should be used to improve typing
  /// suggestions for the user.
  bool get shouldDoLearning => _wrapped.shouldDoLearning;
  set shouldDoLearning(bool v) {
    _wrapped.shouldDoLearning = v;
  }
}

class MenuItem {
  MenuItem.fromJS(this._wrapped);

  MenuItem({
    required String id,
    String? label,
    MenuItemStyle? style,
    bool? visible,
    bool? checked,
    bool? enabled,
  }) : _wrapped = $js.MenuItem()
          ..id = id
          ..label = label
          ..style = style?.toJS
          ..visible = visible
          ..checked = checked
          ..enabled = enabled;

  final $js.MenuItem _wrapped;

  $js.MenuItem get toJS => _wrapped;

  /// String that will be passed to callbacks referencing this MenuItem.
  String get id => _wrapped.id;
  set id(String v) {
    _wrapped.id = v;
  }

  /// Text displayed in the menu for this item.
  String? get label => _wrapped.label;
  set label(String? v) {
    _wrapped.label = v;
  }

  /// The type of menu item.
  MenuItemStyle? get style => _wrapped.style?.let(MenuItemStyle.fromJS);
  set style(MenuItemStyle? v) {
    _wrapped.style = v?.toJS;
  }

  /// Indicates this item is visible.
  bool? get visible => _wrapped.visible;
  set visible(bool? v) {
    _wrapped.visible = v;
  }

  /// Indicates this item should be drawn with a check.
  bool? get checked => _wrapped.checked;
  set checked(bool? v) {
    _wrapped.checked = v;
  }

  /// Indicates this item is enabled.
  bool? get enabled => _wrapped.enabled;
  set enabled(bool? v) {
    _wrapped.enabled = v;
  }
}

class AssistiveWindowProperties {
  AssistiveWindowProperties.fromJS(this._wrapped);

  AssistiveWindowProperties({
    required AssistiveWindowType type,
    required bool visible,
    String? announceString,
  }) : _wrapped = $js.AssistiveWindowProperties()
          ..type = type.toJS
          ..visible = visible
          ..announceString = announceString;

  final $js.AssistiveWindowProperties _wrapped;

  $js.AssistiveWindowProperties get toJS => _wrapped;

  AssistiveWindowType get type => AssistiveWindowType.fromJS(_wrapped.type);
  set type(AssistiveWindowType v) {
    _wrapped.type = v.toJS;
  }

  /// Sets true to show AssistiveWindow, sets false to hide.
  bool get visible => _wrapped.visible;
  set visible(bool v) {
    _wrapped.visible = v;
  }

  /// Strings for ChromeVox to announce.
  String? get announceString => _wrapped.announceString;
  set announceString(String? v) {
    _wrapped.announceString = v;
  }
}

class MenuParameters {
  MenuParameters.fromJS(this._wrapped);

  MenuParameters({
    required String engineID,
    required List<MenuItem> items,
  }) : _wrapped = $js.MenuParameters()
          ..engineID = engineID
          ..items = throw UnimplementedError();

  final $js.MenuParameters _wrapped;

  $js.MenuParameters get toJS => _wrapped;

  /// ID of the engine to use.
  String get engineID => _wrapped.engineID;
  set engineID(String v) {
    _wrapped.engineID = v;
  }

  /// MenuItems to add or update. They will be added in the order they exist in
  /// the array.
  List<MenuItem> get items => _wrapped.items.toDart
      .cast<$js.MenuItem>()
      .map((e) => MenuItem.fromJS(e))
      .toList();
  set items(List<MenuItem> v) {
    _wrapped.items = throw UnimplementedError();
  }
}

class OnSurroundingTextChangedSurroundingInfo {
  OnSurroundingTextChangedSurroundingInfo.fromJS(this._wrapped);

  OnSurroundingTextChangedSurroundingInfo({
    required String text,
    required int focus,
    required int anchor,
    required int offset,
  }) : _wrapped = $js.OnSurroundingTextChangedSurroundingInfo()
          ..text = text
          ..focus = focus
          ..anchor = anchor
          ..offset = offset;

  final $js.OnSurroundingTextChangedSurroundingInfo _wrapped;

  $js.OnSurroundingTextChangedSurroundingInfo get toJS => _wrapped;

  /// The text around the cursor. This is only a subset of all text in the input
  /// field.
  String get text => _wrapped.text;
  set text(String v) {
    _wrapped.text = v;
  }

  /// The ending position of the selection. This value indicates caret position
  /// if there is no selection.
  int get focus => _wrapped.focus;
  set focus(int v) {
    _wrapped.focus = v;
  }

  /// The beginning position of the selection. This value indicates caret
  /// position if there is no selection.
  int get anchor => _wrapped.anchor;
  set anchor(int v) {
    _wrapped.anchor = v;
  }

  /// The offset position of `text`. Since `text` only includes a subset of text
  /// around the cursor, offset indicates the absolute position of the first
  /// character of `text`.
  int get offset => _wrapped.offset;
  set offset(int v) {
    _wrapped.offset = v;
  }
}

class OnAssistiveWindowButtonClickedDetails {
  OnAssistiveWindowButtonClickedDetails.fromJS(this._wrapped);

  OnAssistiveWindowButtonClickedDetails({
    required AssistiveWindowButton buttonID,
    required AssistiveWindowType windowType,
  }) : _wrapped = $js.OnAssistiveWindowButtonClickedDetails()
          ..buttonID = buttonID.toJS
          ..windowType = windowType.toJS;

  final $js.OnAssistiveWindowButtonClickedDetails _wrapped;

  $js.OnAssistiveWindowButtonClickedDetails get toJS => _wrapped;

  /// The ID of the button clicked.
  AssistiveWindowButton get buttonID =>
      AssistiveWindowButton.fromJS(_wrapped.buttonID);
  set buttonID(AssistiveWindowButton v) {
    _wrapped.buttonID = v.toJS;
  }

  /// The type of the assistive window.
  AssistiveWindowType get windowType =>
      AssistiveWindowType.fromJS(_wrapped.windowType);
  set windowType(AssistiveWindowType v) {
    _wrapped.windowType = v.toJS;
  }
}

class SetCompositionParameters {
  SetCompositionParameters.fromJS(this._wrapped);

  SetCompositionParameters({
    required int contextID,
    required String text,
    int? selectionStart,
    int? selectionEnd,
    required int cursor,
    SetCompositionParametersSegments? segments,
  }) : _wrapped = $js.SetCompositionParameters(
          contextID: contextID,
          text: text,
          selectionStart: selectionStart,
          selectionEnd: selectionEnd,
          cursor: cursor,
          segments: segments?.toJS,
        );

  final $js.SetCompositionParameters _wrapped;

  $js.SetCompositionParameters get toJS => _wrapped;
}

class ClearCompositionParameters {
  ClearCompositionParameters.fromJS(this._wrapped);

  ClearCompositionParameters({required int contextID})
      : _wrapped = $js.ClearCompositionParameters(contextID: contextID);

  final $js.ClearCompositionParameters _wrapped;

  $js.ClearCompositionParameters get toJS => _wrapped;
}

class CommitTextParameters {
  CommitTextParameters.fromJS(this._wrapped);

  CommitTextParameters({
    required int contextID,
    required String text,
  }) : _wrapped = $js.CommitTextParameters(
          contextID: contextID,
          text: text,
        );

  final $js.CommitTextParameters _wrapped;

  $js.CommitTextParameters get toJS => _wrapped;
}

class SendKeyEventsParameters {
  SendKeyEventsParameters.fromJS(this._wrapped);

  SendKeyEventsParameters({
    required int contextID,
    required List<KeyboardEvent> keyData,
  }) : _wrapped = $js.SendKeyEventsParameters(
          contextID: contextID,
          keyData: throw UnimplementedError(),
        );

  final $js.SendKeyEventsParameters _wrapped;

  $js.SendKeyEventsParameters get toJS => _wrapped;
}

class SetCandidateWindowPropertiesParameters {
  SetCandidateWindowPropertiesParameters.fromJS(this._wrapped);

  SetCandidateWindowPropertiesParameters({
    required String engineID,
    required SetCandidateWindowPropertiesParametersProperties properties,
  }) : _wrapped = $js.SetCandidateWindowPropertiesParameters(
          engineID: engineID,
          properties: properties.toJS,
        );

  final $js.SetCandidateWindowPropertiesParameters _wrapped;

  $js.SetCandidateWindowPropertiesParameters get toJS => _wrapped;
}

class SetCandidatesParameters {
  SetCandidatesParameters.fromJS(this._wrapped);

  SetCandidatesParameters({
    required int contextID,
    required SetCandidatesParametersCandidates candidates,
  }) : _wrapped = $js.SetCandidatesParameters(
          contextID: contextID,
          candidates: candidates.toJS,
        );

  final $js.SetCandidatesParameters _wrapped;

  $js.SetCandidatesParameters get toJS => _wrapped;
}

class SetCursorPositionParameters {
  SetCursorPositionParameters.fromJS(this._wrapped);

  SetCursorPositionParameters({
    required int contextID,
    required int candidateID,
  }) : _wrapped = $js.SetCursorPositionParameters(
          contextID: contextID,
          candidateID: candidateID,
        );

  final $js.SetCursorPositionParameters _wrapped;

  $js.SetCursorPositionParameters get toJS => _wrapped;
}

class SetAssistiveWindowPropertiesParameters {
  SetAssistiveWindowPropertiesParameters.fromJS(this._wrapped);

  SetAssistiveWindowPropertiesParameters({
    required int contextID,
    required AssistiveWindowProperties properties,
  }) : _wrapped = $js.SetAssistiveWindowPropertiesParameters(
          contextID: contextID,
          properties: properties.toJS,
        );

  final $js.SetAssistiveWindowPropertiesParameters _wrapped;

  $js.SetAssistiveWindowPropertiesParameters get toJS => _wrapped;
}

class SetAssistiveWindowButtonHighlightedParameters {
  SetAssistiveWindowButtonHighlightedParameters.fromJS(this._wrapped);

  SetAssistiveWindowButtonHighlightedParameters({
    required int contextID,
    required AssistiveWindowButton buttonID,
    required AssistiveWindowType windowType,
    String? announceString,
    required bool highlighted,
  }) : _wrapped = $js.SetAssistiveWindowButtonHighlightedParameters(
          contextID: contextID,
          buttonID: buttonID.toJS,
          windowType: windowType.toJS,
          announceString: announceString,
          highlighted: highlighted,
        );

  final $js.SetAssistiveWindowButtonHighlightedParameters _wrapped;

  $js.SetAssistiveWindowButtonHighlightedParameters get toJS => _wrapped;
}

class DeleteSurroundingTextParameters {
  DeleteSurroundingTextParameters.fromJS(this._wrapped);

  DeleteSurroundingTextParameters({
    required String engineID,
    required int contextID,
    required int offset,
    required int length,
  }) : _wrapped = $js.DeleteSurroundingTextParameters(
          engineID: engineID,
          contextID: contextID,
          offset: offset,
          length: length,
        );

  final $js.DeleteSurroundingTextParameters _wrapped;

  $js.DeleteSurroundingTextParameters get toJS => _wrapped;
}

class SetCompositionParametersSegments {
  SetCompositionParametersSegments.fromJS(this._wrapped);

  SetCompositionParametersSegments({
    required int start,
    required int end,
    required UnderlineStyle style,
  }) : _wrapped = $js.SetCompositionParametersSegments(
          start: start,
          end: end,
          style: style.toJS,
        );

  final $js.SetCompositionParametersSegments _wrapped;

  $js.SetCompositionParametersSegments get toJS => _wrapped;
}

class SetCandidateWindowPropertiesParametersProperties {
  SetCandidateWindowPropertiesParametersProperties.fromJS(this._wrapped);

  SetCandidateWindowPropertiesParametersProperties({
    bool? visible,
    bool? cursorVisible,
    bool? vertical,
    int? pageSize,
    String? auxiliaryText,
    bool? auxiliaryTextVisible,
    int? totalCandidates,
    int? currentCandidateIndex,
    WindowPosition? windowPosition,
  }) : _wrapped = $js.SetCandidateWindowPropertiesParametersProperties(
          visible: visible,
          cursorVisible: cursorVisible,
          vertical: vertical,
          pageSize: pageSize,
          auxiliaryText: auxiliaryText,
          auxiliaryTextVisible: auxiliaryTextVisible,
          totalCandidates: totalCandidates,
          currentCandidateIndex: currentCandidateIndex,
          windowPosition: windowPosition?.toJS,
        );

  final $js.SetCandidateWindowPropertiesParametersProperties _wrapped;

  $js.SetCandidateWindowPropertiesParametersProperties get toJS => _wrapped;
}

class SetCandidatesParametersCandidates {
  SetCandidatesParametersCandidates.fromJS(this._wrapped);

  SetCandidatesParametersCandidates({
    required String candidate,
    required int id,
    int? parentId,
    String? label,
    String? annotation,
    SetCandidatesParametersCandidatesUsage? usage,
  }) : _wrapped = $js.SetCandidatesParametersCandidates(
          candidate: candidate,
          id: id,
          parentId: parentId,
          label: label,
          annotation: annotation,
          usage: usage?.toJS,
        );

  final $js.SetCandidatesParametersCandidates _wrapped;

  $js.SetCandidatesParametersCandidates get toJS => _wrapped;
}

class SetCandidatesParametersCandidatesUsage {
  SetCandidatesParametersCandidatesUsage.fromJS(this._wrapped);

  SetCandidatesParametersCandidatesUsage({
    required String title,
    required String body,
  }) : _wrapped = $js.SetCandidatesParametersCandidatesUsage(
          title: title,
          body: body,
        );

  final $js.SetCandidatesParametersCandidatesUsage _wrapped;

  $js.SetCandidatesParametersCandidatesUsage get toJS => _wrapped;
}

class OnActivateEvent {
  OnActivateEvent({
    required this.engineID,
    required this.screen,
  });

  /// ID of the engine receiving the event
  final String engineID;

  /// The screen type under which the IME is activated.
  final ScreenType screen;
}

class OnKeyEventEvent {
  OnKeyEventEvent({
    required this.engineID,
    required this.keyData,
    required this.requestId,
  });

  /// ID of the engine receiving the event
  final String engineID;

  /// Data on the key event
  final KeyboardEvent keyData;

  /// ID of the request. If the event listener returns undefined, then
  /// `keyEventHandled` must be called later with this `requestId`.
  final String requestId;
}

class OnCandidateClickedEvent {
  OnCandidateClickedEvent({
    required this.engineID,
    required this.candidateID,
    required this.button,
  });

  /// ID of the engine receiving the event
  final String engineID;

  /// ID of the candidate that was clicked.
  final int candidateID;

  /// Which mouse buttons was clicked.
  final MouseButton button;
}

class OnMenuItemActivatedEvent {
  OnMenuItemActivatedEvent({
    required this.engineID,
    required this.name,
  });

  /// ID of the engine receiving the event
  final String engineID;

  /// Name of the MenuItem which was activated
  final String name;
}

class OnSurroundingTextChangedEvent {
  OnSurroundingTextChangedEvent({
    required this.engineID,
    required this.surroundingInfo,
  });

  /// ID of the engine receiving the event
  final String engineID;

  /// The surrounding information.
  final OnSurroundingTextChangedSurroundingInfo surroundingInfo;
}
