import 'dart:js_interop';

import 'chrome.dart';
import 'input.dart';

export 'chrome.dart';
export 'input.dart';

extension JSChromeJSInputImeExtension on JSChromeInput {
  /// Use the `chrome.input.ime` API to implement a custom IME for Chrome OS.
  /// This allows your extension to handle keystrokes, set the composition, and
  /// manage the candidate window.
  external JSInputIme get ime;
}

@JS()
@staticInterop
class JSInputIme {}

extension JSInputImeExtension on JSInputIme {
  /// Set the current composition. If this extension does not own the active
  /// IME, this fails.
  external void setComposition(
    SetCompositionParameters parameters,
    JSFunction callback,
  );

  /// Clear the current composition. If this extension does not own the active
  /// IME, this fails.
  external void clearComposition(
    ClearCompositionParameters parameters,
    JSFunction callback,
  );

  /// Commits the provided text to the current input.
  external void commitText(
    CommitTextParameters parameters,
    JSFunction callback,
  );

  /// Sends the key events.  This function is expected to be used by virtual
  /// keyboards.  When key(s) on a virtual keyboard is pressed by a user, this
  /// function is used to propagate that event to the system.
  external void sendKeyEvents(
    SendKeyEventsParameters parameters,
    JSFunction callback,
  );

  /// Hides the input view window, which is popped up automatically by system.
  /// If the input view window is already hidden, this function will do nothing.
  external void hideInputView();

  /// Sets the properties of the candidate window. This fails if the extension
  /// doesn't own the active IME
  external void setCandidateWindowProperties(
    SetCandidateWindowPropertiesParameters parameters,
    JSFunction callback,
  );

  /// Sets the current candidate list. This fails if this extension doesn't own
  /// the active IME
  external void setCandidates(
    SetCandidatesParameters parameters,
    JSFunction callback,
  );

  /// Set the position of the cursor in the candidate window. This is a no-op if
  /// this extension does not own the active IME.
  external void setCursorPosition(
    SetCursorPositionParameters parameters,
    JSFunction callback,
  );

  /// Shows/Hides an assistive window with the given properties.
  external void setAssistiveWindowProperties(
    SetAssistiveWindowPropertiesParameters parameters,
    JSFunction callback,
  );

  /// Highlights/Unhighlights a button in an assistive window.
  external void setAssistiveWindowButtonHighlighted(
    SetAssistiveWindowButtonHighlightedParameters parameters,
    JSFunction callback,
  );

  /// Adds the provided menu items to the language menu when this IME is active.
  external void setMenuItems(
    MenuParameters parameters,
    JSFunction callback,
  );

  /// Updates the state of the MenuItems specified
  external void updateMenuItems(
    MenuParameters parameters,
    JSFunction callback,
  );

  /// Deletes the text around the caret.
  external void deleteSurroundingText(
    DeleteSurroundingTextParameters parameters,
    JSFunction callback,
  );

  /// Indicates that the key event received by onKeyEvent is handled.  This
  /// should only be called if the onKeyEvent listener is asynchronous.
  external void keyEventHandled(
    String requestId,
    bool response,
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

typedef KeyboardEventType = String;

/// Type of value this text field edits, (Text, Number, URL, etc)
typedef InputContextType = String;

/// The auto-capitalize type of the text field.
typedef AutoCapitalizeType = String;

/// The type of menu item. Radio buttons between separators are considered
/// grouped.
typedef MenuItemStyle = String;

/// The type of the underline to modify this segment.
typedef UnderlineStyle = String;

/// Where to display the candidate window. If set to 'cursor', the window
/// follows the cursor. If set to 'composition', the window is locked to the
/// beginning of the composition.
typedef WindowPosition = String;

/// The screen type under which the IME is activated.
typedef ScreenType = String;

/// Which mouse buttons was clicked.
typedef MouseButton = String;

/// Type of assistive window.
typedef AssistiveWindowType = String;

/// ID of buttons in assistive window.
typedef AssistiveWindowButton = String;

@JS()
@staticInterop
class KeyboardEvent {}

extension KeyboardEventExtension on KeyboardEvent {
  /// One of keyup or keydown.
  external KeyboardEventType type;

  /// (Deprecated) The ID of the request. Use the `requestId` param from the
  /// `onKeyEvent` event instead.
  external String? requestId;

  /// The extension ID of the sender of this keyevent.
  external String? extensionId;

  /// Value of the key being pressed
  external String key;

  /// Value of the physical key being pressed. The value is not affected by
  /// current keyboard layout or modifier state.
  external String code;

  /// The deprecated HTML keyCode, which is system- and implementation-dependent
  /// numerical code signifying the unmodified identifier associated with the
  /// key pressed.
  external int? keyCode;

  /// Whether or not the ALT key is pressed.
  external bool? altKey;

  /// Whether or not the ALTGR key is pressed.
  external bool? altgrKey;

  /// Whether or not the CTRL key is pressed.
  external bool? ctrlKey;

  /// Whether or not the SHIFT key is pressed.
  external bool? shiftKey;

  /// Whether or not the CAPS_LOCK is enabled.
  external bool? capsLock;
}

@JS()
@staticInterop
class InputContext {}

extension InputContextExtension on InputContext {
  /// This is used to specify targets of text field operations.  This ID becomes
  /// invalid as soon as onBlur is called.
  external int contextID;

  /// Type of value this text field edits, (Text, Number, URL, etc)
  external InputContextType type;

  /// Whether the text field wants auto-correct.
  external bool autoCorrect;

  /// Whether the text field wants auto-complete.
  external bool autoComplete;

  /// The auto-capitalize type of the text field.
  external AutoCapitalizeType autoCapitalize;

  /// Whether the text field wants spell-check.
  external bool spellCheck;

  /// Whether text entered into the text field should be used to improve typing
  /// suggestions for the user.
  external bool shouldDoLearning;
}

@JS()
@staticInterop
class MenuItem {}

extension MenuItemExtension on MenuItem {
  /// String that will be passed to callbacks referencing this MenuItem.
  external String id;

  /// Text displayed in the menu for this item.
  external String? label;

  /// The type of menu item.
  external MenuItemStyle? style;

  /// Indicates this item is visible.
  external bool? visible;

  /// Indicates this item should be drawn with a check.
  external bool? checked;

  /// Indicates this item is enabled.
  external bool? enabled;
}

@JS()
@staticInterop
class AssistiveWindowProperties {}

extension AssistiveWindowPropertiesExtension on AssistiveWindowProperties {
  external AssistiveWindowType type;

  /// Sets true to show AssistiveWindow, sets false to hide.
  external bool visible;

  /// Strings for ChromeVox to announce.
  external String? announceString;
}

@JS()
@staticInterop
class MenuParameters {}

extension MenuParametersExtension on MenuParameters {
  /// ID of the engine to use.
  external String engineID;

  /// MenuItems to add or update. They will be added in the order they exist in
  /// the array.
  external JSArray items;
}

@JS()
@staticInterop
class OnSurroundingTextChangedSurroundingInfo {}

extension OnSurroundingTextChangedSurroundingInfoExtension
    on OnSurroundingTextChangedSurroundingInfo {
  /// The text around the cursor. This is only a subset of all text in the input
  /// field.
  external String text;

  /// The ending position of the selection. This value indicates caret position
  /// if there is no selection.
  external int focus;

  /// The beginning position of the selection. This value indicates caret
  /// position if there is no selection.
  external int anchor;

  /// The offset position of `text`. Since `text` only includes a subset of text
  /// around the cursor, offset indicates the absolute position of the first
  /// character of `text`.
  external int offset;
}

@JS()
@staticInterop
class OnAssistiveWindowButtonClickedDetails {}

extension OnAssistiveWindowButtonClickedDetailsExtension
    on OnAssistiveWindowButtonClickedDetails {
  /// The ID of the button clicked.
  external AssistiveWindowButton buttonID;

  /// The type of the assistive window.
  external AssistiveWindowType windowType;
}

@JS()
@staticInterop
@anonymous
class SetCompositionParameters {
  external factory SetCompositionParameters({
    /// ID of the context where the composition text will be set
    int contextID,

    /// Text to set
    String text,

    /// Position in the text that the selection starts at.
    int? selectionStart,

    /// Position in the text that the selection ends at.
    int? selectionEnd,

    /// Position in the text of the cursor.
    int cursor,

    /// List of segments and their associated types.
    SetCompositionParametersSegments? segments,
  });
}

@JS()
@staticInterop
@anonymous
class ClearCompositionParameters {
  external factory ClearCompositionParameters(
      {
      /// ID of the context where the composition will be cleared
      int contextID});
}

@JS()
@staticInterop
@anonymous
class CommitTextParameters {
  external factory CommitTextParameters({
    /// ID of the context where the text will be committed
    int contextID,

    /// The text to commit
    String text,
  });
}

@JS()
@staticInterop
@anonymous
class SendKeyEventsParameters {
  external factory SendKeyEventsParameters({
    /// ID of the context where the key events will be sent, or zero to send key
    /// events to non-input field.
    int contextID,

    /// Data on the key event.
    JSArray keyData,
  });
}

@JS()
@staticInterop
@anonymous
class SetCandidateWindowPropertiesParameters {
  external factory SetCandidateWindowPropertiesParameters({
    /// ID of the engine to set properties on.
    String engineID,
    SetCandidateWindowPropertiesParametersProperties properties,
  });
}

@JS()
@staticInterop
@anonymous
class SetCandidatesParameters {
  external factory SetCandidatesParameters({
    /// ID of the context that owns the candidate window.
    int contextID,

    /// List of candidates to show in the candidate window
    SetCandidatesParametersCandidates candidates,
  });
}

@JS()
@staticInterop
@anonymous
class SetCursorPositionParameters {
  external factory SetCursorPositionParameters({
    /// ID of the context that owns the candidate window.
    int contextID,

    /// ID of the candidate to select.
    int candidateID,
  });
}

@JS()
@staticInterop
@anonymous
class SetAssistiveWindowPropertiesParameters {
  external factory SetAssistiveWindowPropertiesParameters({
    /// ID of the context owning the assistive window.
    int contextID,

    /// Properties of the assistive window.
    AssistiveWindowProperties properties,
  });
}

@JS()
@staticInterop
@anonymous
class SetAssistiveWindowButtonHighlightedParameters {
  external factory SetAssistiveWindowButtonHighlightedParameters({
    /// ID of the context owning the assistive window.
    int contextID,

    /// The ID of the button
    AssistiveWindowButton buttonID,

    /// The window type the button belongs to.
    AssistiveWindowType windowType,

    /// The text for the screenreader to announce.
    String? announceString,

    /// Whether the button should be highlighted.
    bool highlighted,
  });
}

@JS()
@staticInterop
@anonymous
class DeleteSurroundingTextParameters {
  external factory DeleteSurroundingTextParameters({
    /// ID of the engine receiving the event.
    String engineID,

    /// ID of the context where the surrounding text will be deleted.
    int contextID,

    /// The offset from the caret position where deletion will start. This value
    /// can be negative.
    int offset,

    /// The number of characters to be deleted
    int length,
  });
}

@JS()
@staticInterop
@anonymous
class SetCompositionParametersSegments {
  external factory SetCompositionParametersSegments({
    /// Index of the character to start this segment at
    int start,

    /// Index of the character to end this segment after.
    int end,

    /// The type of the underline to modify this segment.
    UnderlineStyle style,
  });
}

@JS()
@staticInterop
@anonymous
class SetCandidateWindowPropertiesParametersProperties {
  external factory SetCandidateWindowPropertiesParametersProperties({
    /// True to show the Candidate window, false to hide it.
    bool? visible,

    /// True to show the cursor, false to hide it.
    bool? cursorVisible,

    /// True if the candidate window should be rendered vertical, false to make it
    /// horizontal.
    bool? vertical,

    /// The number of candidates to display per page.
    int? pageSize,

    /// Text that is shown at the bottom of the candidate window.
    String? auxiliaryText,

    /// True to display the auxiliary text, false to hide it.
    bool? auxiliaryTextVisible,

    /// The total number of candidates for the candidate window.
    int? totalCandidates,

    /// The index of the current chosen candidate out of total candidates.
    int? currentCandidateIndex,

    /// Where to display the candidate window.
    WindowPosition? windowPosition,
  });
}

@JS()
@staticInterop
@anonymous
class SetCandidatesParametersCandidates {
  external factory SetCandidatesParametersCandidates({
    /// The candidate
    String candidate,

    /// The candidate's id
    int id,

    /// The id to add these candidates under
    int? parentId,

    /// Short string displayed to next to the candidate, often the shortcut key or
    /// index
    String? label,

    /// Additional text describing the candidate
    String? annotation,

    /// The usage or detail description of word.
    SetCandidatesParametersCandidatesUsage? usage,
  });
}

@JS()
@staticInterop
@anonymous
class SetCandidatesParametersCandidatesUsage {
  external factory SetCandidatesParametersCandidatesUsage({
    /// The title string of details description.
    String title,

    /// The body string of detail description.
    String body,
  });
}
