import 'src/internal_helpers.dart';
import 'src/js/events.dart' as $js;

export 'src/chrome.dart' show chrome;

final _events = ChromeEvents._();

extension ChromeEventsExtension on Chrome {
  ChromeEvents get events => _events;
}

class ChromeEvents {
  ChromeEvents._();
}

class Rule {
  Rule.fromJS(this._wrapped);

  Rule({
    String? id,
    List<String>? tags,
    required List<JSAny> conditions,
    required List<JSAny> actions,
    int? priority,
  }) : _wrapped = $js.Rule()
          ..id = id
          ..tags = throw UnimplementedError()
          ..conditions = throw UnimplementedError()
          ..actions = throw UnimplementedError()
          ..priority = priority;

  final $js.Rule _wrapped;

  $js.Rule get toJS => _wrapped;

  /// Optional identifier that allows referencing this rule.
  String? get id => _wrapped.id;
  set id(String? v) {
    _wrapped.id = v;
  }

  /// Tags can be used to annotate rules and perform operations on sets of
  /// rules.
  List<String>? get tags =>
      _wrapped.tags?.toDart.cast<String>().map((e) => e).toList();
  set tags(List<String>? v) {
    _wrapped.tags = throw UnimplementedError();
  }

  /// List of conditions that can trigger the actions.
  List<JSAny> get conditions =>
      _wrapped.conditions.toDart.cast<JSAny>().map((e) => e).toList();
  set conditions(List<JSAny> v) {
    _wrapped.conditions = throw UnimplementedError();
  }

  /// List of actions that are triggered if one of the conditions is fulfilled.
  List<JSAny> get actions =>
      _wrapped.actions.toDart.cast<JSAny>().map((e) => e).toList();
  set actions(List<JSAny> v) {
    _wrapped.actions = throw UnimplementedError();
  }

  /// Optional priority of this rule. Defaults to 100.
  int? get priority => _wrapped.priority;
  set priority(int? v) {
    _wrapped.priority = v;
  }
}

class Event {
  Event.fromJS(this._wrapped);

  Event() : _wrapped = $js.Event();

  final $js.Event _wrapped;

  $js.Event get toJS => _wrapped;

  /// Registers an event listener _callback_ to an event.
  void addListener(JFFunction callback) {
    _wrapped.addListener(callback);
  }

  /// Deregisters an event listener _callback_ from an event.
  void removeListener(JFFunction callback) {
    _wrapped.removeListener(callback);
  }

  bool hasListener(JFFunction callback) {
    return _wrapped.hasListener(callback);
  }

  bool hasListeners() {
    return _wrapped.hasListeners();
  }

  /// Registers rules to handle events.
  void addRules(
    String eventName,
    int webViewInstanceId,
    List<Rule> rules,
    JFFunction? callback,
  ) {
    _wrapped.addRules(
      eventName,
      webViewInstanceId,
      throw UnimplementedError(),
      callback,
    );
  }

  /// Returns currently registered rules.
  void getRules(
    String eventName,
    int webViewInstanceId,
    List<String>? ruleIdentifiers,
    JFFunction callback,
  ) {
    _wrapped.getRules(
      eventName,
      webViewInstanceId,
      throw UnimplementedError(),
      callback,
    );
  }

  /// Unregisters currently registered rules.
  void removeRules(
    String eventName,
    int webViewInstanceId,
    List<String>? ruleIdentifiers,
    JFFunction? callback,
  ) {
    _wrapped.removeRules(
      eventName,
      webViewInstanceId,
      throw UnimplementedError(),
      callback,
    );
  }
}

class UrlFilter {
  UrlFilter.fromJS(this._wrapped);

  UrlFilter({
    String? hostContains,
    String? hostEquals,
    String? hostPrefix,
    String? hostSuffix,
    String? pathContains,
    String? pathEquals,
    String? pathPrefix,
    String? pathSuffix,
    String? queryContains,
    String? queryEquals,
    String? queryPrefix,
    String? querySuffix,
    String? urlContains,
    String? urlEquals,
    String? urlMatches,
    String? originAndPathMatches,
    String? urlPrefix,
    String? urlSuffix,
    List<String>? schemes,
    List<JSAny>? ports,
  }) : _wrapped = $js.UrlFilter()
          ..hostContains = hostContains
          ..hostEquals = hostEquals
          ..hostPrefix = hostPrefix
          ..hostSuffix = hostSuffix
          ..pathContains = pathContains
          ..pathEquals = pathEquals
          ..pathPrefix = pathPrefix
          ..pathSuffix = pathSuffix
          ..queryContains = queryContains
          ..queryEquals = queryEquals
          ..queryPrefix = queryPrefix
          ..querySuffix = querySuffix
          ..urlContains = urlContains
          ..urlEquals = urlEquals
          ..urlMatches = urlMatches
          ..originAndPathMatches = originAndPathMatches
          ..urlPrefix = urlPrefix
          ..urlSuffix = urlSuffix
          ..schemes = throw UnimplementedError()
          ..ports = throw UnimplementedError();

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
    _wrapped.hostContains = v;
  }

  /// Matches if the host name of the URL is equal to a specified string.
  String? get hostEquals => _wrapped.hostEquals;
  set hostEquals(String? v) {
    _wrapped.hostEquals = v;
  }

  /// Matches if the host name of the URL starts with a specified string.
  String? get hostPrefix => _wrapped.hostPrefix;
  set hostPrefix(String? v) {
    _wrapped.hostPrefix = v;
  }

  /// Matches if the host name of the URL ends with a specified string.
  String? get hostSuffix => _wrapped.hostSuffix;
  set hostSuffix(String? v) {
    _wrapped.hostSuffix = v;
  }

  /// Matches if the path segment of the URL contains a specified string.
  String? get pathContains => _wrapped.pathContains;
  set pathContains(String? v) {
    _wrapped.pathContains = v;
  }

  /// Matches if the path segment of the URL is equal to a specified string.
  String? get pathEquals => _wrapped.pathEquals;
  set pathEquals(String? v) {
    _wrapped.pathEquals = v;
  }

  /// Matches if the path segment of the URL starts with a specified string.
  String? get pathPrefix => _wrapped.pathPrefix;
  set pathPrefix(String? v) {
    _wrapped.pathPrefix = v;
  }

  /// Matches if the path segment of the URL ends with a specified string.
  String? get pathSuffix => _wrapped.pathSuffix;
  set pathSuffix(String? v) {
    _wrapped.pathSuffix = v;
  }

  /// Matches if the query segment of the URL contains a specified string.
  String? get queryContains => _wrapped.queryContains;
  set queryContains(String? v) {
    _wrapped.queryContains = v;
  }

  /// Matches if the query segment of the URL is equal to a specified string.
  String? get queryEquals => _wrapped.queryEquals;
  set queryEquals(String? v) {
    _wrapped.queryEquals = v;
  }

  /// Matches if the query segment of the URL starts with a specified string.
  String? get queryPrefix => _wrapped.queryPrefix;
  set queryPrefix(String? v) {
    _wrapped.queryPrefix = v;
  }

  /// Matches if the query segment of the URL ends with a specified string.
  String? get querySuffix => _wrapped.querySuffix;
  set querySuffix(String? v) {
    _wrapped.querySuffix = v;
  }

  /// Matches if the URL (without fragment identifier) contains a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  String? get urlContains => _wrapped.urlContains;
  set urlContains(String? v) {
    _wrapped.urlContains = v;
  }

  /// Matches if the URL (without fragment identifier) is equal to a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  String? get urlEquals => _wrapped.urlEquals;
  set urlEquals(String? v) {
    _wrapped.urlEquals = v;
  }

  /// Matches if the URL (without fragment identifier) matches a specified
  /// regular expression. Port numbers are stripped from the URL if they match
  /// the default port number. The regular expressions use the [RE2
  /// syntax](https://github.com/google/re2/blob/master/doc/syntax.txt).
  String? get urlMatches => _wrapped.urlMatches;
  set urlMatches(String? v) {
    _wrapped.urlMatches = v;
  }

  /// Matches if the URL without query segment and fragment identifier matches a
  /// specified regular expression. Port numbers are stripped from the URL if
  /// they match the default port number. The regular expressions use the [RE2
  /// syntax](https://github.com/google/re2/blob/master/doc/syntax.txt).
  String? get originAndPathMatches => _wrapped.originAndPathMatches;
  set originAndPathMatches(String? v) {
    _wrapped.originAndPathMatches = v;
  }

  /// Matches if the URL (without fragment identifier) starts with a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  String? get urlPrefix => _wrapped.urlPrefix;
  set urlPrefix(String? v) {
    _wrapped.urlPrefix = v;
  }

  /// Matches if the URL (without fragment identifier) ends with a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  String? get urlSuffix => _wrapped.urlSuffix;
  set urlSuffix(String? v) {
    _wrapped.urlSuffix = v;
  }

  /// Matches if the scheme of the URL is equal to any of the schemes specified
  /// in the array.
  List<String>? get schemes =>
      _wrapped.schemes?.toDart.cast<String>().map((e) => e).toList();
  set schemes(List<String>? v) {
    _wrapped.schemes = throw UnimplementedError();
  }

  /// Matches if the port of the URL is contained in any of the specified port
  /// lists. For example `[80, 443, [1000, 1200]]` matches all requests on port
  /// 80, 443 and in the range 1000-1200.
  List<JSAny>? get ports =>
      _wrapped.ports?.toDart.cast<JSAny>().map((e) => e).toList();
  set ports(List<JSAny>? v) {
    _wrapped.ports = throw UnimplementedError();
  }
}
