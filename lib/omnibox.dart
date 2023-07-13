import 'src/internal_helpers.dart';
import 'src/js/omnibox.dart' as $js;

export 'src/chrome.dart' show chrome;

final _omnibox = ChromeOmnibox._();

extension ChromeOmniboxExtension on Chrome {
  ChromeOmnibox get omnibox => _omnibox;
}

class ChromeOmnibox {
  ChromeOmnibox._();

  /// A callback passed to the onInputChanged event used for sending suggestions
  /// back to the browser.
  void sendSuggestions(
    int requestId,
    List<SuggestResult> suggestResults,
  ) {
    $js.chrome.omnibox.sendSuggestions(
      requestId,
      throw UnimplementedError(),
    );
  }

  /// Sets the description and styling for the default suggestion. The default
  /// suggestion is the text that is displayed in the first suggestion row
  /// underneath the URL bar.
  Future<void> setDefaultSuggestion(DefaultSuggestResult suggestion) {
    var $completer = Completer<void>();
    $js.chrome.omnibox.setDefaultSuggestion(
      suggestion.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// User has started a keyword input session by typing the extension's
  /// keyword. This is guaranteed to be sent exactly once per input session, and
  /// before any onInputChanged events.
  Stream<void> get onInputStarted => throw UnimplementedError();

  /// User has changed what is typed into the omnibox.
  Stream<OnInputChangedEvent> get onInputChanged => throw UnimplementedError();

  /// User has accepted what is typed into the omnibox.
  Stream<OnInputEnteredEvent> get onInputEntered => throw UnimplementedError();

  /// User has ended the keyword input session without accepting the input.
  Stream<void> get onInputCancelled => throw UnimplementedError();

  /// User has deleted a suggested result.
  Stream<String> get onDeleteSuggestion => throw UnimplementedError();
}

/// The style type.
enum DescriptionStyleType {
  url('url'),
  match('match'),
  dim('dim');

  const DescriptionStyleType(this.value);

  final String value;

  String get toJS => value;
  static DescriptionStyleType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The window disposition for the omnibox query. This is the recommended
/// context to display results. For example, if the omnibox command is to
/// navigate to a certain URL, a disposition of 'newForegroundTab' means the
/// navigation should take place in a new selected tab.
enum OnInputEnteredDisposition {
  currentTab('currentTab'),
  newForegroundTab('newForegroundTab'),
  newBackgroundTab('newBackgroundTab');

  const OnInputEnteredDisposition(this.value);

  final String value;

  String get toJS => value;
  static OnInputEnteredDisposition fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class MatchClassification {
  MatchClassification.fromJS(this._wrapped);

  MatchClassification({
    required int offset,
    required DescriptionStyleType type,
    int? length,
  }) : _wrapped = $js.MatchClassification()
          ..offset = offset
          ..type = type.toJS
          ..length = length;

  final $js.MatchClassification _wrapped;

  $js.MatchClassification get toJS => _wrapped;

  int get offset => _wrapped.offset;
  set offset(int v) {
    _wrapped.offset = v;
  }

  /// The style type
  DescriptionStyleType get type => DescriptionStyleType.fromJS(_wrapped.type);
  set type(DescriptionStyleType v) {
    _wrapped.type = v.toJS;
  }

  int? get length => _wrapped.length;
  set length(int? v) {
    _wrapped.length = v;
  }
}

class SuggestResult {
  SuggestResult.fromJS(this._wrapped);

  SuggestResult({
    required String content,
    required String description,
    bool? deletable,
    List<MatchClassification>? descriptionStyles,
  }) : _wrapped = $js.SuggestResult()
          ..content = content
          ..description = description
          ..deletable = deletable
          ..descriptionStyles = throw UnimplementedError();

  final $js.SuggestResult _wrapped;

  $js.SuggestResult get toJS => _wrapped;

  /// The text that is put into the URL bar, and that is sent to the extension
  /// when the user chooses this entry.
  String get content => _wrapped.content;
  set content(String v) {
    _wrapped.content = v;
  }

  /// The text that is displayed in the URL dropdown. Can contain XML-style
  /// markup for styling. The supported tags are 'url' (for a literal URL),
  /// 'match' (for highlighting text that matched what the user's query), and
  /// 'dim' (for dim helper text). The styles can be nested, eg.
  /// <dim><match>dimmed match</match></dim>. You must escape the five
  /// predefined entities to display them as text:
  /// stackoverflow.com/a/1091953/89484
  String get description => _wrapped.description;
  set description(String v) {
    _wrapped.description = v;
  }

  /// Whether the suggest result can be deleted by the user.
  bool? get deletable => _wrapped.deletable;
  set deletable(bool? v) {
    _wrapped.deletable = v;
  }

  /// An array of style ranges for the description, as provided by the
  /// extension.
  List<MatchClassification>? get descriptionStyles =>
      _wrapped.descriptionStyles?.toDart
          .cast<$js.MatchClassification>()
          .map((e) => MatchClassification.fromJS(e))
          .toList();
  set descriptionStyles(List<MatchClassification>? v) {
    _wrapped.descriptionStyles = throw UnimplementedError();
  }
}

class DefaultSuggestResult {
  DefaultSuggestResult.fromJS(this._wrapped);

  DefaultSuggestResult({
    required String description,
    List<MatchClassification>? descriptionStyles,
  }) : _wrapped = $js.DefaultSuggestResult()
          ..description = description
          ..descriptionStyles = throw UnimplementedError();

  final $js.DefaultSuggestResult _wrapped;

  $js.DefaultSuggestResult get toJS => _wrapped;

  /// The text that is displayed in the URL dropdown. Can contain XML-style
  /// markup for styling. The supported tags are 'url' (for a literal URL),
  /// 'match' (for highlighting text that matched what the user's query), and
  /// 'dim' (for dim helper text). The styles can be nested, eg.
  /// <dim><match>dimmed match</match></dim>.
  String get description => _wrapped.description;
  set description(String v) {
    _wrapped.description = v;
  }

  /// An array of style ranges for the description, as provided by the
  /// extension.
  List<MatchClassification>? get descriptionStyles =>
      _wrapped.descriptionStyles?.toDart
          .cast<$js.MatchClassification>()
          .map((e) => MatchClassification.fromJS(e))
          .toList();
  set descriptionStyles(List<MatchClassification>? v) {
    _wrapped.descriptionStyles = throw UnimplementedError();
  }
}

class OnInputChangedEvent {
  OnInputChangedEvent({
    required this.text,
    required this.suggest,
  });

  final String text;

  /// A callback passed to the onInputChanged event used for sending suggestions
  /// back to the browser.
  final JSFunction suggest;
}

class OnInputEnteredEvent {
  OnInputEnteredEvent({
    required this.text,
    required this.disposition,
  });

  final String text;

  final OnInputEnteredDisposition disposition;
}
