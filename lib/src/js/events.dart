import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSEventsExtension on JSChrome {
  /// The `chrome.events` namespace contains common types used by APIs
  /// dispatching events to notify you when something interesting happens.
  external JSEvents get events;
}

@JS()
@staticInterop
class JSEvents {}

extension JSEventsExtension on JSEvents {}

@JS()
@staticInterop
class Rule {}

extension RuleExtension on Rule {
  /// Optional identifier that allows referencing this rule.
  external JSString? get id;

  /// Tags can be used to annotate rules and perform operations on sets of
  /// rules.
  external JSArray? get tags;

  /// List of conditions that can trigger the actions.
  external JSArray get conditions;

  /// List of actions that are triggered if one of the conditions is fulfilled.
  external JSArray get actions;

  /// Optional priority of this rule. Defaults to 100.
  external JSNumber? get priority;
}

@JS()
@staticInterop
class Event {}

extension EventExtension on Event {
  /// Registers an event listener <em>callback</em> to an event.
  external void addListener(JSFunction callback);

  /// Deregisters an event listener <em>callback</em> from an event.
  external void removeListener(JSFunction callback);

  external JSBoolean hasListener(JSFunction callback);

  external JSBoolean hasListeners();

  /// Registers rules to handle events.
  external void addRules(
    JSString eventName,
    JSNumber webViewInstanceId,
    JSArray rules,
    JSFunction? callback,
  );

  /// Returns currently registered rules.
  external void getRules(
    JSString eventName,
    JSNumber webViewInstanceId,
    JSArray? ruleIdentifiers,
    JSFunction callback,
  );

  /// Unregisters currently registered rules.
  external void removeRules(
    JSString eventName,
    JSNumber webViewInstanceId,
    JSArray? ruleIdentifiers,
    JSFunction? callback,
  );
}

@JS()
@staticInterop
class UrlFilter {}

extension UrlFilterExtension on UrlFilter {
  /// Matches if the host name of the URL contains a specified string. To test
  /// whether a host name component has a prefix 'foo', use hostContains:
  /// '.foo'. This matches 'www.foobar.com' and 'foo.com', because an implicit
  /// dot is added at the beginning of the host name. Similarly, hostContains
  /// can be used to match against component suffix ('foo.') and to exactly
  /// match against components ('.foo.'). Suffix- and exact-matching for the
  /// last components need to be done separately using hostSuffix, because no
  /// implicit dot is added at the end of the host name.
  external JSString? get hostContains;

  /// Matches if the host name of the URL is equal to a specified string.
  external JSString? get hostEquals;

  /// Matches if the host name of the URL starts with a specified string.
  external JSString? get hostPrefix;

  /// Matches if the host name of the URL ends with a specified string.
  external JSString? get hostSuffix;

  /// Matches if the path segment of the URL contains a specified string.
  external JSString? get pathContains;

  /// Matches if the path segment of the URL is equal to a specified string.
  external JSString? get pathEquals;

  /// Matches if the path segment of the URL starts with a specified string.
  external JSString? get pathPrefix;

  /// Matches if the path segment of the URL ends with a specified string.
  external JSString? get pathSuffix;

  /// Matches if the query segment of the URL contains a specified string.
  external JSString? get queryContains;

  /// Matches if the query segment of the URL is equal to a specified string.
  external JSString? get queryEquals;

  /// Matches if the query segment of the URL starts with a specified string.
  external JSString? get queryPrefix;

  /// Matches if the query segment of the URL ends with a specified string.
  external JSString? get querySuffix;

  /// Matches if the URL (without fragment identifier) contains a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  external JSString? get urlContains;

  /// Matches if the URL (without fragment identifier) is equal to a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  external JSString? get urlEquals;

  /// Matches if the URL (without fragment identifier) matches a specified
  /// regular expression. Port numbers are stripped from the URL if they match
  /// the default port number. The regular expressions use the <a
  /// href="https://github.com/google/re2/blob/master/doc/syntax.txt">RE2
  /// syntax</a>.
  external JSString? get urlMatches;

  /// Matches if the URL without query segment and fragment identifier matches a
  /// specified regular expression. Port numbers are stripped from the URL if
  /// they match the default port number. The regular expressions use the <a
  /// href="https://github.com/google/re2/blob/master/doc/syntax.txt">RE2
  /// syntax</a>.
  external JSString? get originAndPathMatches;

  /// Matches if the URL (without fragment identifier) starts with a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  external JSString? get urlPrefix;

  /// Matches if the URL (without fragment identifier) ends with a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  external JSString? get urlSuffix;

  /// Matches if the scheme of the URL is equal to any of the schemes specified
  /// in the array.
  external JSArray? get schemes;

  /// Matches if the port of the URL is contained in any of the specified port
  /// lists. For example `[80, 443, [1000, 1200]]` matches all requests on port
  /// 80, 443 and in the range 1000-1200.
  external JSArray? get ports;
}
