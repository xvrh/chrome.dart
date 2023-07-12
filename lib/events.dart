import 'src/internal_helpers.dart';
import 'src/js/events.dart' as $js;
export 'chrome.dart';

final _events = ChromeEvents._();

extension ChromeEventsExtension on Chrome {
  ChromeEvents get events => _events;
}

class ChromeEvents {
  ChromeEvents._();
}

class Rule {
  Rule.fromJS(this._wrapped);

  final $js.Rule _wrapped;

  $js.Rule get toJS => _wrapped;

  /// Optional identifier that allows referencing this rule.
  String? get id => _wrapped.id;
  set id(String? v) {
    throw UnimplementedError();
  }

  /// Tags can be used to annotate rules and perform operations on sets of
  /// rules.
  List<String>? get tags => throw UnimplementedError();
  set tags(List<String>? v) {
    throw UnimplementedError();
  }

  /// List of conditions that can trigger the actions.
  List<JSAny> get conditions => throw UnimplementedError();
  set conditions(List<JSAny> v) {
    throw UnimplementedError();
  }

  /// List of actions that are triggered if one of the conditions is fulfilled.
  List<JSAny> get actions => throw UnimplementedError();
  set actions(List<JSAny> v) {
    throw UnimplementedError();
  }

  /// Optional priority of this rule. Defaults to 100.
  int? get priority => _wrapped.priority;
  set priority(int? v) {
    throw UnimplementedError();
  }
}

class Event {
  Event.fromJS(this._wrapped);

  final $js.Event _wrapped;

  $js.Event get toJS => _wrapped;

  /// Registers an event listener _callback_ to an event.
  void addListener(JSAny callback) => throw UnimplementedError();

  /// Deregisters an event listener _callback_ from an event.
  void removeListener(JSAny callback) => throw UnimplementedError();

  bool hasListener(JSAny callback) => throw UnimplementedError();

  bool hasListeners() => throw UnimplementedError();

  /// Registers rules to handle events.
  void addRules(
    String eventName,
    int webViewInstanceId,
    List<Rule> rules,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Returns currently registered rules.
  void getRules(
    String eventName,
    int webViewInstanceId,
    List<String>? ruleIdentifiers,
    JSAny callback,
  ) =>
      throw UnimplementedError();

  /// Unregisters currently registered rules.
  void removeRules(
    String eventName,
    int webViewInstanceId,
    List<String>? ruleIdentifiers,
    JSAny? callback,
  ) =>
      throw UnimplementedError();
}

class UrlFilter {
  UrlFilter.fromJS(this._wrapped);

  final $js.UrlFilter _wrapped;

  $js.UrlFilter get toJS => _wrapped;

  /// Matches if the host name of the URL contains a specified string. To test
  /// whether a host name component has a prefix 'foo', use hostContains:
  /// '.foo'. This matches 'www.foobar.com' and 'foo.com', because an implicit
  /// dot is added at the beginning of the host name. Similarly, hostContains
  /// can be used to match against component suffix ('foo.') and to exactly
  /// match against components ('.foo.'). Suffix- and exact-matching for the
  /// last components need to be done separately using hostSuffix, because no
  /// implicit dot is added at the end of the host name.
  String? get hostContains => _wrapped.hostContains;
  set hostContains(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the host name of the URL is equal to a specified string.
  String? get hostEquals => _wrapped.hostEquals;
  set hostEquals(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the host name of the URL starts with a specified string.
  String? get hostPrefix => _wrapped.hostPrefix;
  set hostPrefix(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the host name of the URL ends with a specified string.
  String? get hostSuffix => _wrapped.hostSuffix;
  set hostSuffix(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the path segment of the URL contains a specified string.
  String? get pathContains => _wrapped.pathContains;
  set pathContains(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the path segment of the URL is equal to a specified string.
  String? get pathEquals => _wrapped.pathEquals;
  set pathEquals(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the path segment of the URL starts with a specified string.
  String? get pathPrefix => _wrapped.pathPrefix;
  set pathPrefix(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the path segment of the URL ends with a specified string.
  String? get pathSuffix => _wrapped.pathSuffix;
  set pathSuffix(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the query segment of the URL contains a specified string.
  String? get queryContains => _wrapped.queryContains;
  set queryContains(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the query segment of the URL is equal to a specified string.
  String? get queryEquals => _wrapped.queryEquals;
  set queryEquals(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the query segment of the URL starts with a specified string.
  String? get queryPrefix => _wrapped.queryPrefix;
  set queryPrefix(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the query segment of the URL ends with a specified string.
  String? get querySuffix => _wrapped.querySuffix;
  set querySuffix(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the URL (without fragment identifier) contains a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  String? get urlContains => _wrapped.urlContains;
  set urlContains(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the URL (without fragment identifier) is equal to a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  String? get urlEquals => _wrapped.urlEquals;
  set urlEquals(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the URL (without fragment identifier) matches a specified
  /// regular expression. Port numbers are stripped from the URL if they match
  /// the default port number. The regular expressions use the [RE2
  /// syntax](https://github.com/google/re2/blob/master/doc/syntax.txt).
  String? get urlMatches => _wrapped.urlMatches;
  set urlMatches(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the URL without query segment and fragment identifier matches a
  /// specified regular expression. Port numbers are stripped from the URL if
  /// they match the default port number. The regular expressions use the [RE2
  /// syntax](https://github.com/google/re2/blob/master/doc/syntax.txt).
  String? get originAndPathMatches => _wrapped.originAndPathMatches;
  set originAndPathMatches(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the URL (without fragment identifier) starts with a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  String? get urlPrefix => _wrapped.urlPrefix;
  set urlPrefix(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the URL (without fragment identifier) ends with a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  String? get urlSuffix => _wrapped.urlSuffix;
  set urlSuffix(String? v) {
    throw UnimplementedError();
  }

  /// Matches if the scheme of the URL is equal to any of the schemes specified
  /// in the array.
  List<String>? get schemes => throw UnimplementedError();
  set schemes(List<String>? v) {
    throw UnimplementedError();
  }

  /// Matches if the port of the URL is contained in any of the specified port
  /// lists. For example `[80, 443, [1000, 1200]]` matches all requests on port
  /// 80, 443 and in the range 1000-1200.
  List<JSAny>? get ports => throw UnimplementedError();
  set ports(List<JSAny>? v) {
    throw UnimplementedError();
  }
}
