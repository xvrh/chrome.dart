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
  external JSPromise setComposition(SetCompositionParameters parameters);

  /// Clear the current composition. If this extension does not own the active
  /// IME, this fails.
  external JSPromise clearComposition(ClearCompositionParameters parameters);

  /// Commits the provided text to the current input.
  external JSPromise commitText(CommitTextParameters parameters);

  /// Sends the key events.  This function is expected to be used by virtual
  /// keyboards.  When key(s) on a virtual keyboard is pressed by a user, this
  /// function is used to propagate that event to the system.
  external JSPromise sendKeyEvents(SendKeyEventsParameters parameters);

  /// Hides the input view window, which is popped up automatically by system.
  /// If the input view window is already hidden, this function will do nothing.
  external void hideInputView();

  /// Sets the properties of the candidate window. This fails if the extension
  /// doesn't own the active IME
  external JSPromise setCandidateWindowProperties(
      SetCandidateWindowPropertiesParameters parameters);

  /// Sets the current candidate list. This fails if this extension doesn't own
  /// the active IME
  external JSPromise setCandidates(SetCandidatesParameters parameters);

  /// Set the position of the cursor in the candidate window. This is a no-op if
  /// this extension does not own the active IME.
  external JSPromise setCursorPosition(SetCursorPositionParameters parameters);

  /// Shows/Hides an assistive window with the given properties.
  external JSPromise setAssistiveWindowProperties(
      SetAssistiveWindowPropertiesParameters parameters);

  /// Highlights/Unhighlights a button in an assistive window.
  external JSPromise setAssistiveWindowButtonHighlighted(
      SetAssistiveWindowButtonHighlightedParameters parameters);

  /// Adds the provided menu items to the language menu when this IME is active.
  external JSPromise setMenuItems(MenuParameters parameters);

  /// Updates the state of the MenuItems specified
  external JSPromise updateMenuItems(MenuParameters parameters);

  /// Deletes the text around the caret.
  external JSPromise deleteSurroundingText(
      DeleteSurroundingTextParameters parameters);

  /// Indicates that the key event received by onKeyEvent is handled.  This
  /// should only be called if the onKeyEvent listener is asynchronous.
  external void keyEventHandled(
    JSString requestId,
    JSBoolean response,
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
class KeyboardEvent {}

extension KeyboardEventExtension on KeyboardEvent {
  /// One of keyup or keydown.
  external KeyboardEventType get type;

  /// (Deprecated) The ID of the request. Use the `requestId` param from the
  /// `onKeyEvent` event instead.
  external JSString? get requestId;

  /// The extension ID of the sender of this keyevent.
  external JSString? get extensionId;

  /// Value of the key being pressed
  external JSString get key;

  /// Value of the physical key being pressed. The value is not affected by
  /// current keyboard layout or modifier state.
  external JSString get code;

  /// The deprecated HTML keyCode, which is system- and implementation-dependent
  /// numerical code signifying the unmodified identifier associated with the
  /// key pressed.
  external JSNumber? get keyCode;

  /// Whether or not the ALT key is pressed.
  external JSBoolean? get altKey;

  /// Whether or not the ALTGR key is pressed.
  external JSBoolean? get altgrKey;

  /// Whether or not the CTRL key is pressed.
  external JSBoolean? get ctrlKey;

  /// Whether or not the SHIFT key is pressed.
  external JSBoolean? get shiftKey;

  /// Whether or not the CAPS_LOCK is enabled.
  external JSBoolean? get capsLock;
}

@JS()
@staticInterop
class InputContext {}

extension InputContextExtension on InputContext {
  /// This is used to specify targets of text field operations.  This ID becomes
  /// invalid as soon as onBlur is called.
  external JSNumber get contextID;

  /// Type of value this text field edits, (Text, Number, URL, etc)
  external InputContextType get type;

  /// Whether the text field wants auto-correct.
  external JSBoolean get autoCorrect;

  /// Whether the text field wants auto-complete.
  external JSBoolean get autoComplete;

  /// The auto-capitalize type of the text field.
  external AutoCapitalizeType get autoCapitalize;

  /// Whether the text field wants spell-check.
  external JSBoolean get spellCheck;

  /// Whether text entered into the text field should be used to improve typing
  /// suggestions for the user.
  external JSBoolean get shouldDoLearning;
}

@JS()
@staticInterop
class MenuItem {}

extension MenuItemExtension on MenuItem {
  /// String that will be passed to callbacks referencing this MenuItem.
  external JSString get id;

  /// Text displayed in the menu for this item.
  external JSString? get label;

  /// The type of menu item.
  external MenuItemStyle? get style;

  /// Indicates this item is visible.
  external JSBoolean? get visible;

  /// Indicates this item should be drawn with a check.
  external JSBoolean? get checked;

  /// Indicates this item is enabled.
  external JSBoolean? get enabled;
}

@JS()
@staticInterop
class AssistiveWindowProperties {}

extension AssistiveWindowPropertiesExtension on AssistiveWindowProperties {
  external AssistiveWindowType get type;

  /// Sets true to show AssistiveWindow, sets false to hide.
  external JSBoolean get visible;

  /// Strings for ChromeVox to announce.
  external JSString? get announceString;
}

@JS()
@staticInterop
class MenuParameters {}

extension MenuParametersExtension on MenuParameters {
  /// ID of the engine to use.
  external JSString get engineID;

  /// MenuItems to add or update. They will be added in the order they exist in
  /// the array.
  external JSArray get items;
}

@JS()
@staticInterop
@anonymous
class SetCompositionParameters {
  external factory SetCompositionParameters(
    /// ID of the context where the composition text will be set
    JSNumber contextID,

    /// Text to set
    JSString text,

    /// Position in the text that the selection starts at.
    JSNumber? selectionStart,

    /// Position in the text that the selection ends at.
    JSNumber? selectionEnd,

    /// Position in the text of the cursor.
    JSNumber cursor,

    /// List of segments and their associated types.
    JSArray? segments,
  );
}

@JS()
@staticInterop
@anonymous
class ClearCompositionParameters {
  external factory ClearCompositionParameters(

      /// ID of the context where the composition will be cleared
      JSNumber contextID);
}

@JS()
@staticInterop
@anonymous
class CommitTextParameters {
  external factory CommitTextParameters(
    /// ID of the context where the text will be committed
    JSNumber contextID,

    /// The text to commit
    JSString text,
  );
}

@JS()
@staticInterop
@anonymous
class SendKeyEventsParameters {
  external factory SendKeyEventsParameters(
    /// ID of the context where the key events will be sent, or zero to send key
    /// events to non-input field.
    JSNumber contextID,

    /// Data on the key event.
    JSArray keyData,
  );
}

@JS()
@staticInterop
@anonymous
class SetCandidateWindowPropertiesParameters {
  external factory SetCandidateWindowPropertiesParameters(
    /// ID of the engine to set properties on.
    JSString engineID,
    SetCandidateWindowPropertiesParametersProperties properties,
  );
}

@JS()
@staticInterop
@anonymous
class SetCandidatesParameters {
  external factory SetCandidatesParameters(
    /// ID of the context that owns the candidate window.
    JSNumber contextID,

    /// List of candidates to show in the candidate window
    JSArray candidates,
  );
}

@JS()
@staticInterop
@anonymous
class SetCursorPositionParameters {
  external factory SetCursorPositionParameters(
    /// ID of the context that owns the candidate window.
    JSNumber contextID,

    /// ID of the candidate to select.
    JSNumber candidateID,
  );
}

@JS()
@staticInterop
@anonymous
class SetAssistiveWindowPropertiesParameters {
  external factory SetAssistiveWindowPropertiesParameters(
    /// ID of the context owning the assistive window.
    JSNumber contextID,

    /// Properties of the assistive window.
    AssistiveWindowProperties properties,
  );
}

@JS()
@staticInterop
@anonymous
class SetAssistiveWindowButtonHighlightedParameters {
  external factory SetAssistiveWindowButtonHighlightedParameters(
    /// ID of the context owning the assistive window.
    JSNumber contextID,

    /// The ID of the button
    AssistiveWindowButton buttonID,

    /// The window type the button belongs to.
    AssistiveWindowType windowType,

    /// The text for the screenreader to announce.
    JSString? announceString,

    /// Whether the button should be highlighted.
    JSBoolean highlighted,
  );
}

@JS()
@staticInterop
@anonymous
class DeleteSurroundingTextParameters {
  external factory DeleteSurroundingTextParameters(
    /// ID of the engine receiving the event.
    JSString engineID,

    /// ID of the context where the surrounding text will be deleted.
    JSNumber contextID,

    /// The offset from the caret position where deletion will start. This value
    /// can be negative.
    JSNumber offset,

    /// The number of characters to be deleted
    JSNumber length,
  );
}

@JS()
@staticInterop
@anonymous
class SetCompositionParametersSegments {
  external factory SetCompositionParametersSegments(
    /// Index of the character to start this segment at
    JSNumber start,

    /// Index of the character to end this segment after.
    JSNumber end,

    /// The type of the underline to modify this segment.
    UnderlineStyle style,
  );
}

@JS()
@staticInterop
@anonymous
class SetCandidateWindowPropertiesParametersProperties {
  external factory SetCandidateWindowPropertiesParametersProperties(
    /// True to show the Candidate window, false to hide it.
    JSBoolean? visible,

    /// True to show the cursor, false to hide it.
    JSBoolean? cursorVisible,

    /// True if the candidate window should be rendered vertical, false to make it
    /// horizontal.
    JSBoolean? vertical,

    /// The number of candidates to display per page.
    JSNumber? pageSize,

    /// Text that is shown at the bottom of the candidate window.
    JSString? auxiliaryText,

    /// True to display the auxiliary text, false to hide it.
    JSBoolean? auxiliaryTextVisible,

    /// The total number of candidates for the candidate window.
    JSNumber? totalCandidates,

    /// The index of the current chosen candidate out of total candidates.
    JSNumber? currentCandidateIndex,

    /// Where to display the candidate window.
    WindowPosition? windowPosition,
  );
}

@JS()
@staticInterop
@anonymous
class SetCandidatesParametersCandidates {
  external factory SetCandidatesParametersCandidates(
    /// The candidate
    JSString candidate,

    /// The candidate's id
    JSNumber id,

    /// The id to add these candidates under
    JSNumber? parentId,

    /// Short string displayed to next to the candidate, often the shortcut key or
    /// index
    JSString? label,

    /// Additional text describing the candidate
    JSString? annotation,

    /// The usage or detail description of word.
    SetCandidatesParametersCandidatesUsage? usage,
  );
}

@JS()
@staticInterop
@anonymous
class SetCandidatesParametersCandidatesUsage {
  external factory SetCandidatesParametersCandidatesUsage(
    /// The title string of details description.
    JSString title,

    /// The body string of detail description.
    JSString body,
  );
}