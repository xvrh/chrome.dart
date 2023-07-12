import 'src/internal_helpers.dart';
import 'extension_types.dart';
import 'src/js/declarative_net_request.dart' as $js;
export 'chrome.dart';

final _declarativeNetRequest = ChromeDeclarativeNetRequest._();

extension ChromeDeclarativeNetRequestExtension on Chrome {
  ChromeDeclarativeNetRequest get declarativeNetRequest =>
      _declarativeNetRequest;
}

class ChromeDeclarativeNetRequest {
  ChromeDeclarativeNetRequest._();

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
  /// <li>[MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES] is the maximum number
  /// of combined dynamic and session rules an extension can add.</li>
  /// </ul>
  /// |callback|: Called once the update is complete or has failed. In case of
  /// an error, [runtime.lastError] will be set and no change will be made
  /// to the rule set. This can happen for multiple reasons, such as invalid
  /// rule format, duplicate rule ID, rule count limit exceeded, internal
  /// errors, and others.
  Future<void> updateDynamicRules(UpdateRuleOptions options) =>
      throw UnimplementedError();

  /// Returns the current set of dynamic rules for the extension. Callers can
  /// optionally filter the list of fetched rules by specifying a
  /// `filter`.
  /// |filter|: An object to filter the list of fetched rules.
  /// |callback|: Called with the set of dynamic rules. An error might be
  /// raised in case of transient internal errors.
  Future<List<Rule>> getDynamicRules(GetRulesFilter? filter) =>
      throw UnimplementedError();

  /// Modifies the current set of session scoped rules for the extension.
  /// The rules with IDs listed in `options.removeRuleIds` are first
  /// removed, and then the rules given in `options.addRules` are
  /// added. Notes:
  /// <ul>
  /// <li>This update happens as a single atomic operation: either all
  /// specified rules are added and removed, or an error is returned.</li>
  /// <li>These rules are not persisted across sessions and are backed in
  /// memory.</li>
  /// <li>[MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES] is the maximum number
  /// of combined dynamic and session rules an extension can add.</li>
  /// </ul>
  /// |callback|: Called once the update is complete or has failed. In case of
  /// an error, [runtime.lastError] will be set and no change will be made
  /// to the rule set. This can happen for multiple reasons, such as invalid
  /// rule format, duplicate rule ID, rule count limit exceeded, and others.
  Future<void> updateSessionRules(UpdateRuleOptions options) =>
      throw UnimplementedError();

  /// Returns the current set of session scoped rules for the extension.
  /// Callers can optionally filter the list of fetched rules by specifying a
  /// `filter`.
  /// |filter|: An object to filter the list of fetched rules.
  /// |callback|: Called with the set of session scoped rules.
  Future<List<Rule>> getSessionRules(GetRulesFilter? filter) =>
      throw UnimplementedError();

  /// Updates the set of enabled static rulesets for the extension. The
  /// rulesets with IDs listed in `options.disableRulesetIds` are
  /// first removed, and then the rulesets listed in
  /// `options.enableRulesetIds` are added.<br/>
  /// Note that the set of enabled static rulesets is persisted across sessions
  /// but not across extension updates, i.e. the `rule_resources`
  /// manifest key will determine the set of enabled static rulesets on each
  /// extension update.
  /// |callback|: Called once the update is complete. In case of an error,
  /// [runtime.lastError] will be set and no change will be made to set of
  /// enabled rulesets. This can happen for multiple reasons, such as invalid
  /// ruleset IDs, rule count limit exceeded, or internal errors.
  Future<void> updateEnabledRulesets(UpdateRulesetOptions options) =>
      throw UnimplementedError();

  /// Returns the ids for the current set of enabled static rulesets.
  /// |callback|: Called with a list of ids, where each id corresponds to an
  /// enabled static [Ruleset].
  Future<List<String>> getEnabledRulesets() => throw UnimplementedError();

  /// Disables and enables individual static rules in a [Ruleset].
  /// Changes to rules belonging to a disabled [Ruleset] will take
  /// effect the next time that it becomes enabled.
  /// |callback|: Called once the update is complete. In case of an error,
  /// [runtime.lastError] will be set and no change will be made to the
  /// enabled static rules.
  Future<void> updateStaticRules(UpdateStaticRulesOptions options) =>
      throw UnimplementedError();

  /// Returns the list of static rules in the given [Ruleset] that are
  /// currently disabled.
  /// |options|: Specifies the ruleset to query.
  /// |callback|: Called with a list of ids that correspond to the disabled
  /// rules in that ruleset.
  Future<List<int>> getDisabledRuleIds(GetDisabledRuleIdsOptions options) =>
      throw UnimplementedError();

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
  /// case of an error, [runtime.lastError] will be set and no rules will
  /// be returned. This can happen for multiple reasons, such as insufficient
  /// permissions, or exceeding the quota.
  Future<RulesMatchedDetails> getMatchedRules(MatchedRulesFilter? filter) =>
      throw UnimplementedError();

  /// Configures if the action count for tabs should be displayed as the
  /// extension action's badge text and provides a way for that action count to
  /// be incremented.
  Future<void> setExtensionActionOptions(ExtensionActionOptions options) =>
      throw UnimplementedError();

  /// Checks if the given regular expression will be supported as a
  /// `regexFilter` rule condition.
  /// |regexOptions|: The regular expression to check.
  /// |callback|: Called with details consisting of whether the regular
  /// expression is supported and the reason if not.
  Future<IsRegexSupportedResult> isRegexSupported(RegexOptions regexOptions) =>
      throw UnimplementedError();

  /// Returns the number of static rules an extension can enable before the
  /// [global static rule limit](#global-static-rule-limit) is
  /// reached.
  Future<int> getAvailableStaticRuleCount() => throw UnimplementedError();

  /// Checks if any of the extension's declarativeNetRequest rules would match
  /// a hypothetical request.
  /// Note: Only available for unpacked extensions as this is only intended to
  /// be used during extension development.
  /// |requestDetails|: The request details to test.
  /// |callback|: Called with the details of matched rules.
  Future<TestMatchOutcomeResult> testMatchOutcome(
          TestMatchRequestDetails request) =>
      throw UnimplementedError();

  /// The minimum number of static rules guaranteed to an extension across its
  /// enabled static rulesets. Any rules above this limit will count towards
  /// the [global static rule limit](#global-static-rule-limit).
  int get guaranteedMINIMUMSTATICRULES =>
      $js.chrome.declarativeNetRequest.GUARANTEED_MINIMUM_STATIC_RULES
          as dynamic;

  /// The maximum number of dynamic rules that an extension can add.
  int get maxNUMBEROFDYNAMICRULES =>
      $js.chrome.declarativeNetRequest.MAX_NUMBER_OF_DYNAMIC_RULES as dynamic;

  /// The maximum number of combined dynamic and session scoped rules an
  /// extension can add.
  int get maxNUMBEROFDYNAMICANDSESSIONRULES =>
      $js.chrome.declarativeNetRequest.MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES
          as dynamic;

  /// Time interval within which `MAX_GETMATCHEDRULES_CALLS_PER_INTERVAL
  /// getMatchedRules` calls can be made, specified in minutes.
  /// Additional calls will fail immediately and set [runtime.lastError].
  /// Note: `getMatchedRules` calls associated with a user gesture
  /// are exempt from the quota.
  int get getmatchedrulesQUOTAINTERVAL =>
      $js.chrome.declarativeNetRequest.GETMATCHEDRULES_QUOTA_INTERVAL
          as dynamic;

  /// The number of times `getMatchedRules` can be called within a
  /// period of `GETMATCHEDRULES_QUOTA_INTERVAL`.
  int get maxGETMATCHEDRULESCALLSPERINTERVAL =>
      $js.chrome.declarativeNetRequest.MAX_GETMATCHEDRULES_CALLS_PER_INTERVAL
          as dynamic;

  /// The maximum number of regular expression rules that an extension can
  /// add. This limit is evaluated separately for the set of dynamic rules and
  /// those specified in the rule resources file.
  int get maxNUMBEROFREGEXRULES =>
      $js.chrome.declarativeNetRequest.MAX_NUMBER_OF_REGEX_RULES as dynamic;

  /// The maximum number of static `Rulesets` an extension can
  /// specify as part of the `"rule_resources"` manifest key.
  int get maxNUMBEROFSTATICRULESETS =>
      $js.chrome.declarativeNetRequest.MAX_NUMBER_OF_STATIC_RULESETS as dynamic;

  /// The maximum number of static `Rulesets` an extension can
  /// enable at any one time.
  int get maxNUMBEROFENABLEDSTATICRULESETS =>
      $js.chrome.declarativeNetRequest.MAX_NUMBER_OF_ENABLED_STATIC_RULESETS
          as dynamic;

  /// Ruleset ID for the dynamic rules added by the extension.
  String get dynamicRULESETID =>
      $js.chrome.declarativeNetRequest.DYNAMIC_RULESET_ID as dynamic;

  /// Ruleset ID for the session-scoped rules added by the extension.
  String get sessionRULESETID =>
      $js.chrome.declarativeNetRequest.SESSION_RULESET_ID as dynamic;

  /// Fired when a rule is matched with a request. Only available for unpacked
  /// extensions with the `declarativeNetRequestFeedback` permission
  /// as this is intended to be used for debugging purposes only.
  /// |info|: The rule that has been matched along with information about the
  /// associated request.
  Stream<MatchedRuleInfoDebug> get onRuleMatchedDebug =>
      throw UnimplementedError();
}

/// This describes the resource type of the network request.
enum ResourceType {
  mainFrame('main_frame'),
  subFrame('sub_frame'),
  stylesheet('stylesheet'),
  script('script'),
  image('image'),
  font('font'),
  object('object'),
  xmlhttprequest('xmlhttprequest'),
  ping('ping'),
  cspReport('csp_report'),
  media('media'),
  websocket('websocket'),
  webtransport('webtransport'),
  webbundle('webbundle'),
  other('other');

  const ResourceType(this.value);

  final String value;

  String get toJS => value;
  static ResourceType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// This describes the HTTP request method of a network request.
enum RequestMethod {
  connect('connect'),
  delete('delete'),
  get('get'),
  head('head'),
  options('options'),
  patch('patch'),
  post('post'),
  put('put'),
  other('other');

  const RequestMethod(this.value);

  final String value;

  String get toJS => value;
  static RequestMethod fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// This describes whether the request is first or third party to the frame in
/// which it originated. A request is said to be first party if it has the same
/// domain (eTLD+1) as the frame in which the request originated.
enum DomainType {
  /// The network request is first party to the frame in which it originated.
  firstParty('firstParty'),

  /// The network request is third party to the frame in which it originated.
  thirdParty('thirdParty');

  const DomainType(this.value);

  final String value;

  String get toJS => value;
  static DomainType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// This describes the possible operations for a "modifyHeaders" rule.
enum HeaderOperation {
  /// Adds a new entry for the specified header. This operation is not
  /// supported for request headers.
  append('append'),

  /// Sets a new value for the specified header, removing any existing headers
  /// with the same name.
  set('set'),

  /// Removes all entries for the specified header.
  remove('remove');

  const HeaderOperation(this.value);

  final String value;

  String get toJS => value;
  static HeaderOperation fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Describes the kind of action to take if a given RuleCondition matches.
enum RuleActionType {
  /// Block the network request.
  block('block'),

  /// Redirect the network request.
  redirect('redirect'),

  /// Allow the network request. The request won't be intercepted if there is
  /// an allow rule which matches it.
  allow('allow'),

  /// Upgrade the network request url's scheme to https if the request is http
  /// or ftp.
  upgradeScheme('upgradeScheme'),

  /// Modify request/response headers from the network request.
  modifyHeaders('modifyHeaders'),

  /// Allow all requests within a frame hierarchy, including the frame request
  /// itself.
  allowAllRequests('allowAllRequests');

  const RuleActionType(this.value);

  final String value;

  String get toJS => value;
  static RuleActionType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Describes the reason why a given regular expression isn't supported.
enum UnsupportedRegexReason {
  /// The regular expression is syntactically incorrect, or uses features
  /// not available in the
  /// <a href = "https://github.com/google/re2/wiki/Syntax">RE2 syntax</a>.
  syntaxError('syntaxError'),

  /// The regular expression exceeds the memory limit.
  memoryLimitExceeded('memoryLimitExceeded');

  const UnsupportedRegexReason(this.value);

  final String value;

  String get toJS => value;
  static UnsupportedRegexReason fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class Ruleset {
  Ruleset.fromJS(this._wrapped);

  final $js.Ruleset _wrapped;

  $js.Ruleset get toJS => _wrapped;

  /// A non-empty string uniquely identifying the ruleset. IDs beginning with
  /// '_' are reserved for internal use.
  String get id => _wrapped.id;
  set id(String v) {
    throw UnimplementedError();
  }

  /// The path of the JSON ruleset relative to the extension directory.
  String get path => _wrapped.path;
  set path(String v) {
    throw UnimplementedError();
  }

  /// Whether the ruleset is enabled by default.
  bool get enabled => _wrapped.enabled;
  set enabled(bool v) {
    throw UnimplementedError();
  }
}

class QueryKeyValue {
  QueryKeyValue.fromJS(this._wrapped);

  final $js.QueryKeyValue _wrapped;

  $js.QueryKeyValue get toJS => _wrapped;

  String get key => _wrapped.key;
  set key(String v) {
    throw UnimplementedError();
  }

  String get value => _wrapped.value;
  set value(String v) {
    throw UnimplementedError();
  }

  /// If true, the query key is replaced only if it's already present.
  /// Otherwise, the key is also added if it's missing. Defaults to false.
  bool? get replaceOnly => _wrapped.replaceOnly;
  set replaceOnly(bool? v) {
    throw UnimplementedError();
  }
}

class QueryTransform {
  QueryTransform.fromJS(this._wrapped);

  final $js.QueryTransform _wrapped;

  $js.QueryTransform get toJS => _wrapped;

  /// The list of query keys to be removed.
  List<String>? get removeParams => throw UnimplementedError();
  set removeParams(List<String>? v) {
    throw UnimplementedError();
  }

  /// The list of query key-value pairs to be added or replaced.
  List<QueryKeyValue>? get addOrReplaceParams => throw UnimplementedError();
  set addOrReplaceParams(List<QueryKeyValue>? v) {
    throw UnimplementedError();
  }
}

class URLTransform {
  URLTransform.fromJS(this._wrapped);

  final $js.URLTransform _wrapped;

  $js.URLTransform get toJS => _wrapped;

  /// The new scheme for the request. Allowed values are "http", "https",
  /// "ftp" and "chrome-extension".
  String? get scheme => _wrapped.scheme;
  set scheme(String? v) {
    throw UnimplementedError();
  }

  /// The new host for the request.
  String? get host => _wrapped.host;
  set host(String? v) {
    throw UnimplementedError();
  }

  /// The new port for the request. If empty, the existing port is cleared.
  String? get port => _wrapped.port;
  set port(String? v) {
    throw UnimplementedError();
  }

  /// The new path for the request. If empty, the existing path is cleared.
  String? get path => _wrapped.path;
  set path(String? v) {
    throw UnimplementedError();
  }

  /// The new query for the request. Should be either empty, in which case the
  /// existing query is cleared; or should begin with '?'.
  String? get query => _wrapped.query;
  set query(String? v) {
    throw UnimplementedError();
  }

  /// Add, remove or replace query key-value pairs.
  QueryTransform? get queryTransform =>
      _wrapped.queryTransform?.let(QueryTransform.fromJS);
  set queryTransform(QueryTransform? v) {
    throw UnimplementedError();
  }

  /// The new fragment for the request. Should be either empty, in which case
  /// the existing fragment is cleared; or should begin with '#'.
  String? get fragment => _wrapped.fragment;
  set fragment(String? v) {
    throw UnimplementedError();
  }

  /// The new username for the request.
  String? get username => _wrapped.username;
  set username(String? v) {
    throw UnimplementedError();
  }

  /// The new password for the request.
  String? get password => _wrapped.password;
  set password(String? v) {
    throw UnimplementedError();
  }
}

class Redirect {
  Redirect.fromJS(this._wrapped);

  final $js.Redirect _wrapped;

  $js.Redirect get toJS => _wrapped;

  /// Path relative to the extension directory. Should start with '/'.
  String? get extensionPath => _wrapped.extensionPath;
  set extensionPath(String? v) {
    throw UnimplementedError();
  }

  /// Url transformations to perform.
  URLTransform? get transform => _wrapped.transform?.let(URLTransform.fromJS);
  set transform(URLTransform? v) {
    throw UnimplementedError();
  }

  /// The redirect url. Redirects to JavaScript urls are not allowed.
  String? get url => _wrapped.url;
  set url(String? v) {
    throw UnimplementedError();
  }

  /// Substitution pattern for rules which specify a `regexFilter`.
  /// The first match of `regexFilter` within the url will be
  /// replaced with this pattern. Within `regexSubstitution`,
  /// backslash-escaped digits (\1 to \9) can be used to insert the
  /// corresponding capture groups. \0 refers to the entire matching text.
  String? get regexSubstitution => _wrapped.regexSubstitution;
  set regexSubstitution(String? v) {
    throw UnimplementedError();
  }
}

class RuleCondition {
  RuleCondition.fromJS(this._wrapped);

  final $js.RuleCondition _wrapped;

  $js.RuleCondition get toJS => _wrapped;

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
  String? get urlFilter => _wrapped.urlFilter;
  set urlFilter(String? v) {
    throw UnimplementedError();
  }

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
  String? get regexFilter => _wrapped.regexFilter;
  set regexFilter(String? v) {
    throw UnimplementedError();
  }

  /// Whether the `urlFilter` or `regexFilter`
  /// (whichever is specified) is case sensitive. Default is true.
  bool? get isUrlFilterCaseSensitive => _wrapped.isUrlFilterCaseSensitive;
  set isUrlFilterCaseSensitive(bool? v) {
    throw UnimplementedError();
  }

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
  List<String>? get initiatorDomains => throw UnimplementedError();
  set initiatorDomains(List<String>? v) {
    throw UnimplementedError();
  }

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
  List<String>? get excludedInitiatorDomains => throw UnimplementedError();
  set excludedInitiatorDomains(List<String>? v) {
    throw UnimplementedError();
  }

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
  List<String>? get requestDomains => throw UnimplementedError();
  set requestDomains(List<String>? v) {
    throw UnimplementedError();
  }

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
  List<String>? get excludedRequestDomains => throw UnimplementedError();
  set excludedRequestDomains(List<String>? v) {
    throw UnimplementedError();
  }

  /// The rule will only match network requests originating from the list of
  /// `domains`.
  List<String>? get domains => throw UnimplementedError();
  set domains(List<String>? v) {
    throw UnimplementedError();
  }

  /// The rule will not match network requests originating from the list of
  /// `excludedDomains`.
  List<String>? get excludedDomains => throw UnimplementedError();
  set excludedDomains(List<String>? v) {
    throw UnimplementedError();
  }

  /// List of resource types which the rule can match. An empty list is not
  /// allowed.
  ///
  /// Note: this must be specified for `allowAllRequests` rules and
  /// may only include the `sub_frame` and `main_frame`
  /// resource types.
  List<ResourceType>? get resourceTypes => throw UnimplementedError();
  set resourceTypes(List<ResourceType>? v) {
    throw UnimplementedError();
  }

  /// List of resource types which the rule won't match. Only one of
  /// `resourceTypes` and `excludedResourceTypes` should
  /// be specified. If neither of them is specified, all resource types except
  /// "main_frame" are blocked.
  List<ResourceType>? get excludedResourceTypes => throw UnimplementedError();
  set excludedResourceTypes(List<ResourceType>? v) {
    throw UnimplementedError();
  }

  /// List of HTTP request methods which the rule can match. An empty list is
  /// not allowed.
  ///
  /// Note: Specifying a `requestMethods` rule condition will also
  /// exclude non-HTTP(s) requests, whereas specifying
  /// `excludedRequestMethods` will not.
  List<RequestMethod>? get requestMethods => throw UnimplementedError();
  set requestMethods(List<RequestMethod>? v) {
    throw UnimplementedError();
  }

  /// List of request methods which the rule won't match. Only one of
  /// `requestMethods` and `excludedRequestMethods`
  /// should be specified. If neither of them is specified, all request methods
  /// are matched.
  List<RequestMethod>? get excludedRequestMethods => throw UnimplementedError();
  set excludedRequestMethods(List<RequestMethod>? v) {
    throw UnimplementedError();
  }

  /// Specifies whether the network request is first-party or third-party to
  /// the domain from which it originated. If omitted, all requests are
  /// accepted.
  DomainType? get domainType => _wrapped.domainType?.let(DomainType.fromJS);
  set domainType(DomainType? v) {
    throw UnimplementedError();
  }

  /// List of [tabs.Tab.id] which the rule should match. An ID of
  /// [tabs.TAB_ID_NONE] matches requests which don't originate from a
  /// tab. An empty list is not allowed. Only supported for session-scoped
  /// rules.
  List<int>? get tabIds => throw UnimplementedError();
  set tabIds(List<int>? v) {
    throw UnimplementedError();
  }

  /// List of [tabs.Tab.id] which the rule should not match. An ID of
  /// [tabs.TAB_ID_NONE] excludes requests which don't originate from a
  /// tab. Only supported for session-scoped rules.
  List<int>? get excludedTabIds => throw UnimplementedError();
  set excludedTabIds(List<int>? v) {
    throw UnimplementedError();
  }
}

class ModifyHeaderInfo {
  ModifyHeaderInfo.fromJS(this._wrapped);

  final $js.ModifyHeaderInfo _wrapped;

  $js.ModifyHeaderInfo get toJS => _wrapped;

  /// The name of the header to be modified.
  String get header => _wrapped.header;
  set header(String v) {
    throw UnimplementedError();
  }

  /// The operation to be performed on a header.
  HeaderOperation get operation => HeaderOperation.fromJS(_wrapped.operation);
  set operation(HeaderOperation v) {
    throw UnimplementedError();
  }

  /// The new value for the header. Must be specified for `append`
  /// and `set` operations.
  String? get value => _wrapped.value;
  set value(String? v) {
    throw UnimplementedError();
  }
}

class RuleAction {
  RuleAction.fromJS(this._wrapped);

  final $js.RuleAction _wrapped;

  $js.RuleAction get toJS => _wrapped;

  /// The type of action to perform.
  RuleActionType get type => RuleActionType.fromJS(_wrapped.type);
  set type(RuleActionType v) {
    throw UnimplementedError();
  }

  /// Describes how the redirect should be performed. Only valid for redirect
  /// rules.
  Redirect? get redirect => _wrapped.redirect?.let(Redirect.fromJS);
  set redirect(Redirect? v) {
    throw UnimplementedError();
  }

  /// The request headers to modify for the request. Only valid if
  /// RuleActionType is "modifyHeaders".
  List<ModifyHeaderInfo>? get requestHeaders => throw UnimplementedError();
  set requestHeaders(List<ModifyHeaderInfo>? v) {
    throw UnimplementedError();
  }

  /// The response headers to modify for the request. Only valid if
  /// RuleActionType is "modifyHeaders".
  List<ModifyHeaderInfo>? get responseHeaders => throw UnimplementedError();
  set responseHeaders(List<ModifyHeaderInfo>? v) {
    throw UnimplementedError();
  }
}

class Rule {
  Rule.fromJS(this._wrapped);

  final $js.Rule _wrapped;

  $js.Rule get toJS => _wrapped;

  /// An id which uniquely identifies a rule. Mandatory and should be >= 1.
  int get id => _wrapped.id;
  set id(int v) {
    throw UnimplementedError();
  }

  /// Rule priority. Defaults to 1. When specified, should be >= 1.
  int? get priority => _wrapped.priority;
  set priority(int? v) {
    throw UnimplementedError();
  }

  /// The condition under which this rule is triggered.
  RuleCondition get condition => RuleCondition.fromJS(_wrapped.condition);
  set condition(RuleCondition v) {
    throw UnimplementedError();
  }

  /// The action to take if this rule is matched.
  RuleAction get action => RuleAction.fromJS(_wrapped.action);
  set action(RuleAction v) {
    throw UnimplementedError();
  }
}

class MatchedRule {
  MatchedRule.fromJS(this._wrapped);

  final $js.MatchedRule _wrapped;

  $js.MatchedRule get toJS => _wrapped;

  /// A matching rule's ID.
  int get ruleId => _wrapped.ruleId;
  set ruleId(int v) {
    throw UnimplementedError();
  }

  /// ID of the [Ruleset] this rule belongs to. For a rule originating
  /// from the set of dynamic rules, this will be equal to
  /// [DYNAMIC_RULESET_ID].
  String get rulesetId => _wrapped.rulesetId;
  set rulesetId(String v) {
    throw UnimplementedError();
  }
}

class GetRulesFilter {
  GetRulesFilter.fromJS(this._wrapped);

  final $js.GetRulesFilter _wrapped;

  $js.GetRulesFilter get toJS => _wrapped;

  /// If specified, only rules with matching IDs are included.
  List<int>? get ruleIds => throw UnimplementedError();
  set ruleIds(List<int>? v) {
    throw UnimplementedError();
  }
}

class MatchedRuleInfo {
  MatchedRuleInfo.fromJS(this._wrapped);

  final $js.MatchedRuleInfo _wrapped;

  $js.MatchedRuleInfo get toJS => _wrapped;

  MatchedRule get rule => MatchedRule.fromJS(_wrapped.rule);
  set rule(MatchedRule v) {
    throw UnimplementedError();
  }

  /// The time the rule was matched. Timestamps will correspond to the
  /// Javascript convention for times, i.e. number of milliseconds since the
  /// epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    throw UnimplementedError();
  }

  /// The tabId of the tab from which the request originated if the tab is
  /// still active. Else -1.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }
}

class MatchedRulesFilter {
  MatchedRulesFilter.fromJS(this._wrapped);

  final $js.MatchedRulesFilter _wrapped;

  $js.MatchedRulesFilter get toJS => _wrapped;

  /// If specified, only matches rules for the given tab. Matches rules not
  /// associated with any active tab if set to -1.
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    throw UnimplementedError();
  }

  /// If specified, only matches rules after the given timestamp.
  double? get minTimeStamp => _wrapped.minTimeStamp;
  set minTimeStamp(double? v) {
    throw UnimplementedError();
  }
}

class RulesMatchedDetails {
  RulesMatchedDetails.fromJS(this._wrapped);

  final $js.RulesMatchedDetails _wrapped;

  $js.RulesMatchedDetails get toJS => _wrapped;

  /// Rules matching the given filter.
  List<MatchedRuleInfo> get rulesMatchedInfo => throw UnimplementedError();
  set rulesMatchedInfo(List<MatchedRuleInfo> v) {
    throw UnimplementedError();
  }
}

class RequestDetails {
  RequestDetails.fromJS(this._wrapped);

  final $js.RequestDetails _wrapped;

  $js.RequestDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  /// The URL of the request.
  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    throw UnimplementedError();
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId`
  /// indicates the ID of this frame, not the ID of the outer frame. Frame IDs
  /// are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    throw UnimplementedError();
  }

  /// The unique identifier for the frame's document, if this request is for a
  /// frame.
  String? get documentId => _wrapped.documentId;
  set documentId(String? v) {
    throw UnimplementedError();
  }

  /// The type of the frame, if this request is for a frame.
  FrameType? get frameType => _wrapped.frameType?.let(FrameType.fromJS);
  set frameType(FrameType? v) {
    throw UnimplementedError();
  }

  /// The lifecycle of the frame's document, if this request is for a
  /// frame.
  DocumentLifecycle? get documentLifecycle =>
      _wrapped.documentLifecycle?.let(DocumentLifecycle.fromJS);
  set documentLifecycle(DocumentLifecycle? v) {
    throw UnimplementedError();
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    throw UnimplementedError();
  }

  /// The unique identifier for the frame's parent document, if this request
  /// is for a frame and has a parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// The resource type of the request.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }
}

class TestMatchRequestDetails {
  TestMatchRequestDetails.fromJS(this._wrapped);

  final $js.TestMatchRequestDetails _wrapped;

  $js.TestMatchRequestDetails get toJS => _wrapped;

  /// The URL of the hypothetical request.
  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// The initiator URL (if any) for the hypothetical request.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method of the hypothetical request. Defaults to "get" for
  /// HTTP requests and is ignored for non-HTTP requests.
  RequestMethod? get method => _wrapped.method?.let(RequestMethod.fromJS);
  set method(RequestMethod? v) {
    throw UnimplementedError();
  }

  /// The resource type of the hypothetical request.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the hypothetical request takes place. Does
  /// not need to correspond to a real tab ID. Default is -1, meaning that
  /// the request isn't related to a tab.
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    throw UnimplementedError();
  }
}

class MatchedRuleInfoDebug {
  MatchedRuleInfoDebug.fromJS(this._wrapped);

  final $js.MatchedRuleInfoDebug _wrapped;

  $js.MatchedRuleInfoDebug get toJS => _wrapped;

  MatchedRule get rule => MatchedRule.fromJS(_wrapped.rule);
  set rule(MatchedRule v) {
    throw UnimplementedError();
  }

  /// Details about the request for which the rule was matched.
  RequestDetails get request => RequestDetails.fromJS(_wrapped.request);
  set request(RequestDetails v) {
    throw UnimplementedError();
  }
}

class DNRInfo {
  DNRInfo.fromJS(this._wrapped);

  final $js.DNRInfo _wrapped;

  $js.DNRInfo get toJS => _wrapped;

  List<Ruleset> get rule_resources => throw UnimplementedError();
  set rule_resources(List<Ruleset> v) {
    throw UnimplementedError();
  }
}

class ManifestKeys {
  ManifestKeys.fromJS(this._wrapped);

  final $js.ManifestKeys _wrapped;

  $js.ManifestKeys get toJS => _wrapped;

  DNRInfo get declarative_net_request =>
      DNRInfo.fromJS(_wrapped.declarative_net_request);
  set declarative_net_request(DNRInfo v) {
    throw UnimplementedError();
  }
}

class RegexOptions {
  RegexOptions.fromJS(this._wrapped);

  final $js.RegexOptions _wrapped;

  $js.RegexOptions get toJS => _wrapped;

  /// The regular expresson to check.
  String get regex => _wrapped.regex;
  set regex(String v) {
    throw UnimplementedError();
  }

  /// Whether the `regex` specified is case sensitive. Default is
  /// true.
  bool? get isCaseSensitive => _wrapped.isCaseSensitive;
  set isCaseSensitive(bool? v) {
    throw UnimplementedError();
  }

  /// Whether the `regex` specified requires capturing. Capturing is
  /// only required for redirect rules which specify a
  /// `regexSubstition` action. The default is false.
  bool? get requireCapturing => _wrapped.requireCapturing;
  set requireCapturing(bool? v) {
    throw UnimplementedError();
  }
}

class IsRegexSupportedResult {
  IsRegexSupportedResult.fromJS(this._wrapped);

  final $js.IsRegexSupportedResult _wrapped;

  $js.IsRegexSupportedResult get toJS => _wrapped;

  bool get isSupported => _wrapped.isSupported;
  set isSupported(bool v) {
    throw UnimplementedError();
  }

  /// Specifies the reason why the regular expression is not supported. Only
  /// provided if `isSupported` is false.
  UnsupportedRegexReason? get reason =>
      _wrapped.reason?.let(UnsupportedRegexReason.fromJS);
  set reason(UnsupportedRegexReason? v) {
    throw UnimplementedError();
  }
}

class TestMatchOutcomeResult {
  TestMatchOutcomeResult.fromJS(this._wrapped);

  final $js.TestMatchOutcomeResult _wrapped;

  $js.TestMatchOutcomeResult get toJS => _wrapped;

  /// The rules (if any) that match the hypothetical request.
  List<MatchedRule> get matchedRules => throw UnimplementedError();
  set matchedRules(List<MatchedRule> v) {
    throw UnimplementedError();
  }
}

class UpdateRuleOptions {
  UpdateRuleOptions.fromJS(this._wrapped);

  final $js.UpdateRuleOptions _wrapped;

  $js.UpdateRuleOptions get toJS => _wrapped;

  /// IDs of the rules to remove. Any invalid IDs will be ignored.
  List<int>? get removeRuleIds => throw UnimplementedError();
  set removeRuleIds(List<int>? v) {
    throw UnimplementedError();
  }

  /// Rules to add.
  List<Rule>? get addRules => throw UnimplementedError();
  set addRules(List<Rule>? v) {
    throw UnimplementedError();
  }
}

class UpdateRulesetOptions {
  UpdateRulesetOptions.fromJS(this._wrapped);

  final $js.UpdateRulesetOptions _wrapped;

  $js.UpdateRulesetOptions get toJS => _wrapped;

  /// The set of ids corresponding to a static [Ruleset] that should be
  /// disabled.
  List<String>? get disableRulesetIds => throw UnimplementedError();
  set disableRulesetIds(List<String>? v) {
    throw UnimplementedError();
  }

  /// The set of ids corresponding to a static [Ruleset] that should be
  /// enabled.
  List<String>? get enableRulesetIds => throw UnimplementedError();
  set enableRulesetIds(List<String>? v) {
    throw UnimplementedError();
  }
}

class UpdateStaticRulesOptions {
  UpdateStaticRulesOptions.fromJS(this._wrapped);

  final $js.UpdateStaticRulesOptions _wrapped;

  $js.UpdateStaticRulesOptions get toJS => _wrapped;

  /// The id corresponding to a static [Ruleset].
  String get rulesetId => _wrapped.rulesetId;
  set rulesetId(String v) {
    throw UnimplementedError();
  }

  /// Set of ids corresponding to rules in the [Ruleset] to disable.
  List<int>? get disableRuleIds => throw UnimplementedError();
  set disableRuleIds(List<int>? v) {
    throw UnimplementedError();
  }

  /// Set of ids corresponding to rules in the [Ruleset] to enable.
  List<int>? get enableRuleIds => throw UnimplementedError();
  set enableRuleIds(List<int>? v) {
    throw UnimplementedError();
  }
}

class GetDisabledRuleIdsOptions {
  GetDisabledRuleIdsOptions.fromJS(this._wrapped);

  final $js.GetDisabledRuleIdsOptions _wrapped;

  $js.GetDisabledRuleIdsOptions get toJS => _wrapped;

  /// The id corresponding to a static [Ruleset].
  String get rulesetId => _wrapped.rulesetId;
  set rulesetId(String v) {
    throw UnimplementedError();
  }
}

class TabActionCountUpdate {
  TabActionCountUpdate.fromJS(this._wrapped);

  final $js.TabActionCountUpdate _wrapped;

  $js.TabActionCountUpdate get toJS => _wrapped;

  /// The tab for which to update the action count.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// The amount to increment the tab's action count by. Negative values will
  /// decrement the count.
  int get increment => _wrapped.increment;
  set increment(int v) {
    throw UnimplementedError();
  }
}

class ExtensionActionOptions {
  ExtensionActionOptions.fromJS(this._wrapped);

  final $js.ExtensionActionOptions _wrapped;

  $js.ExtensionActionOptions get toJS => _wrapped;

  /// Whether to automatically display the action count for a page as the
  /// extension's badge text. This preference is persisted across sessions.
  bool? get displayActionCountAsBadgeText =>
      _wrapped.displayActionCountAsBadgeText;
  set displayActionCountAsBadgeText(bool? v) {
    throw UnimplementedError();
  }

  /// Details of how the tab's action count should be adjusted.
  TabActionCountUpdate? get tabUpdate =>
      _wrapped.tabUpdate?.let(TabActionCountUpdate.fromJS);
  set tabUpdate(TabActionCountUpdate? v) {
    throw UnimplementedError();
  }
}
