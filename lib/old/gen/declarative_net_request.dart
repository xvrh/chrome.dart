/* This file has been generated from declarative_net_request.idl - do not edit */

/**
 * The `chrome.declarativeNetRequest` API is used to block or modify network
 * requests by specifying declarative rules. This lets extensions modify network
 * requests without intercepting them and viewing their content, thus providing
 * more privacy.
 */
library chrome.declarativeNetRequest;

import '../src/common.dart';

/**
 * Accessor for the `chrome.declarativeNetRequest` namespace.
 */
final ChromeDeclarativeNetRequest declarativeNetRequest = ChromeDeclarativeNetRequest._();

class ChromeDeclarativeNetRequest extends ChromeApi {
  JsObject get _declarativeNetRequest => chrome['declarativeNetRequest'];

  Stream<MatchedRuleInfoDebug> get onRuleMatchedDebug => _onRuleMatchedDebug.stream;
  late ChromeStreamController<MatchedRuleInfoDebug> _onRuleMatchedDebug;

  ChromeDeclarativeNetRequest._() {
    var getApi = () => _declarativeNetRequest;
    _onRuleMatchedDebug = ChromeStreamController<MatchedRuleInfoDebug>.oneArg(getApi, 'onRuleMatchedDebug', _createMatchedRuleInfoDebug);
  }

  bool get available => _declarativeNetRequest != null;

  /**
   * Modifies the current set of dynamic rules for the extension. The rules with
   * IDs listed in `options.removeRuleIds` are first removed, and then the rules
   * given in `options.addRules` are added. Notes: <ul> <li>This update happens
   * as a single atomic operation: either all specified rules are added and
   * removed, or an error is returned.</li> <li>These rules are persisted across
   * browser sessions and across extension updates.</li> <li>Static rules
   * specified as part of the extension package can not be removed using this
   * function.</li> <li>[MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES] is the maximum
   * number of combined dynamic and session rules an extension can add.</li>
   * </ul>
   * [callback]: Called once the update is complete or has failed. In case of an
   * error, [runtime.lastError] will be set and no change will be made to the
   * rule set. This can happen for multiple reasons, such as invalid rule
   * format, duplicate rule ID, rule count limit exceeded, internal errors, and
   * others.
   */
  Future updateDynamicRules(UpdateRuleOptions options) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _declarativeNetRequest.callMethod('updateDynamicRules', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Returns the current set of dynamic rules for the extension. Callers can
   * optionally filter the list of fetched rules by specifying a `filter`.
   * [filter]: An object to filter the list of fetched rules.
   * [callback]: Called with the set of dynamic rules. An error might be raised
   * in case of transient internal errors.
   */
  Future<List<Rule>> getDynamicRules([GetRulesFilter? filter]) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter<List<Rule>>.oneArg((e) => listify(e, _createRule));
    _declarativeNetRequest.callMethod('getDynamicRules', [jsify(filter), completer.callback]);
    return completer.future;
  }

  /**
   * Modifies the current set of session scoped rules for the extension. The
   * rules with IDs listed in `options.removeRuleIds` are first removed, and
   * then the rules given in `options.addRules` are added. Notes: <ul> <li>This
   * update happens as a single atomic operation: either all specified rules are
   * added and removed, or an error is returned.</li> <li>These rules are not
   * persisted across sessions and are backed in memory.</li>
   * <li>[MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES] is the maximum number of
   * combined dynamic and session rules an extension can add.</li> </ul>
   * [callback]: Called once the update is complete or has failed. In case of an
   * error, [runtime.lastError] will be set and no change will be made to the
   * rule set. This can happen for multiple reasons, such as invalid rule
   * format, duplicate rule ID, rule count limit exceeded, and others.
   */
  Future updateSessionRules(UpdateRuleOptions options) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _declarativeNetRequest.callMethod('updateSessionRules', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Returns the current set of session scoped rules for the extension. Callers
   * can optionally filter the list of fetched rules by specifying a `filter`.
   * [filter]: An object to filter the list of fetched rules.
   * [callback]: Called with the set of session scoped rules.
   */
  Future<List<Rule>> getSessionRules([GetRulesFilter? filter]) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter<List<Rule>>.oneArg((e) => listify(e, _createRule));
    _declarativeNetRequest.callMethod('getSessionRules', [jsify(filter), completer.callback]);
    return completer.future;
  }

  /**
   * Updates the set of enabled static rulesets for the extension. The rulesets
   * with IDs listed in `options.disableRulesetIds` are first removed, and then
   * the rulesets listed in `options.enableRulesetIds` are added.<br/> Note that
   * the set of enabled static rulesets is persisted across sessions but not
   * across extension updates, i.e. the `rule_resources` manifest key will
   * determine the set of enabled static rulesets on each extension update.
   * [callback]: Called once the update is complete. In case of an error,
   * [runtime.lastError] will be set and no change will be made to set of
   * enabled rulesets. This can happen for multiple reasons, such as invalid
   * ruleset IDs, rule count limit exceeded, or internal errors.
   */
  Future updateEnabledRulesets(UpdateRulesetOptions options) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _declarativeNetRequest.callMethod('updateEnabledRulesets', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Returns the ids for the current set of enabled static rulesets.
   * [callback]: Called with a list of ids, where each id corresponds to an
   * enabled static [Ruleset].
   */
  Future<List<String>> getEnabledRulesets() {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter<List<String>>.oneArg(listify);
    _declarativeNetRequest.callMethod('getEnabledRulesets', [completer.callback]);
    return completer.future;
  }

  /**
   * Disables and enables individual static rules in a [Ruleset]. Changes to
   * rules belonging to a disabled [Ruleset] will take effect the next time that
   * it becomes enabled.
   * [callback]: Called once the update is complete. In case of an error,
   * [runtime.lastError] will be set and no change will be made to the enabled
   * static rules.
   */
  Future updateStaticRules(UpdateStaticRulesOptions options) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _declarativeNetRequest.callMethod('updateStaticRules', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Returns the list of static rules in the given [Ruleset] that are currently
   * disabled.
   * [options]: Specifies the ruleset to query.
   * [callback]: Called with a list of ids that correspond to the disabled rules
   * in that ruleset.
   */
  Future<List<int>> getDisabledRuleIds(GetDisabledRuleIdsOptions options) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter<List<int>>.oneArg(listify);
    _declarativeNetRequest.callMethod('getDisabledRuleIds', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Returns all rules matched for the extension. Callers can optionally filter
   * the list of matched rules by specifying a `filter`. This method is only
   * available to extensions with the `declarativeNetRequestFeedback` permission
   * or having the `activeTab` permission granted for the `tabId` specified in
   * `filter`. Note: Rules not associated with an active document that were
   * matched more than five minutes ago will not be returned.
   * [filter]: An object to filter the list of matched rules.
   * [callback]: Called once the list of matched rules has been fetched. In case
   * of an error, [runtime.lastError] will be set and no rules will be returned.
   * This can happen for multiple reasons, such as insufficient permissions, or
   * exceeding the quota.
   */
  Future<RulesMatchedDetails> getMatchedRules([MatchedRulesFilter? filter]) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter<RulesMatchedDetails>.oneArg(_createRulesMatchedDetails);
    _declarativeNetRequest.callMethod('getMatchedRules', [jsify(filter), completer.callback]);
    return completer.future;
  }

  /**
   * Configures if the action count for tabs should be displayed as the
   * extension action's badge text and provides a way for that action count to
   * be incremented.
   */
  Future setExtensionActionOptions(ExtensionActionOptions options) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _declarativeNetRequest.callMethod('setExtensionActionOptions', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Checks if the given regular expression will be supported as a `regexFilter`
   * rule condition.
   * [regexOptions]: The regular expression to check.
   * [callback]: Called with details consisting of whether the regular
   * expression is supported and the reason if not.
   */
  Future<IsRegexSupportedResult> isRegexSupported(RegexOptions regexOptions) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter<IsRegexSupportedResult>.oneArg(_createIsRegexSupportedResult);
    _declarativeNetRequest.callMethod('isRegexSupported', [jsify(regexOptions), completer.callback]);
    return completer.future;
  }

  /**
   * Returns the number of static rules an extension can enable before the <a
   * href="#global-static-rule-limit">global static rule limit</a> is reached.
   */
  Future<int> getAvailableStaticRuleCount() {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter<int>.oneArg();
    _declarativeNetRequest.callMethod('getAvailableStaticRuleCount', [completer.callback]);
    return completer.future;
  }

  /**
   * Checks if any of the extension's declarativeNetRequest rules would match a
   * hypothetical request. Note: Only available for unpacked extensions as this
   * is only intended to be used during extension development.
   * [requestDetails]: The request details to test.
   * [callback]: Called with the details of matched rules.
   */
  Future<TestMatchOutcomeResult> testMatchOutcome(TestMatchRequestDetails request) {
    if (_declarativeNetRequest == null) _throwNotAvailable();

    var completer =  ChromeCompleter<TestMatchOutcomeResult>.oneArg(_createTestMatchOutcomeResult);
    _declarativeNetRequest.callMethod('testMatchOutcome', [jsify(request), completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.declarativeNetRequest' is not available");
  }
}

/**
 * This describes the resource type of the network request.
 */
class ResourceType extends ChromeEnum {
  static const ResourceType MAIN_FRAME = const ResourceType._('main_frame');
  static const ResourceType SUB_FRAME = const ResourceType._('sub_frame');
  static const ResourceType STYLESHEET = const ResourceType._('stylesheet');
  static const ResourceType SCRIPT = const ResourceType._('script');
  static const ResourceType IMAGE = const ResourceType._('image');
  static const ResourceType FONT = const ResourceType._('font');
  static const ResourceType OBJECT = const ResourceType._('object');
  static const ResourceType XMLHTTPREQUEST = const ResourceType._('xmlhttprequest');
  static const ResourceType PING = const ResourceType._('ping');
  static const ResourceType CSP_REPORT = const ResourceType._('csp_report');
  static const ResourceType MEDIA = const ResourceType._('media');
  static const ResourceType WEBSOCKET = const ResourceType._('websocket');
  static const ResourceType WEBTRANSPORT = const ResourceType._('webtransport');
  static const ResourceType WEBBUNDLE = const ResourceType._('webbundle');
  static const ResourceType OTHER = const ResourceType._('other');

  static const List<ResourceType> VALUES = const[MAIN_FRAME, SUB_FRAME, STYLESHEET, SCRIPT, IMAGE, FONT, OBJECT, XMLHTTPREQUEST, PING, CSP_REPORT, MEDIA, WEBSOCKET, WEBTRANSPORT, WEBBUNDLE, OTHER];

  const ResourceType._(String str): super(str);
}

/**
 * This describes the HTTP request method of a network request.
 */
class RequestMethod extends ChromeEnum {
  static const RequestMethod CONNECT = const RequestMethod._('connect');
  static const RequestMethod DELETE = const RequestMethod._('delete');
  static const RequestMethod GET = const RequestMethod._('get');
  static const RequestMethod HEAD = const RequestMethod._('head');
  static const RequestMethod OPTIONS = const RequestMethod._('options');
  static const RequestMethod PATCH = const RequestMethod._('patch');
  static const RequestMethod POST = const RequestMethod._('post');
  static const RequestMethod PUT = const RequestMethod._('put');
  static const RequestMethod OTHER = const RequestMethod._('other');

  static const List<RequestMethod> VALUES = const[CONNECT, DELETE, GET, HEAD, OPTIONS, PATCH, POST, PUT, OTHER];

  const RequestMethod._(String str): super(str);
}

/**
 * This describes whether the request is first or third party to the frame in
 * which it originated. A request is said to be first party if it has the same
 * domain (eTLD+1) as the frame in which the request originated.
 */
class DomainType extends ChromeEnum {
  static const DomainType FIRST_PARTY = const DomainType._('firstParty');
  static const DomainType THIRD_PARTY = const DomainType._('thirdParty');

  static const List<DomainType> VALUES = const[FIRST_PARTY, THIRD_PARTY];

  const DomainType._(String str): super(str);
}

/**
 * This describes the possible operations for a "modifyHeaders" rule.
 */
class HeaderOperation extends ChromeEnum {
  static const HeaderOperation APPEND = const HeaderOperation._('append');
  static const HeaderOperation SET = const HeaderOperation._('set');
  static const HeaderOperation REMOVE = const HeaderOperation._('remove');

  static const List<HeaderOperation> VALUES = const[APPEND, SET, REMOVE];

  const HeaderOperation._(String str): super(str);
}

/**
 * Describes the kind of action to take if a given RuleCondition matches.
 */
class RuleActionType extends ChromeEnum {
  static const RuleActionType BLOCK = const RuleActionType._('block');
  static const RuleActionType REDIRECT = const RuleActionType._('redirect');
  static const RuleActionType ALLOW = const RuleActionType._('allow');
  static const RuleActionType UPGRADE_SCHEME = const RuleActionType._('upgradeScheme');
  static const RuleActionType MODIFY_HEADERS = const RuleActionType._('modifyHeaders');
  static const RuleActionType ALLOW_ALL_REQUESTS = const RuleActionType._('allowAllRequests');

  static const List<RuleActionType> VALUES = const[BLOCK, REDIRECT, ALLOW, UPGRADE_SCHEME, MODIFY_HEADERS, ALLOW_ALL_REQUESTS];

  const RuleActionType._(String str): super(str);
}

/**
 * Describes the reason why a given regular expression isn't supported.
 */
class UnsupportedRegexReason extends ChromeEnum {
  static const UnsupportedRegexReason SYNTAX_ERROR = const UnsupportedRegexReason._('syntaxError');
  static const UnsupportedRegexReason MEMORY_LIMIT_EXCEEDED = const UnsupportedRegexReason._('memoryLimitExceeded');

  static const List<UnsupportedRegexReason> VALUES = const[SYNTAX_ERROR, MEMORY_LIMIT_EXCEEDED];

  const UnsupportedRegexReason._(String str): super(str);
}

/**
 * Describes a single static ruleset.
 */
class Ruleset extends ChromeObject {
  Ruleset({String? id, String? path, bool? enabled}) {
    if (id != null) this.id = id;
    if (path != null) this.path = path;
    if (enabled != null) this.enabled = enabled;
  }
  Ruleset.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  String get path => jsProxy['path'];
  set path(String value) => jsProxy['path'] = value;

  bool get enabled => jsProxy['enabled'];
  set enabled(bool value) => jsProxy['enabled'] = value;
}

/**
 * Represents a query key-value pair.
 */
class QueryKeyValue extends ChromeObject {
  QueryKeyValue({String? key, String? value, bool? replaceOnly}) {
    if (key != null) this.key = key;
    if (value != null) this.value = value;
    if (replaceOnly != null) this.replaceOnly = replaceOnly;
  }
  QueryKeyValue.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get key => jsProxy['key'];
  set key(String value) => jsProxy['key'] = value;

  String get value => jsProxy['value'];
  set value(String value) => jsProxy['value'] = value;

  bool get replaceOnly => jsProxy['replaceOnly'];
  set replaceOnly(bool value) => jsProxy['replaceOnly'] = value;
}

/**
 * Describes modification to the url query.
 */
class QueryTransform extends ChromeObject {
  QueryTransform({List<String>? removeParams, List<QueryKeyValue>? addOrReplaceParams}) {
    if (removeParams != null) this.removeParams = removeParams;
    if (addOrReplaceParams != null) this.addOrReplaceParams = addOrReplaceParams;
  }
  QueryTransform.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<String> get removeParams => listify(jsProxy['removeParams']);
  set removeParams(List<String> value) => jsProxy['removeParams'] = jsify(value);

  List<QueryKeyValue> get addOrReplaceParams => listify(jsProxy['addOrReplaceParams'], _createQueryKeyValue);
  set addOrReplaceParams(List<QueryKeyValue> value) => jsProxy['addOrReplaceParams'] = jsify(value);
}

/**
 * Describes modification to various url components.
 */
class URLTransform extends ChromeObject {
  URLTransform({String? scheme, String? host, String? port, String? path, String? query, QueryTransform? queryTransform, String? fragment, String? username, String? password}) {
    if (scheme != null) this.scheme = scheme;
    if (host != null) this.host = host;
    if (port != null) this.port = port;
    if (path != null) this.path = path;
    if (query != null) this.query = query;
    if (queryTransform != null) this.queryTransform = queryTransform;
    if (fragment != null) this.fragment = fragment;
    if (username != null) this.username = username;
    if (password != null) this.password = password;
  }
  URLTransform.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get scheme => jsProxy['scheme'];
  set scheme(String value) => jsProxy['scheme'] = value;

  String get host => jsProxy['host'];
  set host(String value) => jsProxy['host'] = value;

  String get port => jsProxy['port'];
  set port(String value) => jsProxy['port'] = value;

  String get path => jsProxy['path'];
  set path(String value) => jsProxy['path'] = value;

  String get query => jsProxy['query'];
  set query(String value) => jsProxy['query'] = value;

  QueryTransform get queryTransform => _createQueryTransform(jsProxy['queryTransform']);
  set queryTransform(QueryTransform value) => jsProxy['queryTransform'] = jsify(value);

  String get fragment => jsProxy['fragment'];
  set fragment(String value) => jsProxy['fragment'] = value;

  String get username => jsProxy['username'];
  set username(String value) => jsProxy['username'] = value;

  String get password => jsProxy['password'];
  set password(String value) => jsProxy['password'] = value;
}

class Redirect extends ChromeObject {
  Redirect({String? extensionPath, URLTransform? transform, String? url, String? regexSubstitution}) {
    if (extensionPath != null) this.extensionPath = extensionPath;
    if (transform != null) this.transform = transform;
    if (url != null) this.url = url;
    if (regexSubstitution != null) this.regexSubstitution = regexSubstitution;
  }
  Redirect.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get extensionPath => jsProxy['extensionPath'];
  set extensionPath(String value) => jsProxy['extensionPath'] = value;

  URLTransform get transform => _createURLTransform(jsProxy['transform']);
  set transform(URLTransform value) => jsProxy['transform'] = jsify(value);

  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  String get regexSubstitution => jsProxy['regexSubstitution'];
  set regexSubstitution(String value) => jsProxy['regexSubstitution'] = value;
}

class RuleCondition extends ChromeObject {
  RuleCondition({String? urlFilter, String? regexFilter, bool? isUrlFilterCaseSensitive, List<String>? initiatorDomains, List<String>? excludedInitiatorDomains, List<String>? requestDomains, List<String>? excludedRequestDomains, List<String>? domains, List<String>? excludedDomains, List<ResourceType>? resourceTypes, List<ResourceType>? excludedResourceTypes, List<RequestMethod>? requestMethods, List<RequestMethod>? excludedRequestMethods, DomainType? domainType, List<int>? tabIds, List<int>? excludedTabIds}) {
    if (urlFilter != null) this.urlFilter = urlFilter;
    if (regexFilter != null) this.regexFilter = regexFilter;
    if (isUrlFilterCaseSensitive != null) this.isUrlFilterCaseSensitive = isUrlFilterCaseSensitive;
    if (initiatorDomains != null) this.initiatorDomains = initiatorDomains;
    if (excludedInitiatorDomains != null) this.excludedInitiatorDomains = excludedInitiatorDomains;
    if (requestDomains != null) this.requestDomains = requestDomains;
    if (excludedRequestDomains != null) this.excludedRequestDomains = excludedRequestDomains;
    if (domains != null) this.domains = domains;
    if (excludedDomains != null) this.excludedDomains = excludedDomains;
    if (resourceTypes != null) this.resourceTypes = resourceTypes;
    if (excludedResourceTypes != null) this.excludedResourceTypes = excludedResourceTypes;
    if (requestMethods != null) this.requestMethods = requestMethods;
    if (excludedRequestMethods != null) this.excludedRequestMethods = excludedRequestMethods;
    if (domainType != null) this.domainType = domainType;
    if (tabIds != null) this.tabIds = tabIds;
    if (excludedTabIds != null) this.excludedTabIds = excludedTabIds;
  }
  RuleCondition.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get urlFilter => jsProxy['urlFilter'];
  set urlFilter(String value) => jsProxy['urlFilter'] = value;

  String get regexFilter => jsProxy['regexFilter'];
  set regexFilter(String value) => jsProxy['regexFilter'] = value;

  bool get isUrlFilterCaseSensitive => jsProxy['isUrlFilterCaseSensitive'];
  set isUrlFilterCaseSensitive(bool value) => jsProxy['isUrlFilterCaseSensitive'] = value;

  List<String> get initiatorDomains => listify(jsProxy['initiatorDomains']);
  set initiatorDomains(List<String> value) => jsProxy['initiatorDomains'] = jsify(value);

  List<String> get excludedInitiatorDomains => listify(jsProxy['excludedInitiatorDomains']);
  set excludedInitiatorDomains(List<String> value) => jsProxy['excludedInitiatorDomains'] = jsify(value);

  List<String> get requestDomains => listify(jsProxy['requestDomains']);
  set requestDomains(List<String> value) => jsProxy['requestDomains'] = jsify(value);

  List<String> get excludedRequestDomains => listify(jsProxy['excludedRequestDomains']);
  set excludedRequestDomains(List<String> value) => jsProxy['excludedRequestDomains'] = jsify(value);

  List<String> get domains => listify(jsProxy['domains']);
  set domains(List<String> value) => jsProxy['domains'] = jsify(value);

  List<String> get excludedDomains => listify(jsProxy['excludedDomains']);
  set excludedDomains(List<String> value) => jsProxy['excludedDomains'] = jsify(value);

  List<ResourceType> get resourceTypes => listify(jsProxy['resourceTypes'], _createResourceType);
  set resourceTypes(List<ResourceType> value) => jsProxy['resourceTypes'] = jsify(value);

  List<ResourceType> get excludedResourceTypes => listify(jsProxy['excludedResourceTypes'], _createResourceType);
  set excludedResourceTypes(List<ResourceType> value) => jsProxy['excludedResourceTypes'] = jsify(value);

  List<RequestMethod> get requestMethods => listify(jsProxy['requestMethods'], _createRequestMethod);
  set requestMethods(List<RequestMethod> value) => jsProxy['requestMethods'] = jsify(value);

  List<RequestMethod> get excludedRequestMethods => listify(jsProxy['excludedRequestMethods'], _createRequestMethod);
  set excludedRequestMethods(List<RequestMethod> value) => jsProxy['excludedRequestMethods'] = jsify(value);

  DomainType get domainType => _createDomainType(jsProxy['domainType']);
  set domainType(DomainType value) => jsProxy['domainType'] = jsify(value);

  List<int> get tabIds => listify(jsProxy['tabIds']);
  set tabIds(List<int> value) => jsProxy['tabIds'] = jsify(value);

  List<int> get excludedTabIds => listify(jsProxy['excludedTabIds']);
  set excludedTabIds(List<int> value) => jsProxy['excludedTabIds'] = jsify(value);
}

class ModifyHeaderInfo extends ChromeObject {
  ModifyHeaderInfo({String? header, HeaderOperation? operation, String? value}) {
    if (header != null) this.header = header;
    if (operation != null) this.operation = operation;
    if (value != null) this.value = value;
  }
  ModifyHeaderInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get header => jsProxy['header'];
  set header(String value) => jsProxy['header'] = value;

  HeaderOperation get operation => _createHeaderOperation(jsProxy['operation']);
  set operation(HeaderOperation value) => jsProxy['operation'] = jsify(value);

  String get value => jsProxy['value'];
  set value(String value) => jsProxy['value'] = value;
}

class RuleAction extends ChromeObject {
  RuleAction({RuleActionType? type, Redirect? redirect, List<ModifyHeaderInfo>? requestHeaders, List<ModifyHeaderInfo>? responseHeaders}) {
    if (type != null) this.type = type;
    if (redirect != null) this.redirect = redirect;
    if (requestHeaders != null) this.requestHeaders = requestHeaders;
    if (responseHeaders != null) this.responseHeaders = responseHeaders;
  }
  RuleAction.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  RuleActionType get type => _createRuleActionType(jsProxy['type']);
  set type(RuleActionType value) => jsProxy['type'] = jsify(value);

  Redirect get redirect => _createRedirect(jsProxy['redirect']);
  set redirect(Redirect value) => jsProxy['redirect'] = jsify(value);

  List<ModifyHeaderInfo> get requestHeaders => listify(jsProxy['requestHeaders'], _createModifyHeaderInfo);
  set requestHeaders(List<ModifyHeaderInfo> value) => jsProxy['requestHeaders'] = jsify(value);

  List<ModifyHeaderInfo> get responseHeaders => listify(jsProxy['responseHeaders'], _createModifyHeaderInfo);
  set responseHeaders(List<ModifyHeaderInfo> value) => jsProxy['responseHeaders'] = jsify(value);
}

class Rule extends ChromeObject {
  Rule({int? id, int? priority, RuleCondition? condition, RuleAction? action}) {
    if (id != null) this.id = id;
    if (priority != null) this.priority = priority;
    if (condition != null) this.condition = condition;
    if (action != null) this.action = action;
  }
  Rule.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get id => jsProxy['id'];
  set id(int value) => jsProxy['id'] = value;

  int get priority => jsProxy['priority'];
  set priority(int value) => jsProxy['priority'] = value;

  RuleCondition get condition => _createRuleCondition(jsProxy['condition']);
  set condition(RuleCondition value) => jsProxy['condition'] = jsify(value);

  RuleAction get action => _createRuleAction(jsProxy['action']);
  set action(RuleAction value) => jsProxy['action'] = jsify(value);
}

/**
 * Uniquely describes a declarative rule specified by the extension.
 */
class MatchedRule extends ChromeObject {
  MatchedRule({int? ruleId, String? rulesetId}) {
    if (ruleId != null) this.ruleId = ruleId;
    if (rulesetId != null) this.rulesetId = rulesetId;
  }
  MatchedRule.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get ruleId => jsProxy['ruleId'];
  set ruleId(int value) => jsProxy['ruleId'] = value;

  String get rulesetId => jsProxy['rulesetId'];
  set rulesetId(String value) => jsProxy['rulesetId'] = value;
}

class GetRulesFilter extends ChromeObject {
  GetRulesFilter({List<int>? ruleIds}) {
    if (ruleIds != null) this.ruleIds = ruleIds;
  }
  GetRulesFilter.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<int> get ruleIds => listify(jsProxy['ruleIds']);
  set ruleIds(List<int> value) => jsProxy['ruleIds'] = jsify(value);
}

class MatchedRuleInfo extends ChromeObject {
  MatchedRuleInfo({MatchedRule? rule, num? timeStamp, int? tabId}) {
    if (rule != null) this.rule = rule;
    if (timeStamp != null) this.timeStamp = timeStamp;
    if (tabId != null) this.tabId = tabId;
  }
  MatchedRuleInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  MatchedRule get rule => _createMatchedRule(jsProxy['rule']);
  set rule(MatchedRule value) => jsProxy['rule'] = jsify(value);

  num get timeStamp => jsProxy['timeStamp'];
  set timeStamp(num value) => jsProxy['timeStamp'] = jsify(value);

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

class MatchedRulesFilter extends ChromeObject {
  MatchedRulesFilter({int? tabId, num? minTimeStamp}) {
    if (tabId != null) this.tabId = tabId;
    if (minTimeStamp != null) this.minTimeStamp = minTimeStamp;
  }
  MatchedRulesFilter.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;

  num get minTimeStamp => jsProxy['minTimeStamp'];
  set minTimeStamp(num value) => jsProxy['minTimeStamp'] = jsify(value);
}

class RulesMatchedDetails extends ChromeObject {
  RulesMatchedDetails({List<MatchedRuleInfo>? rulesMatchedInfo}) {
    if (rulesMatchedInfo != null) this.rulesMatchedInfo = rulesMatchedInfo;
  }
  RulesMatchedDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<MatchedRuleInfo> get rulesMatchedInfo => listify(jsProxy['rulesMatchedInfo'], _createMatchedRuleInfo);
  set rulesMatchedInfo(List<MatchedRuleInfo> value) => jsProxy['rulesMatchedInfo'] = jsify(value);
}

class RequestDetails extends ChromeObject {
  RequestDetails({String? requestId, String? url, String? initiator, String? method, int? frameId, String? documentId, extensionTypes.FrameType? frameType, extensionTypes.DocumentLifecycle? documentLifecycle, int? parentFrameId, String? parentDocumentId, int? tabId, ResourceType? type}) {
    if (requestId != null) this.requestId = requestId;
    if (url != null) this.url = url;
    if (initiator != null) this.initiator = initiator;
    if (method != null) this.method = method;
    if (frameId != null) this.frameId = frameId;
    if (documentId != null) this.documentId = documentId;
    if (frameType != null) this.frameType = frameType;
    if (documentLifecycle != null) this.documentLifecycle = documentLifecycle;
    if (parentFrameId != null) this.parentFrameId = parentFrameId;
    if (parentDocumentId != null) this.parentDocumentId = parentDocumentId;
    if (tabId != null) this.tabId = tabId;
    if (type != null) this.type = type;
  }
  RequestDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get requestId => jsProxy['requestId'];
  set requestId(String value) => jsProxy['requestId'] = value;

  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  String get initiator => jsProxy['initiator'];
  set initiator(String value) => jsProxy['initiator'] = value;

  String get method => jsProxy['method'];
  set method(String value) => jsProxy['method'] = value;

  int get frameId => jsProxy['frameId'];
  set frameId(int value) => jsProxy['frameId'] = value;

  String get documentId => jsProxy['documentId'];
  set documentId(String value) => jsProxy['documentId'] = value;

  extensionTypes.FrameType get frameType => _createextensionTypes.FrameType(jsProxy['frameType']);
  set frameType(extensionTypes.FrameType value) => jsProxy['frameType'] = jsify(value);

  extensionTypes.DocumentLifecycle get documentLifecycle => _createextensionTypes.DocumentLifecycle(jsProxy['documentLifecycle']);
  set documentLifecycle(extensionTypes.DocumentLifecycle value) => jsProxy['documentLifecycle'] = jsify(value);

  int get parentFrameId => jsProxy['parentFrameId'];
  set parentFrameId(int value) => jsProxy['parentFrameId'] = value;

  String get parentDocumentId => jsProxy['parentDocumentId'];
  set parentDocumentId(String value) => jsProxy['parentDocumentId'] = value;

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;

  ResourceType get type => _createResourceType(jsProxy['type']);
  set type(ResourceType value) => jsProxy['type'] = jsify(value);
}

class TestMatchRequestDetails extends ChromeObject {
  TestMatchRequestDetails({String? url, String? initiator, RequestMethod? method, ResourceType? type, int? tabId}) {
    if (url != null) this.url = url;
    if (initiator != null) this.initiator = initiator;
    if (method != null) this.method = method;
    if (type != null) this.type = type;
    if (tabId != null) this.tabId = tabId;
  }
  TestMatchRequestDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  String get initiator => jsProxy['initiator'];
  set initiator(String value) => jsProxy['initiator'] = value;

  RequestMethod get method => _createRequestMethod(jsProxy['method']);
  set method(RequestMethod value) => jsProxy['method'] = jsify(value);

  ResourceType get type => _createResourceType(jsProxy['type']);
  set type(ResourceType value) => jsProxy['type'] = jsify(value);

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

class MatchedRuleInfoDebug extends ChromeObject {
  MatchedRuleInfoDebug({MatchedRule? rule, RequestDetails? request}) {
    if (rule != null) this.rule = rule;
    if (request != null) this.request = request;
  }
  MatchedRuleInfoDebug.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  MatchedRule get rule => _createMatchedRule(jsProxy['rule']);
  set rule(MatchedRule value) => jsProxy['rule'] = jsify(value);

  RequestDetails get request => _createRequestDetails(jsProxy['request']);
  set request(RequestDetails value) => jsProxy['request'] = jsify(value);
}

class DNRInfo extends ChromeObject {
  DNRInfo({List<Ruleset>? rule_resources}) {
    if (rule_resources != null) this.rule_resources = rule_resources;
  }
  DNRInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<Ruleset> get rule_resources => listify(jsProxy['rule_resources'], _createRuleset);
  set rule_resources(List<Ruleset> value) => jsProxy['rule_resources'] = jsify(value);
}

class ManifestKeys extends ChromeObject {
  ManifestKeys({DNRInfo? declarative_net_request}) {
    if (declarative_net_request != null) this.declarative_net_request = declarative_net_request;
  }
  ManifestKeys.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  DNRInfo get declarative_net_request => _createDNRInfo(jsProxy['declarative_net_request']);
  set declarative_net_request(DNRInfo value) => jsProxy['declarative_net_request'] = jsify(value);
}

class RegexOptions extends ChromeObject {
  RegexOptions({String? regex, bool? isCaseSensitive, bool? requireCapturing}) {
    if (regex != null) this.regex = regex;
    if (isCaseSensitive != null) this.isCaseSensitive = isCaseSensitive;
    if (requireCapturing != null) this.requireCapturing = requireCapturing;
  }
  RegexOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get regex => jsProxy['regex'];
  set regex(String value) => jsProxy['regex'] = value;

  bool get isCaseSensitive => jsProxy['isCaseSensitive'];
  set isCaseSensitive(bool value) => jsProxy['isCaseSensitive'] = value;

  bool get requireCapturing => jsProxy['requireCapturing'];
  set requireCapturing(bool value) => jsProxy['requireCapturing'] = value;
}

class IsRegexSupportedResult extends ChromeObject {
  IsRegexSupportedResult({bool? isSupported, UnsupportedRegexReason? reason}) {
    if (isSupported != null) this.isSupported = isSupported;
    if (reason != null) this.reason = reason;
  }
  IsRegexSupportedResult.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  bool get isSupported => jsProxy['isSupported'];
  set isSupported(bool value) => jsProxy['isSupported'] = value;

  UnsupportedRegexReason get reason => _createUnsupportedRegexReason(jsProxy['reason']);
  set reason(UnsupportedRegexReason value) => jsProxy['reason'] = jsify(value);
}

class TestMatchOutcomeResult extends ChromeObject {
  TestMatchOutcomeResult({List<MatchedRule>? matchedRules}) {
    if (matchedRules != null) this.matchedRules = matchedRules;
  }
  TestMatchOutcomeResult.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<MatchedRule> get matchedRules => listify(jsProxy['matchedRules'], _createMatchedRule);
  set matchedRules(List<MatchedRule> value) => jsProxy['matchedRules'] = jsify(value);
}

class UpdateRuleOptions extends ChromeObject {
  UpdateRuleOptions({List<int>? removeRuleIds, List<Rule>? addRules}) {
    if (removeRuleIds != null) this.removeRuleIds = removeRuleIds;
    if (addRules != null) this.addRules = addRules;
  }
  UpdateRuleOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<int> get removeRuleIds => listify(jsProxy['removeRuleIds']);
  set removeRuleIds(List<int> value) => jsProxy['removeRuleIds'] = jsify(value);

  List<Rule> get addRules => listify(jsProxy['addRules'], _createRule);
  set addRules(List<Rule> value) => jsProxy['addRules'] = jsify(value);
}

class UpdateRulesetOptions extends ChromeObject {
  UpdateRulesetOptions({List<String>? disableRulesetIds, List<String>? enableRulesetIds}) {
    if (disableRulesetIds != null) this.disableRulesetIds = disableRulesetIds;
    if (enableRulesetIds != null) this.enableRulesetIds = enableRulesetIds;
  }
  UpdateRulesetOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<String> get disableRulesetIds => listify(jsProxy['disableRulesetIds']);
  set disableRulesetIds(List<String> value) => jsProxy['disableRulesetIds'] = jsify(value);

  List<String> get enableRulesetIds => listify(jsProxy['enableRulesetIds']);
  set enableRulesetIds(List<String> value) => jsProxy['enableRulesetIds'] = jsify(value);
}

class UpdateStaticRulesOptions extends ChromeObject {
  UpdateStaticRulesOptions({String? rulesetId, List<int>? disableRuleIds, List<int>? enableRuleIds}) {
    if (rulesetId != null) this.rulesetId = rulesetId;
    if (disableRuleIds != null) this.disableRuleIds = disableRuleIds;
    if (enableRuleIds != null) this.enableRuleIds = enableRuleIds;
  }
  UpdateStaticRulesOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get rulesetId => jsProxy['rulesetId'];
  set rulesetId(String value) => jsProxy['rulesetId'] = value;

  List<int> get disableRuleIds => listify(jsProxy['disableRuleIds']);
  set disableRuleIds(List<int> value) => jsProxy['disableRuleIds'] = jsify(value);

  List<int> get enableRuleIds => listify(jsProxy['enableRuleIds']);
  set enableRuleIds(List<int> value) => jsProxy['enableRuleIds'] = jsify(value);
}

class GetDisabledRuleIdsOptions extends ChromeObject {
  GetDisabledRuleIdsOptions({String? rulesetId}) {
    if (rulesetId != null) this.rulesetId = rulesetId;
  }
  GetDisabledRuleIdsOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get rulesetId => jsProxy['rulesetId'];
  set rulesetId(String value) => jsProxy['rulesetId'] = value;
}

class TabActionCountUpdate extends ChromeObject {
  TabActionCountUpdate({int? tabId, int? increment}) {
    if (tabId != null) this.tabId = tabId;
    if (increment != null) this.increment = increment;
  }
  TabActionCountUpdate.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;

  int get increment => jsProxy['increment'];
  set increment(int value) => jsProxy['increment'] = value;
}

class ExtensionActionOptions extends ChromeObject {
  ExtensionActionOptions({bool? displayActionCountAsBadgeText, TabActionCountUpdate? tabUpdate}) {
    if (displayActionCountAsBadgeText != null) this.displayActionCountAsBadgeText = displayActionCountAsBadgeText;
    if (tabUpdate != null) this.tabUpdate = tabUpdate;
  }
  ExtensionActionOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  bool get displayActionCountAsBadgeText => jsProxy['displayActionCountAsBadgeText'];
  set displayActionCountAsBadgeText(bool value) => jsProxy['displayActionCountAsBadgeText'] = value;

  TabActionCountUpdate get tabUpdate => _createTabActionCountUpdate(jsProxy['tabUpdate']);
  set tabUpdate(TabActionCountUpdate value) => jsProxy['tabUpdate'] = jsify(value);
}

MatchedRuleInfoDebug _createMatchedRuleInfoDebug(JsObject jsProxy) => MatchedRuleInfoDebug.fromProxy(jsProxy);
Rule _createRule(JsObject jsProxy) => Rule.fromProxy(jsProxy);
RulesMatchedDetails _createRulesMatchedDetails(JsObject jsProxy) => RulesMatchedDetails.fromProxy(jsProxy);
IsRegexSupportedResult _createIsRegexSupportedResult(JsObject jsProxy) => IsRegexSupportedResult.fromProxy(jsProxy);
TestMatchOutcomeResult _createTestMatchOutcomeResult(JsObject jsProxy) => TestMatchOutcomeResult.fromProxy(jsProxy);
QueryKeyValue _createQueryKeyValue(JsObject jsProxy) => QueryKeyValue.fromProxy(jsProxy);
QueryTransform _createQueryTransform(JsObject jsProxy) => QueryTransform.fromProxy(jsProxy);
URLTransform _createURLTransform(JsObject jsProxy) => URLTransform.fromProxy(jsProxy);
ResourceType _createResourceType(String value) => ResourceType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
RequestMethod _createRequestMethod(String value) => RequestMethod.VALUES.singleWhere((ChromeEnum e) => e.value == value);
DomainType _createDomainType(String value) => DomainType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
HeaderOperation _createHeaderOperation(String value) => HeaderOperation.VALUES.singleWhere((ChromeEnum e) => e.value == value);
RuleActionType _createRuleActionType(String value) => RuleActionType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
Redirect _createRedirect(JsObject jsProxy) => Redirect.fromProxy(jsProxy);
ModifyHeaderInfo _createModifyHeaderInfo(JsObject jsProxy) => ModifyHeaderInfo.fromProxy(jsProxy);
RuleCondition _createRuleCondition(JsObject jsProxy) => RuleCondition.fromProxy(jsProxy);
RuleAction _createRuleAction(JsObject jsProxy) => RuleAction.fromProxy(jsProxy);
MatchedRule _createMatchedRule(JsObject jsProxy) => MatchedRule.fromProxy(jsProxy);
MatchedRuleInfo _createMatchedRuleInfo(JsObject jsProxy) => MatchedRuleInfo.fromProxy(jsProxy);
extensionTypes.FrameType _createextensionTypes.FrameType(JsObject jsProxy) => extensionTypes.FrameType.fromProxy(jsProxy);
extensionTypes.DocumentLifecycle _createextensionTypes.DocumentLifecycle(JsObject jsProxy) => extensionTypes.DocumentLifecycle.fromProxy(jsProxy);
RequestDetails _createRequestDetails(JsObject jsProxy) => RequestDetails.fromProxy(jsProxy);
Ruleset _createRuleset(JsObject jsProxy) => Ruleset.fromProxy(jsProxy);
DNRInfo _createDNRInfo(JsObject jsProxy) => DNRInfo.fromProxy(jsProxy);
UnsupportedRegexReason _createUnsupportedRegexReason(String value) => UnsupportedRegexReason.VALUES.singleWhere((ChromeEnum e) => e.value == value);
TabActionCountUpdate _createTabActionCountUpdate(JsObject jsProxy) => TabActionCountUpdate.fromProxy(jsProxy);
