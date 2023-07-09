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
class Rule {
  /// Optional identifier that allows referencing this rule.
  external String? get id;

  /// Tags can be used to annotate rules and perform operations on sets of
  /// rules.
  external JSArray? get tags;

  /// List of conditions that can trigger the actions.
  external JSArray get conditions;

  /// List of actions that are triggered if one of the conditions is fulfilled.
  external JSArray get actions;

  /// Optional priority of this rule. Defaults to 100.
  external int? get priority;
}

@JS()
@staticInterop
class Event {}

@JS()
@staticInterop
class UrlFilter {
  /// Matches if the host name of the URL contains a specified string. To test
  /// whether a host name component has a prefix 'foo', use hostContains:
  /// '.foo'. This matches 'www.foobar.com' and 'foo.com', because an implicit
  /// dot is added at the beginning of the host name. Similarly, hostContains
  /// can be used to match against component suffix ('foo.') and to exactly
  /// match against components ('.foo.'). Suffix- and exact-matching for the
  /// last components need to be done separately using hostSuffix, because no
  /// implicit dot is added at the end of the host name.
  external String? get hostContains;

  /// Matches if the host name of the URL is equal to a specified string.
  external String? get hostEquals;

  /// Matches if the host name of the URL starts with a specified string.
  external String? get hostPrefix;

  /// Matches if the host name of the URL ends with a specified string.
  external String? get hostSuffix;

  /// Matches if the path segment of the URL contains a specified string.
  external String? get pathContains;

  /// Matches if the path segment of the URL is equal to a specified string.
  external String? get pathEquals;

  /// Matches if the path segment of the URL starts with a specified string.
  external String? get pathPrefix;

  /// Matches if the path segment of the URL ends with a specified string.
  external String? get pathSuffix;

  /// Matches if the query segment of the URL contains a specified string.
  external String? get queryContains;

  /// Matches if the query segment of the URL is equal to a specified string.
  external String? get queryEquals;

  /// Matches if the query segment of the URL starts with a specified string.
  external String? get queryPrefix;

  /// Matches if the query segment of the URL ends with a specified string.
  external String? get querySuffix;

  /// Matches if the URL (without fragment identifier) contains a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  external String? get urlContains;

  /// Matches if the URL (without fragment identifier) is equal to a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  external String? get urlEquals;

  /// Matches if the URL (without fragment identifier) matches a specified
  /// regular expression. Port numbers are stripped from the URL if they match
  /// the default port number. The regular expressions use the <a
  /// href="https://github.com/google/re2/blob/master/doc/syntax.txt">RE2
  /// syntax</a>.
  external String? get urlMatches;

  /// Matches if the URL without query segment and fragment identifier matches a
  /// specified regular expression. Port numbers are stripped from the URL if
  /// they match the default port number. The regular expressions use the <a
  /// href="https://github.com/google/re2/blob/master/doc/syntax.txt">RE2
  /// syntax</a>.
  external String? get originAndPathMatches;

  /// Matches if the URL (without fragment identifier) starts with a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  external String? get urlPrefix;

  /// Matches if the URL (without fragment identifier) ends with a specified
  /// string. Port numbers are stripped from the URL if they match the default
  /// port number.
  external String? get urlSuffix;

  /// Matches if the scheme of the URL is equal to any of the schemes specified
  /// in the array.
  external JSArray? get schemes;

  /// Matches if the port of the URL is contained in any of the specified port
  /// lists. For example `[80, 443, [1000, 1200]]` matches all requests on port
  /// 80, 443 and in the range 1000-1200.
  external JSArray? get ports;
}
