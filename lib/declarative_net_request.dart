import 'chrome.dart';
export 'chrome.dart';

final _declarativeNetRequest = ChromeDeclarativeNetRequest._();

extension ChromeChromeDeclarativeNetRequestExtension on Chrome {
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
  /// <li>$(ref:MAX_NUMBER_OF_DYNAMIC_AND_SESSION_RULES) is the maximum number
  /// of combined dynamic and session rules an extension can add.</li>
  /// </ul>
  /// |callback|: Called once the update is complete or has failed. In case of
  /// an error, $(ref:runtime.lastError) will be set and no change will be made
  /// to the rule set. This can happen for multiple reasons, such as invalid
  /// rule format, duplicate rule ID, rule count limit exceeded, internal
  /// errors, and others.
  void updateDynamicRules(options) => throw UnimplementedError();

  /// Returns the current set of dynamic rules for the extension. Callers can
  /// optionally filter the list of fetched rules by specifying a
  /// `filter`.
  /// |filter|: An object to filter the list of fetched rules.
  /// |callback|: Called with the set of dynamic rules. An error might be
  /// raised in case of transient internal errors.
  void getDynamicRules(filter) => throw UnimplementedError();

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
  void updateSessionRules(options) => throw UnimplementedError();

  /// Returns the current set of session scoped rules for the extension.
  /// Callers can optionally filter the list of fetched rules by specifying a
  /// `filter`.
  /// |filter|: An object to filter the list of fetched rules.
  /// |callback|: Called with the set of session scoped rules.
  void getSessionRules(filter) => throw UnimplementedError();

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
  void updateEnabledRulesets(options) => throw UnimplementedError();

  /// Returns the ids for the current set of enabled static rulesets.
  /// |callback|: Called with a list of ids, where each id corresponds to an
  /// enabled static $(ref:Ruleset).
  void getEnabledRulesets() => throw UnimplementedError();

  /// Disables and enables individual static rules in a $(ref:Ruleset).
  /// Changes to rules belonging to a disabled $(ref:Ruleset) will take
  /// effect the next time that it becomes enabled.
  /// |callback|: Called once the update is complete. In case of an error,
  /// $(ref:runtime.lastError) will be set and no change will be made to the
  /// enabled static rules.
  void updateStaticRules(options) => throw UnimplementedError();

  /// Returns the list of static rules in the given $(ref:Ruleset) that are
  /// currently disabled.
  /// |options|: Specifies the ruleset to query.
  /// |callback|: Called with a list of ids that correspond to the disabled
  /// rules in that ruleset.
  void getDisabledRuleIds(options) => throw UnimplementedError();

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
  void getMatchedRules(filter) => throw UnimplementedError();

  /// Configures if the action count for tabs should be displayed as the
  /// extension action's badge text and provides a way for that action count to
  /// be incremented.
  void setExtensionActionOptions(options) => throw UnimplementedError();

  /// Checks if the given regular expression will be supported as a
  /// `regexFilter` rule condition.
  /// |regexOptions|: The regular expression to check.
  /// |callback|: Called with details consisting of whether the regular
  /// expression is supported and the reason if not.
  void isRegexSupported(regexOptions) => throw UnimplementedError();

  /// Returns the number of static rules an extension can enable before the
  /// <a href="#global-static-rule-limit">global static rule limit</a> is
  /// reached.
  void getAvailableStaticRuleCount() => throw UnimplementedError();

  /// Checks if any of the extension's declarativeNetRequest rules would match
  /// a hypothetical request.
  /// Note: Only available for unpacked extensions as this is only intended to
  /// be used during extension development.
  /// |requestDetails|: The request details to test.
  /// |callback|: Called with the details of matched rules.
  void testMatchOutcome(request) => throw UnimplementedError();

  /// Fired when a rule is matched with a request. Only available for unpacked
  /// extensions with the `declarativeNetRequestFeedback` permission
  /// as this is intended to be used for debugging purposes only.
  /// |info|: The rule that has been matched along with information about the
  /// associated request.
  Stream get onRuleMatchedDebug => throw UnimplementedError();
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
}
