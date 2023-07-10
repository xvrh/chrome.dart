import 'chrome.dart';
import 'dart:js_interop';
import 'extension_types.dart';
export 'chrome.dart';

extension JSChromeJSDeclarativeNetRequestExtension on JSChrome {
  /// The `chrome.declarativeNetRequest` API is used to block or modify
  /// network requests by specifying declarative rules. This lets extensions
  /// modify network requests without intercepting them and viewing their
  /// content,
  /// thus providing more privacy.
  external JSDeclarativeNetRequest get declarativeNetRequest;
}

@JS()
@staticInterop
class JSDeclarativeNetRequest {}

extension JSDeclarativeNetRequestExtension on JSDeclarativeNetRequest {
  /// Modifies the current set of dynamic rules for the extension.
  /// The rules with IDs listed in `options.removeRuleIds` are first
  /// removed, and then the rules given in `options.addRules` are
  /// added. Notes:
  /// <ul>
  /// <li>This update happens as a single atomic operation: either all
  /// specified rules are added and removed, or an error is returned.</li>
  /// <li>These rules are persisted across browser sessions and across
  /// extension updates.</li>
  /// <li>Static rules specified as part of the extension package can not be
  /// removed using this function.</li>
  /// <li>$(ref:MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES) is the maximum number
  /// of combined dynamic and session rules an extension can add.</li>
  /// </ul>
  /// |callback|: Called once the update is complete or has failed. In case of
  /// an error, $(ref:runtime.lastError) will be set and no change will be made
  /// to the rule set. This can happen for multiple reasons, such as invalid
  /// rule format, duplicate rule ID, rule count limit exceeded, internal
  /// errors, and others.
  external void updateDynamicRules(
    UpdateRuleOptions options,
    JSFunction callback,
  );

  /// Returns the current set of dynamic rules for the extension. Callers can
  /// optionally filter the list of fetched rules by specifying a
  /// `filter`.
  /// |filter|: An object to filter the list of fetched rules.
  /// |callback|: Called with the set of dynamic rules. An error might be
  /// raised in case of transient internal errors.
  external void getDynamicRules(
    GetRulesFilter? filter,
    JSFunction callback,
  );

  /// Modifies the current set of session scoped rules for the extension.
  /// The rules with IDs listed in `options.removeRuleIds` are first
  /// removed, and then the rules given in `options.addRules` are
  /// added. Notes:
  /// <ul>
  /// <li>This update happens as a single atomic operation: either all
  /// specified rules are added and removed, or an error is returned.</li>
  /// <li>These rules are not persisted across sessions and are backed in
  /// memory.</li>
  /// <li>$(ref:MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES) is the maximum number
  /// of combined dynamic and session rules an extension can add.</li>
  /// </ul>
  /// |callback|: Called once the update is complete or has failed. In case of
  /// an error, $(ref:runtime.lastError) will be set and no change will be made
  /// to the rule set. This can happen for multiple reasons, such as invalid
  /// rule format, duplicate rule ID, rule count limit exceeded, and others.
  external void updateSessionRules(
    UpdateRuleOptions options,
    JSFunction callback,
  );

  /// Returns the current set of session scoped rules for the extension.
  /// Callers can optionally filter the list of fetched rules by specifying a
  /// `filter`.
  /// |filter|: An object to filter the list of fetched rules.
  /// |callback|: Called with the set of session scoped rules.
  external void getSessionRules(
    GetRulesFilter? filter,
    JSFunction callback,
  );

  /// Updates the set of enabled static rulesets for the extension. The
  /// rulesets with IDs listed in `options.disableRulesetIds` are
  /// first removed, and then the rulesets listed in
  /// `options.enableRulesetIds` are added.<br/>
  /// Note that the set of enabled static rulesets is persisted across sessions
  /// but not across extension updates, i.e. the `rule_resources`
  /// manifest key will determine the set of enabled static rulesets on each
  /// extension update.
  /// |callback|: Called once the update is complete. In case of an error,
  /// $(ref:runtime.lastError) will be set and no change will be made to set of
  /// enabled rulesets. This can happen for multiple reasons, such as invalid
  /// ruleset IDs, rule count limit exceeded, or internal errors.
  external void updateEnabledRulesets(
    UpdateRulesetOptions options,
    JSFunction callback,
  );

  /// Returns the ids for the current set of enabled static rulesets.
  /// |callback|: Called with a list of ids, where each id corresponds to an
  /// enabled static $(ref:Ruleset).
  external void getEnabledRulesets(JSFunction callback);

  /// Disables and enables individual static rules in a $(ref:Ruleset).
  /// Changes to rules belonging to a disabled $(ref:Ruleset) will take
  /// effect the next time that it becomes enabled.
  /// |callback|: Called once the update is complete. In case of an error,
  /// $(ref:runtime.lastError) will be set and no change will be made to the
  /// enabled static rules.
  external void updateStaticRules(
    UpdateStaticRulesOptions options,
    JSFunction callback,
  );

  /// Returns the list of static rules in the given $(ref:Ruleset) that are
  /// currently disabled.
  /// |options|: Specifies the ruleset to query.
  /// |callback|: Called with a list of ids that correspond to the disabled
  /// rules in that ruleset.
  external void getDisabledRuleIds(
    GetDisabledRuleIdsOptions options,
    JSFunction callback,
  );

  /// Returns all rules matched for the extension. Callers can optionally
  /// filter the list of matched rules by specifying a `filter`.
  /// This method is only available to extensions with the
  /// `declarativeNetRequestFeedback` permission or having the
  /// `activeTab` permission granted for the `tabId`
  /// specified in `filter`.
  /// Note: Rules not associated with an active document that were matched more
  /// than five minutes ago will not be returned.
  /// |filter|: An object to filter the list of matched rules.
  /// |callback|: Called once the list of matched rules has been fetched. In
  /// case of an error, $(ref:runtime.lastError) will be set and no rules will
  /// be returned. This can happen for multiple reasons, such as insufficient
  /// permissions, or exceeding the quota.
  external void getMatchedRules(
    MatchedRulesFilter? filter,
    JSFunction callback,
  );

  /// Configures if the action count for tabs should be displayed as the
  /// extension action's badge text and provides a way for that action count to
  /// be incremented.
  external void setExtensionActionOptions(
    ExtensionActionOptions options,
    JSFunction callback,
  );

  /// Checks if the given regular expression will be supported as a
  /// `regexFilter` rule condition.
  /// |regexOptions|: The regular expression to check.
  /// |callback|: Called with details consisting of whether the regular
  /// expression is supported and the reason if not.
  external void isRegexSupported(
    RegexOptions regexOptions,
    JSFunction callback,
  );

  /// Returns the number of static rules an extension can enable before the
  /// <a href="#global-static-rule-limit">global static rule limit</a> is
  /// reached.
  external void getAvailableStaticRuleCount(JSFunction callback);

  /// Checks if any of the extension's declarativeNetRequest rules would match
  /// a hypothetical request.
  /// Note: Only available for unpacked extensions as this is only intended to
  /// be used during extension development.
  /// |requestDetails|: The request details to test.
  /// |callback|: Called with the details of matched rules.
  external void testMatchOutcome(
    TestMatchRequestDetails request,
    JSFunction callback,
  );

  /// Fired when a rule is matched with a request. Only available for unpacked
  /// extensions with the `declarativeNetRequestFeedback` permission
  /// as this is intended to be used for debugging purposes only.
  /// |info|: The rule that has been matched along with information about the
  /// associated request.
  external ChromeEvent get onRuleMatchedDebug;

  /// The minimum number of static rules guaranteed to an extension across its
  /// enabled static rulesets. Any rules above this limit will count towards
  /// the <a href="#global-static-rule-limit">global static rule limit</a>.
  external JSNumber get GUARANTEED_MINIMUM_STATIC_RULES;

  /// The maximum number of dynamic rules that an extension can add.
  external JSNumber get MAX_NUMBER_OF_DYNAMIC_RULES;

  /// The maximum number of combined dynamic and session scoped rules an
  /// extension can add.
  external JSNumber get MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES;

  /// Time interval within which `MAX_GETMATCHEDRULES_CALLS_PER_INTERVAL
  /// getMatchedRules` calls can be made, specified in minutes.
  /// Additional calls will fail immediately and set $(ref:runtime.lastError).
  /// Note: `getMatchedRules` calls associated with a user gesture
  /// are exempt from the quota.
  external JSNumber get GETMATCHEDRULES_QUOTA_INTERVAL;

  /// The number of times `getMatchedRules` can be called within a
  /// period of `GETMATCHEDRULES_QUOTA_INTERVAL`.
  external JSNumber get MAX_GETMATCHEDRULES_CALLS_PER_INTERVAL;

  /// The maximum number of regular expression rules that an extension can
  /// add. This limit is evaluated separately for the set of dynamic rules and
  /// those specified in the rule resources file.
  external JSNumber get MAX_NUMBER_OF_REGEX_RULES;

  /// The maximum number of static `Rulesets` an extension can
  /// specify as part of the `"rule_resources"` manifest key.
  external JSNumber get MAX_NUMBER_OF_STATIC_RULESETS;

  /// The maximum number of static `Rulesets` an extension can
  /// enable at any one time.
  external JSNumber get MAX_NUMBER_OF_ENABLED_STATIC_RULESETS;

  /// Ruleset ID for the dynamic rules added by the extension.
  external JSString get DYNAMIC_RULESET_ID;

  /// Ruleset ID for the session-scoped rules added by the extension.
  external JSString get SESSION_RULESET_ID;
}

/// This describes the resource type of the network request.
typedef ResourceType = JSString;

/// This describes the HTTP request method of a network request.
typedef RequestMethod = JSString;

/// This describes whether the request is first or third party to the frame in
/// which it originated. A request is said to be first party if it has the same
/// domain (eTLD+1) as the frame in which the request originated.
typedef DomainType = JSString;

/// This describes the possible operations for a "modifyHeaders" rule.
typedef HeaderOperation = JSString;

/// Describes the kind of action to take if a given RuleCondition matches.
typedef RuleActionType = JSString;

/// Describes the reason why a given regular expression isn't supported.
typedef UnsupportedRegexReason = JSString;

@JS()
@staticInterop
class Ruleset {}

extension RulesetExtension on Ruleset {
  /// A non-empty string uniquely identifying the ruleset. IDs beginning with
  /// '_' are reserved for internal use.
  external JSString get id;

  /// The path of the JSON ruleset relative to the extension directory.
  external JSString get path;

  /// Whether the ruleset is enabled by default.
  external JSBoolean get enabled;
}

@JS()
@staticInterop
class QueryKeyValue {}

extension QueryKeyValueExtension on QueryKeyValue {
  external JSString get key;

  external JSString get value;

  /// If true, the query key is replaced only if it's already present.
  /// Otherwise, the key is also added if it's missing. Defaults to false.
  external JSBoolean? get replaceOnly;
}

@JS()
@staticInterop
class QueryTransform {}

extension QueryTransformExtension on QueryTransform {
  /// The list of query keys to be removed.
  external JSArray? get removeParams;

  /// The list of query key-value pairs to be added or replaced.
  external JSArray? get addOrReplaceParams;
}

@JS()
@staticInterop
class URLTransform {}

extension URLTransformExtension on URLTransform {
  /// The new scheme for the request. Allowed values are "http", "https",
  /// "ftp" and "chrome-extension".
  external JSString? get scheme;

  /// The new host for the request.
  external JSString? get host;

  /// The new port for the request. If empty, the existing port is cleared.
  external JSString? get port;

  /// The new path for the request. If empty, the existing path is cleared.
  external JSString? get path;

  /// The new query for the request. Should be either empty, in which case the
  /// existing query is cleared; or should begin with '?'.
  external JSString? get query;

  /// Add, remove or replace query key-value pairs.
  external QueryTransform? get queryTransform;

  /// The new fragment for the request. Should be either empty, in which case
  /// the existing fragment is cleared; or should begin with '#'.
  external JSString? get fragment;

  /// The new username for the request.
  external JSString? get username;

  /// The new password for the request.
  external JSString? get password;
}

@JS()
@staticInterop
class Redirect {}

extension RedirectExtension on Redirect {
  /// Path relative to the extension directory. Should start with '/'.
  external JSString? get extensionPath;

  /// Url transformations to perform.
  external URLTransform? get transform;

  /// The redirect url. Redirects to JavaScript urls are not allowed.
  external JSString? get url;

  /// Substitution pattern for rules which specify a `regexFilter`.
  /// The first match of `regexFilter` within the url will be
  /// replaced with this pattern. Within `regexSubstitution`,
  /// backslash-escaped digits (\1 to \9) can be used to insert the
  /// corresponding capture groups. \0 refers to the entire matching text.
  external JSString? get regexSubstitution;
}

@JS()
@staticInterop
class RuleCondition {}

extension RuleConditionExtension on RuleCondition {
  /// The pattern which is matched against the network request url.
  /// Supported constructs:
  ///
  /// **'*'**  : Wildcard: Matches any number of characters.
  ///
  /// **'|'**  : Left/right anchor: If used at either end of the pattern,
  ///               specifies the beginning/end of the url respectively.
  ///
  /// **'||'** : Domain name anchor: If used at the beginning of the pattern,
  ///               specifies the start of a (sub-)domain of the URL.
  ///
  /// **'^'**  : Separator character: This matches anything except a letter, a
  ///               digit or one of the following: _ - . %. This can also match
  ///               the end of the URL.
  ///
  /// Therefore `urlFilter` is composed of the following parts:
  /// (optional Left/Domain name anchor) + pattern + (optional Right anchor).
  ///
  /// If omitted, all urls are matched. An empty string is not allowed.
  ///
  /// A pattern beginning with `||*` is not allowed. Use
  /// `*` instead.
  ///
  /// Note: Only one of `urlFilter` or `regexFilter` can
  /// be specified.
  ///
  /// Note: The `urlFilter` must be composed of only ASCII
  /// characters. This is matched against a url where the host is encoded in
  /// the punycode format (in case of internationalized domains) and any other
  /// non-ascii characters are url encoded in utf-8.
  /// For example, when the request url is
  /// http://abc.&#x0440;&#x0444;?q=&#x0444;, the
  /// `urlFilter` will be matched against the url
  /// http://abc.xn--p1ai/?q=%D1%84.
  external JSString? get urlFilter;

  /// Regular expression to match against the network request url. This follows
  /// the <a href = "https://github.com/google/re2/wiki/Syntax">RE2 syntax</a>.
  ///
  /// Note: Only one of `urlFilter` or `regexFilter` can
  /// be specified.
  ///
  /// Note: The `regexFilter` must be composed of only ASCII
  /// characters. This is matched against a url where the host is encoded in
  /// the punycode format (in case of internationalized domains) and any other
  /// non-ascii characters are url encoded in utf-8.
  external JSString? get regexFilter;

  /// Whether the `urlFilter` or `regexFilter`
  /// (whichever is specified) is case sensitive. Default is true.
  external JSBoolean? get isUrlFilterCaseSensitive;

  /// The rule will only match network requests originating from the list of
  /// `initiatorDomains`. If the list is omitted, the rule is
  /// applied to requests from all domains. An empty list is not allowed.
  ///
  /// Notes:
  /// <ul>
  ///  <li>Sub-domains like "a.example.com" are also allowed.</li>
  ///  <li>The entries must consist of only ascii characters.</li>
  ///  <li>Use punycode encoding for internationalized domains.</li>
  ///  <li>
  ///    This matches against the request initiator and not the request url.
  ///  </li>
  ///  <li>Sub-domains of the listed domains are also matched.</li>
  /// </ul>
  external JSArray? get initiatorDomains;

  /// The rule will not match network requests originating from the list of
  /// `excludedInitiatorDomains`. If the list is empty or omitted,
  /// no domains are excluded. This takes precedence over
  /// `initiatorDomains`.
  ///
  /// Notes:
  /// <ul>
  ///  <li>Sub-domains like "a.example.com" are also allowed.</li>
  ///  <li>The entries must consist of only ascii characters.</li>
  ///  <li>Use punycode encoding for internationalized domains.</li>
  ///  <li>
  ///    This matches against the request initiator and not the request url.
  ///  </li>
  ///  <li>Sub-domains of the listed domains are also excluded.</li>
  /// </ul>
  external JSArray? get excludedInitiatorDomains;

  /// The rule will only match network requests when the domain matches one
  /// from the list of `requestDomains`. If the list is omitted,
  /// the rule is applied to requests from all domains. An empty list is not
  /// allowed.
  ///
  /// Notes:
  /// <ul>
  ///  <li>Sub-domains like "a.example.com" are also allowed.</li>
  ///  <li>The entries must consist of only ascii characters.</li>
  ///  <li>Use punycode encoding for internationalized domains.</li>
  ///  <li>Sub-domains of the listed domains are also matched.</li>
  /// </ul>
  external JSArray? get requestDomains;

  /// The rule will not match network requests when the domains matches one
  /// from the list of `excludedRequestDomains`. If the list is
  /// empty or omitted, no domains are excluded. This takes precedence over
  /// `requestDomains`.
  ///
  /// Notes:
  /// <ul>
  ///  <li>Sub-domains like "a.example.com" are also allowed.</li>
  ///  <li>The entries must consist of only ascii characters.</li>
  ///  <li>Use punycode encoding for internationalized domains.</li>
  ///  <li>Sub-domains of the listed domains are also excluded.</li>
  /// </ul>
  external JSArray? get excludedRequestDomains;

  /// The rule will only match network requests originating from the list of
  /// `domains`.
  external JSArray? get domains;

  /// The rule will not match network requests originating from the list of
  /// `excludedDomains`.
  external JSArray? get excludedDomains;

  /// List of resource types which the rule can match. An empty list is not
  /// allowed.
  ///
  /// Note: this must be specified for `allowAllRequests` rules and
  /// may only include the `sub_frame` and `main_frame`
  /// resource types.
  external JSArray? get resourceTypes;

  /// List of resource types which the rule won't match. Only one of
  /// `resourceTypes` and `excludedResourceTypes` should
  /// be specified. If neither of them is specified, all resource types except
  /// "main_frame" are blocked.
  external JSArray? get excludedResourceTypes;

  /// List of HTTP request methods which the rule can match. An empty list is
  /// not allowed.
  ///
  /// Note: Specifying a `requestMethods` rule condition will also
  /// exclude non-HTTP(s) requests, whereas specifying
  /// `excludedRequestMethods` will not.
  external JSArray? get requestMethods;

  /// List of request methods which the rule won't match. Only one of
  /// `requestMethods` and `excludedRequestMethods`
  /// should be specified. If neither of them is specified, all request methods
  /// are matched.
  external JSArray? get excludedRequestMethods;

  /// Specifies whether the network request is first-party or third-party to
  /// the domain from which it originated. If omitted, all requests are
  /// accepted.
  external DomainType? get domainType;

  /// List of $(ref:tabs.Tab.id) which the rule should match. An ID of
  /// $(ref:tabs.TAB_ID_NONE) matches requests which don't originate from a
  /// tab. An empty list is not allowed. Only supported for session-scoped
  /// rules.
  external JSArray? get tabIds;

  /// List of $(ref:tabs.Tab.id) which the rule should not match. An ID of
  /// $(ref:tabs.TAB_ID_NONE) excludes requests which don't originate from a
  /// tab. Only supported for session-scoped rules.
  external JSArray? get excludedTabIds;
}

@JS()
@staticInterop
class ModifyHeaderInfo {}

extension ModifyHeaderInfoExtension on ModifyHeaderInfo {
  /// The name of the header to be modified.
  external JSString get header;

  /// The operation to be performed on a header.
  external HeaderOperation get operation;

  /// The new value for the header. Must be specified for `append`
  /// and `set` operations.
  external JSString? get value;
}

@JS()
@staticInterop
class RuleAction {}

extension RuleActionExtension on RuleAction {
  /// The type of action to perform.
  external RuleActionType get type;

  /// Describes how the redirect should be performed. Only valid for redirect
  /// rules.
  external Redirect? get redirect;

  /// The request headers to modify for the request. Only valid if
  /// RuleActionType is "modifyHeaders".
  external JSArray? get requestHeaders;

  /// The response headers to modify for the request. Only valid if
  /// RuleActionType is "modifyHeaders".
  external JSArray? get responseHeaders;
}

@JS()
@staticInterop
class Rule {}

extension RuleExtension on Rule {
  /// An id which uniquely identifies a rule. Mandatory and should be >= 1.
  external JSNumber get id;

  /// Rule priority. Defaults to 1. When specified, should be >= 1.
  external JSNumber? get priority;

  /// The condition under which this rule is triggered.
  external RuleCondition get condition;

  /// The action to take if this rule is matched.
  external RuleAction get action;
}

@JS()
@staticInterop
class MatchedRule {}

extension MatchedRuleExtension on MatchedRule {
  /// A matching rule's ID.
  external JSNumber get ruleId;

  /// ID of the $(ref:Ruleset) this rule belongs to. For a rule originating
  /// from the set of dynamic rules, this will be equal to
  /// $(ref:DYNAMIC_RULESET_ID).
  external JSString get rulesetId;
}

@JS()
@staticInterop
class GetRulesFilter {}

extension GetRulesFilterExtension on GetRulesFilter {
  /// If specified, only rules with matching IDs are included.
  external JSArray? get ruleIds;
}

@JS()
@staticInterop
class MatchedRuleInfo {}

extension MatchedRuleInfoExtension on MatchedRuleInfo {
  external MatchedRule get rule;

  /// The time the rule was matched. Timestamps will correspond to the
  /// Javascript convention for times, i.e. number of milliseconds since the
  /// epoch.
  external double get timeStamp;

  /// The tabId of the tab from which the request originated if the tab is
  /// still active. Else -1.
  external JSNumber get tabId;
}

@JS()
@staticInterop
class MatchedRulesFilter {}

extension MatchedRulesFilterExtension on MatchedRulesFilter {
  /// If specified, only matches rules for the given tab. Matches rules not
  /// associated with any active tab if set to -1.
  external JSNumber? get tabId;

  /// If specified, only matches rules after the given timestamp.
  external double? get minTimeStamp;
}

@JS()
@staticInterop
class RulesMatchedDetails {}

extension RulesMatchedDetailsExtension on RulesMatchedDetails {
  /// Rules matching the given filter.
  external JSArray get rulesMatchedInfo;
}

@JS()
@staticInterop
class RequestDetails {}

extension RequestDetailsExtension on RequestDetails {
  /// The ID of the request. Request IDs are unique within a browser session.
  external JSString get requestId;

  /// The URL of the request.
  external JSString get url;

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  external JSString? get initiator;

  /// Standard HTTP method.
  external JSString get method;

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId`
  /// indicates the ID of this frame, not the ID of the outer frame. Frame IDs
  /// are unique within a tab.
  external JSNumber get frameId;

  /// The unique identifier for the frame's document, if this request is for a
  /// frame.
  external JSString? get documentId;

  /// The type of the frame, if this request is for a frame.
  external FrameType? get frameType;

  /// The lifecycle of the frame's document, if this request is for a
  /// frame.
  external DocumentLifecycle? get documentLifecycle;

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  external JSNumber get parentFrameId;

  /// The unique identifier for the frame's parent document, if this request
  /// is for a frame and has a parent.
  external JSString? get parentDocumentId;

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  external JSNumber get tabId;

  /// The resource type of the request.
  external ResourceType get type;
}

@JS()
@staticInterop
class TestMatchRequestDetails {}

extension TestMatchRequestDetailsExtension on TestMatchRequestDetails {
  /// The URL of the hypothetical request.
  external JSString get url;

  /// The initiator URL (if any) for the hypothetical request.
  external JSString? get initiator;

  /// Standard HTTP method of the hypothetical request. Defaults to "get" for
  /// HTTP requests and is ignored for non-HTTP requests.
  external RequestMethod? get method;

  /// The resource type of the hypothetical request.
  external ResourceType get type;

  /// The ID of the tab in which the hypothetical request takes place. Does
  /// not need to correspond to a real tab ID. Default is -1, meaning that
  /// the request isn't related to a tab.
  external JSNumber? get tabId;
}

@JS()
@staticInterop
class MatchedRuleInfoDebug {}

extension MatchedRuleInfoDebugExtension on MatchedRuleInfoDebug {
  external MatchedRule get rule;

  /// Details about the request for which the rule was matched.
  external RequestDetails get request;
}

@JS()
@staticInterop
class DNRInfo {}

extension DNRInfoExtension on DNRInfo {
  external JSArray get rule_resources;
}

@JS()
@staticInterop
class ManifestKeys {}

extension ManifestKeysExtension on ManifestKeys {
  external DNRInfo get declarative_net_request;
}

@JS()
@staticInterop
class RegexOptions {}

extension RegexOptionsExtension on RegexOptions {
  /// The regular expresson to check.
  external JSString get regex;

  /// Whether the `regex` specified is case sensitive. Default is
  /// true.
  external JSBoolean? get isCaseSensitive;

  /// Whether the `regex` specified requires capturing. Capturing is
  /// only required for redirect rules which specify a
  /// `regexSubstition` action. The default is false.
  external JSBoolean? get requireCapturing;
}

@JS()
@staticInterop
class IsRegexSupportedResult {}

extension IsRegexSupportedResultExtension on IsRegexSupportedResult {
  external JSBoolean get isSupported;

  /// Specifies the reason why the regular expression is not supported. Only
  /// provided if `isSupported` is false.
  external UnsupportedRegexReason? get reason;
}

@JS()
@staticInterop
class TestMatchOutcomeResult {}

extension TestMatchOutcomeResultExtension on TestMatchOutcomeResult {
  /// The rules (if any) that match the hypothetical request.
  external JSArray get matchedRules;
}

@JS()
@staticInterop
class UpdateRuleOptions {}

extension UpdateRuleOptionsExtension on UpdateRuleOptions {
  /// IDs of the rules to remove. Any invalid IDs will be ignored.
  external JSArray? get removeRuleIds;

  /// Rules to add.
  external JSArray? get addRules;
}

@JS()
@staticInterop
class UpdateRulesetOptions {}

extension UpdateRulesetOptionsExtension on UpdateRulesetOptions {
  /// The set of ids corresponding to a static $(ref:Ruleset) that should be
  /// disabled.
  external JSArray? get disableRulesetIds;

  /// The set of ids corresponding to a static $(ref:Ruleset) that should be
  /// enabled.
  external JSArray? get enableRulesetIds;
}

@JS()
@staticInterop
class UpdateStaticRulesOptions {}

extension UpdateStaticRulesOptionsExtension on UpdateStaticRulesOptions {
  /// The id corresponding to a static $(ref:Ruleset).
  external JSString get rulesetId;

  /// Set of ids corresponding to rules in the $(ref:Ruleset) to disable.
  external JSArray? get disableRuleIds;

  /// Set of ids corresponding to rules in the $(ref:Ruleset) to enable.
  external JSArray? get enableRuleIds;
}

@JS()
@staticInterop
class GetDisabledRuleIdsOptions {}

extension GetDisabledRuleIdsOptionsExtension on GetDisabledRuleIdsOptions {
  /// The id corresponding to a static $(ref:Ruleset).
  external JSString get rulesetId;
}

@JS()
@staticInterop
class TabActionCountUpdate {}

extension TabActionCountUpdateExtension on TabActionCountUpdate {
  /// The tab for which to update the action count.
  external JSNumber get tabId;

  /// The amount to increment the tab's action count by. Negative values will
  /// decrement the count.
  external JSNumber get increment;
}

@JS()
@staticInterop
class ExtensionActionOptions {}

extension ExtensionActionOptionsExtension on ExtensionActionOptions {
  /// Whether to automatically display the action count for a page as the
  /// extension's badge text. This preference is persisted across sessions.
  external JSBoolean? get displayActionCountAsBadgeText;

  /// Details of how the tab's action count should be adjusted.
  external TabActionCountUpdate? get tabUpdate;
}
