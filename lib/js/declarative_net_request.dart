import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDeclarativeNetRequestExtension on JSChrome {
  ///  The `chrome.declarativeNetRequest` API is used to block or modify
  ///  network requests by specifying declarative rules. This lets extensions
  ///  modify network requests without intercepting them and viewing their
  /// content,
  ///  thus providing more privacy.
  external JSDeclarativeNetRequest get declarativeNetRequest;
}

@JS()
@staticInterop
class JSDeclarativeNetRequest {}

extension JSDeclarativeNetRequestExtension on JSDeclarativeNetRequest {
  ///  Modifies the current set of dynamic rules for the extension.
  ///  The rules with IDs listed in `options.removeRuleIds` are first
  ///  removed, and then the rules given in `options.addRules` are
  ///  added. Notes:
  ///  <ul>
  ///  <li>This update happens as a single atomic operation: either all
  ///  specified rules are added and removed, or an error is returned.</li>
  ///  <li>These rules are persisted across browser sessions and across
  ///  extension updates.</li>
  ///  <li>Static rules specified as part of the extension package can not be
  ///  removed using this function.</li>
  ///  <li>$(ref:MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES) is the maximum number
  ///  of combined dynamic and session rules an extension can add.</li>
  ///  </ul>
  ///  |callback|: Called once the update is complete or has failed. In case of
  ///  an error, $(ref:runtime.lastError) will be set and no change will be made
  ///  to the rule set. This can happen for multiple reasons, such as invalid
  ///  rule format, duplicate rule ID, rule count limit exceeded, internal
  ///  errors, and others.
  external void updateDynamicRules(
    options,
    callback,
  );

  ///  Returns the current set of dynamic rules for the extension. Callers can
  ///  optionally filter the list of fetched rules by specifying a
  ///  `filter`.
  ///  |filter|: An object to filter the list of fetched rules.
  ///  |callback|: Called with the set of dynamic rules. An error might be
  ///  raised in case of transient internal errors.
  external void getDynamicRules(
    filter,
    callback,
  );

  ///  Modifies the current set of session scoped rules for the extension.
  ///  The rules with IDs listed in `options.removeRuleIds` are first
  ///  removed, and then the rules given in `options.addRules` are
  ///  added. Notes:
  ///  <ul>
  ///  <li>This update happens as a single atomic operation: either all
  ///  specified rules are added and removed, or an error is returned.</li>
  ///  <li>These rules are not persisted across sessions and are backed in
  ///  memory.</li>
  ///  <li>$(ref:MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES) is the maximum number
  ///  of combined dynamic and session rules an extension can add.</li>
  ///  </ul>
  ///  |callback|: Called once the update is complete or has failed. In case of
  ///  an error, $(ref:runtime.lastError) will be set and no change will be made
  ///  to the rule set. This can happen for multiple reasons, such as invalid
  ///  rule format, duplicate rule ID, rule count limit exceeded, and others.
  external void updateSessionRules(
    options,
    callback,
  );

  ///  Returns the current set of session scoped rules for the extension.
  ///  Callers can optionally filter the list of fetched rules by specifying a
  ///  `filter`.
  ///  |filter|: An object to filter the list of fetched rules.
  ///  |callback|: Called with the set of session scoped rules.
  external void getSessionRules(
    filter,
    callback,
  );

  ///  Updates the set of enabled static rulesets for the extension. The
  ///  rulesets with IDs listed in `options.disableRulesetIds` are
  ///  first removed, and then the rulesets listed in
  ///  `options.enableRulesetIds` are added.<br/>
  ///  Note that the set of enabled static rulesets is persisted across sessions
  ///  but not across extension updates, i.e. the `rule_resources`
  ///  manifest key will determine the set of enabled static rulesets on each
  ///  extension update.
  ///  |callback|: Called once the update is complete. In case of an error,
  ///  $(ref:runtime.lastError) will be set and no change will be made to set of
  ///  enabled rulesets. This can happen for multiple reasons, such as invalid
  ///  ruleset IDs, rule count limit exceeded, or internal errors.
  external void updateEnabledRulesets(
    options,
    callback,
  );

  ///  Returns the ids for the current set of enabled static rulesets.
  ///  |callback|: Called with a list of ids, where each id corresponds to an
  ///  enabled static $(ref:Ruleset).
  external void getEnabledRulesets(callback);

  ///  Disables and enables individual static rules in a $(ref:Ruleset).
  ///  Changes to rules belonging to a disabled $(ref:Ruleset) will take
  ///  effect the next time that it becomes enabled.
  ///  |callback|: Called once the update is complete. In case of an error,
  ///  $(ref:runtime.lastError) will be set and no change will be made to the
  ///  enabled static rules.
  external void updateStaticRules(
    options,
    callback,
  );

  ///  Returns the list of static rules in the given $(ref:Ruleset) that are
  ///  currently disabled.
  ///  |options|: Specifies the ruleset to query.
  ///  |callback|: Called with a list of ids that correspond to the disabled
  ///  rules in that ruleset.
  external void getDisabledRuleIds(
    options,
    callback,
  );

  ///  Returns all rules matched for the extension. Callers can optionally
  ///  filter the list of matched rules by specifying a `filter`.
  ///  This method is only available to extensions with the
  ///  `declarativeNetRequestFeedback` permission or having the
  ///  `activeTab` permission granted for the `tabId`
  ///  specified in `filter`.
  ///  Note: Rules not associated with an active document that were matched more
  ///  than five minutes ago will not be returned.
  ///  |filter|: An object to filter the list of matched rules.
  ///  |callback|: Called once the list of matched rules has been fetched. In
  ///  case of an error, $(ref:runtime.lastError) will be set and no rules will
  ///  be returned. This can happen for multiple reasons, such as insufficient
  ///  permissions, or exceeding the quota.
  external void getMatchedRules(
    filter,
    callback,
  );

  ///  Configures if the action count for tabs should be displayed as the
  ///  extension action's badge text and provides a way for that action count to
  ///  be incremented.
  external void setExtensionActionOptions(
    options,
    callback,
  );

  ///  Checks if the given regular expression will be supported as a
  ///  `regexFilter` rule condition.
  ///  |regexOptions|: The regular expression to check.
  ///  |callback|: Called with details consisting of whether the regular
  ///  expression is supported and the reason if not.
  external void isRegexSupported(
    regexOptions,
    callback,
  );

  ///  Returns the number of static rules an extension can enable before the
  ///  <a href="#global-static-rule-limit">global static rule limit</a> is
  ///  reached.
  external void getAvailableStaticRuleCount(callback);

  ///  Checks if any of the extension's declarativeNetRequest rules would match
  ///  a hypothetical request.
  ///  Note: Only available for unpacked extensions as this is only intended to
  ///  be used during extension development.
  ///  |requestDetails|: The request details to test.
  ///  |callback|: Called with the details of matched rules.
  external void testMatchOutcome(
    request,
    callback,
  );

  ///  Fired when a rule is matched with a request. Only available for unpacked
  ///  extensions with the `declarativeNetRequestFeedback` permission
  ///  as this is intended to be used for debugging purposes only.
  ///  |info|: The rule that has been matched along with information about the
  ///  associated request.
  external ChromeEvent get onRuleMatchedDebug;
}

@JS()
@staticInterop
class Ruleset {
  ///  A non-empty string uniquely identifying the ruleset. IDs beginning with
  ///  '_' are reserved for internal use.
  external JSAny get id;

  ///  The path of the JSON ruleset relative to the extension directory.
  external JSAny get path;

  ///  Whether the ruleset is enabled by default.
  external JSAny get enabled;
}

@JS()
@staticInterop
class QueryKeyValue {
  external JSAny get key;

  external JSAny get value;

  ///  If true, the query key is replaced only if it's already present.
  ///  Otherwise, the key is also added if it's missing. Defaults to false.
  external JSAny? get replaceOnly;
}

@JS()
@staticInterop
class QueryTransform {
  ///  The list of query keys to be removed.
  external JSArray? get removeParams;

  ///  The list of query key-value pairs to be added or replaced.
  external JSArray? get addOrReplaceParams;
}

@JS()
@staticInterop
class URLTransform {
  ///  The new scheme for the request. Allowed values are "http", "https",
  ///  "ftp" and "chrome-extension".
  external JSAny? get scheme;

  ///  The new host for the request.
  external JSAny? get host;

  ///  The new port for the request. If empty, the existing port is cleared.
  external JSAny? get port;

  ///  The new path for the request. If empty, the existing path is cleared.
  external JSAny? get path;

  ///  The new query for the request. Should be either empty, in which case the
  ///  existing query is cleared; or should begin with '?'.
  external JSAny? get query;

  ///  Add, remove or replace query key-value pairs.
  external JSAny? get queryTransform;

  ///  The new fragment for the request. Should be either empty, in which case
  ///  the existing fragment is cleared; or should begin with '#'.
  external JSAny? get fragment;

  ///  The new username for the request.
  external JSAny? get username;

  ///  The new password for the request.
  external JSAny? get password;
}

@JS()
@staticInterop
class Redirect {
  ///  Path relative to the extension directory. Should start with '/'.
  external JSAny? get extensionPath;

  ///  Url transformations to perform.
  external JSAny? get transform;

  ///  The redirect url. Redirects to JavaScript urls are not allowed.
  external JSAny? get url;

  ///  Substitution pattern for rules which specify a `regexFilter`.
  ///  The first match of `regexFilter` within the url will be
  ///  replaced with this pattern. Within `regexSubstitution`,
  ///  backslash-escaped digits (\1 to \9) can be used to insert the
  ///  corresponding capture groups. \0 refers to the entire matching text.
  external JSAny? get regexSubstitution;
}

@JS()
@staticInterop
class RuleCondition {
  ///  The pattern which is matched against the network request url.
  ///  Supported constructs:
  ///
  ///  <b>'*'</b>  : Wildcard: Matches any number of characters.
  ///
  ///  <b>'|'</b>  : Left/right anchor: If used at either end of the pattern,
  ///                specifies the beginning/end of the url respectively.
  ///
  ///  <b>'||'</b> : Domain name anchor: If used at the beginning of the
  /// pattern,
  ///                specifies the start of a (sub-)domain of the URL.
  ///
  ///  <b>'^'</b>  : Separator character: This matches anything except a letter,
  /// a
  ///                digit or one of the following: _ - . %. This can also match
  ///                the end of the URL.
  ///
  ///  Therefore `urlFilter` is composed of the following parts:
  ///  (optional Left/Domain name anchor) + pattern + (optional Right anchor).
  ///
  ///  If omitted, all urls are matched. An empty string is not allowed.
  ///
  ///  A pattern beginning with `||*` is not allowed. Use
  ///  `*` instead.
  ///
  ///  Note: Only one of `urlFilter` or `regexFilter` can
  ///  be specified.
  ///
  ///  Note: The `urlFilter` must be composed of only ASCII
  ///  characters. This is matched against a url where the host is encoded in
  ///  the punycode format (in case of internationalized domains) and any other
  ///  non-ascii characters are url encoded in utf-8.
  ///  For example, when the request url is
  ///  http://abc.&#x0440;&#x0444;?q=&#x0444;, the
  ///  `urlFilter` will be matched against the url
  ///  http://abc.xn--p1ai/?q=%D1%84.
  external JSAny? get urlFilter;

  ///  Regular expression to match against the network request url. This follows
  ///  the <a href = "https://github.com/google/re2/wiki/Syntax">RE2 syntax</a>.
  ///
  ///  Note: Only one of `urlFilter` or `regexFilter` can
  ///  be specified.
  ///
  ///  Note: The `regexFilter` must be composed of only ASCII
  ///  characters. This is matched against a url where the host is encoded in
  ///  the punycode format (in case of internationalized domains) and any other
  ///  non-ascii characters are url encoded in utf-8.
  external JSAny? get regexFilter;

  ///  Whether the `urlFilter` or `regexFilter`
  ///  (whichever is specified) is case sensitive. Default is true.
  external JSAny? get isUrlFilterCaseSensitive;

  ///  The rule will only match network requests originating from the list of
  ///  `initiatorDomains`. If the list is omitted, the rule is
  ///  applied to requests from all domains. An empty list is not allowed.
  ///
  ///  Notes:
  ///  <ul>
  ///   <li>Sub-domains like "a.example.com" are also allowed.</li>
  ///   <li>The entries must consist of only ascii characters.</li>
  ///   <li>Use punycode encoding for internationalized domains.</li>
  ///   <li>
  ///     This matches against the request initiator and not the request url.
  ///   </li>
  ///   <li>Sub-domains of the listed domains are also matched.</li>
  ///  </ul>
  external JSArray? get initiatorDomains;

  ///  The rule will not match network requests originating from the list of
  ///  `excludedInitiatorDomains`. If the list is empty or omitted,
  ///  no domains are excluded. This takes precedence over
  ///  `initiatorDomains`.
  ///
  ///  Notes:
  ///  <ul>
  ///   <li>Sub-domains like "a.example.com" are also allowed.</li>
  ///   <li>The entries must consist of only ascii characters.</li>
  ///   <li>Use punycode encoding for internationalized domains.</li>
  ///   <li>
  ///     This matches against the request initiator and not the request url.
  ///   </li>
  ///   <li>Sub-domains of the listed domains are also excluded.</li>
  ///  </ul>
  external JSArray? get excludedInitiatorDomains;

  ///  The rule will only match network requests when the domain matches one
  ///  from the list of `requestDomains`. If the list is omitted,
  ///  the rule is applied to requests from all domains. An empty list is not
  ///  allowed.
  ///
  ///  Notes:
  ///  <ul>
  ///   <li>Sub-domains like "a.example.com" are also allowed.</li>
  ///   <li>The entries must consist of only ascii characters.</li>
  ///   <li>Use punycode encoding for internationalized domains.</li>
  ///   <li>Sub-domains of the listed domains are also matched.</li>
  ///  </ul>
  external JSArray? get requestDomains;

  ///  The rule will not match network requests when the domains matches one
  ///  from the list of `excludedRequestDomains`. If the list is
  ///  empty or omitted, no domains are excluded. This takes precedence over
  ///  `requestDomains`.
  ///
  ///  Notes:
  ///  <ul>
  ///   <li>Sub-domains like "a.example.com" are also allowed.</li>
  ///   <li>The entries must consist of only ascii characters.</li>
  ///   <li>Use punycode encoding for internationalized domains.</li>
  ///   <li>Sub-domains of the listed domains are also excluded.</li>
  ///  </ul>
  external JSArray? get excludedRequestDomains;

  ///  The rule will only match network requests originating from the list of
  ///  `domains`.
  external JSArray? get domains;

  ///  The rule will not match network requests originating from the list of
  ///  `excludedDomains`.
  external JSArray? get excludedDomains;

  ///  List of resource types which the rule can match. An empty list is not
  ///  allowed.
  ///
  ///  Note: this must be specified for `allowAllRequests` rules and
  ///  may only include the `sub_frame` and `main_frame`
  ///  resource types.
  external JSArray? get resourceTypes;

  ///  List of resource types which the rule won't match. Only one of
  ///  `resourceTypes` and `excludedResourceTypes` should
  ///  be specified. If neither of them is specified, all resource types except
  ///  "main_frame" are blocked.
  external JSArray? get excludedResourceTypes;

  ///  List of HTTP request methods which the rule can match. An empty list is
  ///  not allowed.
  ///
  ///  Note: Specifying a `requestMethods` rule condition will also
  ///  exclude non-HTTP(s) requests, whereas specifying
  ///  `excludedRequestMethods` will not.
  external JSArray? get requestMethods;

  ///  List of request methods which the rule won't match. Only one of
  ///  `requestMethods` and `excludedRequestMethods`
  ///  should be specified. If neither of them is specified, all request methods
  ///  are matched.
  external JSArray? get excludedRequestMethods;

  ///  Specifies whether the network request is first-party or third-party to
  ///  the domain from which it originated. If omitted, all requests are
  ///  accepted.
  external JSAny? get domainType;

  ///  List of $(ref:tabs.Tab.id) which the rule should match. An ID of
  ///  $(ref:tabs.TAB_ID_NONE) matches requests which don't originate from a
  ///  tab. An empty list is not allowed. Only supported for session-scoped
  ///  rules.
  external JSArray? get tabIds;

  ///  List of $(ref:tabs.Tab.id) which the rule should not match. An ID of
  ///  $(ref:tabs.TAB_ID_NONE) excludes requests which don't originate from a
  ///  tab. Only supported for session-scoped rules.
  external JSArray? get excludedTabIds;
}

@JS()
@staticInterop
class ModifyHeaderInfo {
  ///  The name of the header to be modified.
  external JSAny get header;

  ///  The operation to be performed on a header.
  external JSAny get operation;

  ///  The new value for the header. Must be specified for `append`
  ///  and `set` operations.
  external JSAny? get value;
}

@JS()
@staticInterop
class RuleAction {
  ///  The type of action to perform.
  external JSAny get type;

  ///  Describes how the redirect should be performed. Only valid for redirect
  ///  rules.
  external JSAny? get redirect;

  ///  The request headers to modify for the request. Only valid if
  ///  RuleActionType is "modifyHeaders".
  external JSArray? get requestHeaders;

  ///  The response headers to modify for the request. Only valid if
  ///  RuleActionType is "modifyHeaders".
  external JSArray? get responseHeaders;
}

@JS()
@staticInterop
class Rule {
  ///  An id which uniquely identifies a rule. Mandatory and should be >= 1.
  external JSAny get id;

  ///  Rule priority. Defaults to 1. When specified, should be >= 1.
  external JSAny? get priority;

  ///  The condition under which this rule is triggered.
  external JSAny get condition;

  ///  The action to take if this rule is matched.
  external JSAny get action;
}

@JS()
@staticInterop
class MatchedRule {
  ///  A matching rule's ID.
  external JSAny get ruleId;

  ///  ID of the $(ref:Ruleset) this rule belongs to. For a rule originating
  ///  from the set of dynamic rules, this will be equal to
  ///  $(ref:DYNAMIC_RULESET_ID).
  external JSAny get rulesetId;
}

@JS()
@staticInterop
class GetRulesFilter {
  ///  If specified, only rules with matching IDs are included.
  external JSArray? get ruleIds;
}

@JS()
@staticInterop
class MatchedRuleInfo {
  external JSAny get rule;

  ///  The time the rule was matched. Timestamps will correspond to the
  ///  Javascript convention for times, i.e. number of milliseconds since the
  ///  epoch.
  external JSAny get timeStamp;

  ///  The tabId of the tab from which the request originated if the tab is
  ///  still active. Else -1.
  external JSAny get tabId;
}

@JS()
@staticInterop
class MatchedRulesFilter {
  ///  If specified, only matches rules for the given tab. Matches rules not
  ///  associated with any active tab if set to -1.
  external JSAny? get tabId;

  ///  If specified, only matches rules after the given timestamp.
  external JSAny? get minTimeStamp;
}

@JS()
@staticInterop
class RulesMatchedDetails {
  ///  Rules matching the given filter.
  external JSArray get rulesMatchedInfo;
}

@JS()
@staticInterop
class RequestDetails {
  ///  The ID of the request. Request IDs are unique within a browser session.
  external JSAny get requestId;

  ///  The URL of the request.
  external JSAny get url;

  ///  The origin where the request was initiated. This does not change through
  ///  redirects. If this is an opaque origin, the string 'null' will be used.
  external JSAny? get initiator;

  ///  Standard HTTP method.
  external JSAny get method;

  ///  The value 0 indicates that the request happens in the main frame; a
  ///  positive value indicates the ID of a subframe in which the request
  ///  happens. If the document of a (sub-)frame is loaded (`type` is
  ///  `main_frame` or `sub_frame`), `frameId`
  ///  indicates the ID of this frame, not the ID of the outer frame. Frame IDs
  ///  are unique within a tab.
  external JSAny get frameId;

  ///  The unique identifier for the frame's document, if this request is for a
  ///  frame.
  external JSAny? get documentId;

  ///  The type of the frame, if this request is for a frame.
  external JSAny? get frameType;

  ///  The lifecycle of the frame's document, if this request is for a
  ///  frame.
  external JSAny? get documentLifecycle;

  ///  ID of frame that wraps the frame which sent the request. Set to -1 if no
  ///  parent frame exists.
  external JSAny get parentFrameId;

  ///  The unique identifier for the frame's parent document, if this request
  ///  is for a frame and has a parent.
  external JSAny? get parentDocumentId;

  ///  The ID of the tab in which the request takes place. Set to -1 if the
  ///  request isn't related to a tab.
  external JSAny get tabId;

  ///  The resource type of the request.
  external JSAny get type;
}

@JS()
@staticInterop
class TestMatchRequestDetails {
  ///  The URL of the hypothetical request.
  external JSAny get url;

  ///  The initiator URL (if any) for the hypothetical request.
  external JSAny? get initiator;

  ///  Standard HTTP method of the hypothetical request. Defaults to "get" for
  ///  HTTP requests and is ignored for non-HTTP requests.
  external JSAny? get method;

  ///  The resource type of the hypothetical request.
  external JSAny get type;

  ///  The ID of the tab in which the hypothetical request takes place. Does
  ///  not need to correspond to a real tab ID. Default is -1, meaning that
  ///  the request isn't related to a tab.
  external JSAny? get tabId;
}

@JS()
@staticInterop
class MatchedRuleInfoDebug {
  external JSAny get rule;

  ///  Details about the request for which the rule was matched.
  external JSAny get request;
}

@JS()
@staticInterop
class DNRInfo {
  external JSArray get rule_resources;
}

@JS()
@staticInterop
class ManifestKeys {
  external JSAny get declarative_net_request;
}

@JS()
@staticInterop
class RegexOptions {
  ///  The regular expresson to check.
  external JSAny get regex;

  ///  Whether the `regex` specified is case sensitive. Default is
  ///  true.
  external JSAny? get isCaseSensitive;

  ///  Whether the `regex` specified requires capturing. Capturing is
  ///  only required for redirect rules which specify a
  ///  `regexSubstition` action. The default is false.
  external JSAny? get requireCapturing;
}

@JS()
@staticInterop
class IsRegexSupportedResult {
  external JSAny get isSupported;

  ///  Specifies the reason why the regular expression is not supported. Only
  ///  provided if `isSupported` is false.
  external JSAny? get reason;
}

@JS()
@staticInterop
class TestMatchOutcomeResult {
  ///  The rules (if any) that match the hypothetical request.
  external JSArray get matchedRules;
}

@JS()
@staticInterop
class UpdateRuleOptions {
  ///  IDs of the rules to remove. Any invalid IDs will be ignored.
  external JSArray? get removeRuleIds;

  ///  Rules to add.
  external JSArray? get addRules;
}

@JS()
@staticInterop
class UpdateRulesetOptions {
  ///  The set of ids corresponding to a static $(ref:Ruleset) that should be
  ///  disabled.
  external JSArray? get disableRulesetIds;

  ///  The set of ids corresponding to a static $(ref:Ruleset) that should be
  ///  enabled.
  external JSArray? get enableRulesetIds;
}

@JS()
@staticInterop
class UpdateStaticRulesOptions {
  ///  The id corresponding to a static $(ref:Ruleset).
  external JSAny get rulesetId;

  ///  Set of ids corresponding to rules in the $(ref:Ruleset) to disable.
  external JSArray? get disableRuleIds;

  ///  Set of ids corresponding to rules in the $(ref:Ruleset) to enable.
  external JSArray? get enableRuleIds;
}

@JS()
@staticInterop
class GetDisabledRuleIdsOptions {
  ///  The id corresponding to a static $(ref:Ruleset).
  external JSAny get rulesetId;
}

@JS()
@staticInterop
class TabActionCountUpdate {
  ///  The tab for which to update the action count.
  external JSAny get tabId;

  ///  The amount to increment the tab's action count by. Negative values will
  ///  decrement the count.
  external JSAny get increment;
}

@JS()
@staticInterop
class ExtensionActionOptions {
  ///  Whether to automatically display the action count for a page as the
  ///  extension's badge text. This preference is persisted across sessions.
  external JSAny? get displayActionCountAsBadgeText;

  ///  Details of how the tab's action count should be adjusted.
  external JSAny? get tabUpdate;
}
