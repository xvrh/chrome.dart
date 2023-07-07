/* This file has been generated from omnibox.json - do not edit */

/**
 * The omnibox API allows you to register a keyword with Google Chrome's address
 * bar, which is also known as the omnibox.
 */
library chrome.omnibox;

import '../src/common.dart';

/**
 * Accessor for the `chrome.omnibox` namespace.
 */
final ChromeOmnibox omnibox = ChromeOmnibox._();

class ChromeOmnibox extends ChromeApi {
  JsObject get _omnibox => chrome['omnibox'];

  /**
   * User has started a keyword input session by typing the extension's keyword.
   * This is guaranteed to be sent exactly once per input session, and before
   * any onInputChanged events.
   */
  Stream get onInputStarted => _onInputStarted.stream;
  late ChromeStreamController _onInputStarted;

  /**
   * User has changed what is typed into the omnibox.
   */
  Stream<OnInputChangedEvent> get onInputChanged => _onInputChanged.stream;
  late ChromeStreamController<OnInputChangedEvent> _onInputChanged;

  /**
   * User has accepted what is typed into the omnibox.
   */
  Stream<OnInputEnteredEvent> get onInputEntered => _onInputEntered.stream;
  late ChromeStreamController<OnInputEnteredEvent> _onInputEntered;

  /**
   * User has ended the keyword input session without accepting the input.
   */
  Stream get onInputCancelled => _onInputCancelled.stream;
  late ChromeStreamController _onInputCancelled;

  /**
   * User has deleted a suggested result.
   */
  Stream<String> get onDeleteSuggestion => _onDeleteSuggestion.stream;
  late ChromeStreamController<String> _onDeleteSuggestion;

  ChromeOmnibox._() {
    var getApi = () => _omnibox;
    _onInputStarted = new ChromeStreamController.noArgs(getApi, 'onInputStarted');
    _onInputChanged = ChromeStreamController<OnInputChangedEvent>.twoArgs(getApi, 'onInputChanged', _createOnInputChangedEvent);
    _onInputEntered = ChromeStreamController<OnInputEnteredEvent>.twoArgs(getApi, 'onInputEntered', _createOnInputEnteredEvent);
    _onInputCancelled = new ChromeStreamController.noArgs(getApi, 'onInputCancelled');
    _onDeleteSuggestion = ChromeStreamController<String>.oneArg(getApi, 'onDeleteSuggestion', selfConverter);
  }

  bool get available => _omnibox != null;

  /**
   * A callback passed to the onInputChanged event used for sending suggestions
   * back to the browser.
   * 
   * [suggestResults] An array of suggest results
   */
  void sendSuggestions(int requestId, List<SuggestResult> suggestResults) {
    if (_omnibox == null) _throwNotAvailable();

    _omnibox.callMethod('sendSuggestions', [requestId, jsify(suggestResults)]);
  }

  /**
   * Sets the description and styling for the default suggestion. The default
   * suggestion is the text that is displayed in the first suggestion row
   * underneath the URL bar.
   * 
   * [suggestion] A partial SuggestResult object, without the 'content'
   * parameter.
   */
  void setDefaultSuggestion(DefaultSuggestResult suggestion) {
    if (_omnibox == null) _throwNotAvailable();

    _omnibox.callMethod('setDefaultSuggestion', [jsify(suggestion)]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.omnibox' is not available");
  }
}

/**
 * User has changed what is typed into the omnibox.
 */
class OnInputChangedEvent {
  final String text;

  /**
   * A callback passed to the onInputChanged event used for sending suggestions
   * back to the browser.
   */
  final Object suggest;

  OnInputChangedEvent(this.text, this.suggest);
}

/**
 * User has accepted what is typed into the omnibox.
 */
class OnInputEnteredEvent {
  final String text;

  final OnInputEnteredDisposition disposition;

  OnInputEnteredEvent(this.text, this.disposition);
}

/**
 * The style type.
 */
class DescriptionStyleType extends ChromeEnum {
  static const DescriptionStyleType URL = const DescriptionStyleType._('url');
  static const DescriptionStyleType MATCH = const DescriptionStyleType._('match');
  static const DescriptionStyleType DIM = const DescriptionStyleType._('dim');

  static const List<DescriptionStyleType> VALUES = const[URL, MATCH, DIM];

  const DescriptionStyleType._(String str): super(str);
}

/**
 * The window disposition for the omnibox query. This is the recommended context
 * to display results. For example, if the omnibox command is to navigate to a
 * certain URL, a disposition of 'newForegroundTab' means the navigation should
 * take place in a new selected tab.
 */
class OnInputEnteredDisposition extends ChromeEnum {
  static const OnInputEnteredDisposition CURRENT_TAB = const OnInputEnteredDisposition._('currentTab');
  static const OnInputEnteredDisposition NEW_FOREGROUND_TAB = const OnInputEnteredDisposition._('newForegroundTab');
  static const OnInputEnteredDisposition NEW_BACKGROUND_TAB = const OnInputEnteredDisposition._('newBackgroundTab');

  static const List<OnInputEnteredDisposition> VALUES = const[CURRENT_TAB, NEW_FOREGROUND_TAB, NEW_BACKGROUND_TAB];

  const OnInputEnteredDisposition._(String str): super(str);
}

/**
 * The style ranges for the description, as provided by the extension.
 */
class MatchClassification extends ChromeObject {
  MatchClassification({int? offset, DescriptionStyleType? type, int? length}) {
    if (offset != null) this.offset = offset;
    if (type != null) this.type = type;
    if (length != null) this.length = length;
  }
  MatchClassification.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get offset => jsProxy['offset'];
  set offset(int value) => jsProxy['offset'] = value;

  /**
   * The style type
   */
  DescriptionStyleType get type => _createDescriptionStyleType(jsProxy['type']);
  set type(DescriptionStyleType value) => jsProxy['type'] = jsify(value);

  int get length => jsProxy['length'];
  set length(int value) => jsProxy['length'] = value;
}

/**
 * A suggest result.
 */
class SuggestResult extends ChromeObject {
  SuggestResult({String? content, String? description, bool? deletable}) {
    if (content != null) this.content = content;
    if (description != null) this.description = description;
    if (deletable != null) this.deletable = deletable;
  }
  SuggestResult.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The text that is put into the URL bar, and that is sent to the extension
   * when the user chooses this entry.
   */
  String get content => jsProxy['content'];
  set content(String value) => jsProxy['content'] = value;

  /**
   * The text that is displayed in the URL dropdown. Can contain XML-style
   * markup for styling. The supported tags are 'url' (for a literal URL),
   * 'match' (for highlighting text that matched what the user's query), and
   * 'dim' (for dim helper text). The styles can be nested, eg.
   * <dim><match>dimmed match</match></dim>. You must escape the five predefined
   * entities to display them as text: stackoverflow.com/a/1091953/89484
   */
  String get description => jsProxy['description'];
  set description(String value) => jsProxy['description'] = value;

  /**
   * Whether the suggest result can be deleted by the user.
   */
  bool get deletable => jsProxy['deletable'];
  set deletable(bool value) => jsProxy['deletable'] = value;
}

/**
 * A suggest result.
 */
class DefaultSuggestResult extends ChromeObject {
  DefaultSuggestResult({String? description}) {
    if (description != null) this.description = description;
  }
  DefaultSuggestResult.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The text that is displayed in the URL dropdown. Can contain XML-style
   * markup for styling. The supported tags are 'url' (for a literal URL),
   * 'match' (for highlighting text that matched what the user's query), and
   * 'dim' (for dim helper text). The styles can be nested, eg.
   * <dim><match>dimmed match</match></dim>.
   */
  String get description => jsProxy['description'];
  set description(String value) => jsProxy['description'] = value;
}

OnInputChangedEvent _createOnInputChangedEvent(String text, JsObject suggest) =>
    OnInputChangedEvent(text, suggest);
OnInputEnteredEvent _createOnInputEnteredEvent(String text, JsObject disposition) =>
    OnInputEnteredEvent(text, _createOnInputEnteredDisposition(disposition));
DescriptionStyleType _createDescriptionStyleType(String value) => DescriptionStyleType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
OnInputEnteredDisposition _createOnInputEnteredDisposition(String value) => OnInputEnteredDisposition.VALUES.singleWhere((ChromeEnum e) => e.value == value);
