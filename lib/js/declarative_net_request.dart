import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDeclarativeNetRequestExtension on JSChrome {
  ///  The `chrome.declarativeNetRequest` API is used to block or modify
  ///  network requests by specifying declarative rules. This lets extensions
  ///  modify network requests without intercepting them and viewing their
  /// content,
  ///  thus providing more privacy.
  external JSDeclarativeNetRequest get DeclarativeNetRequest;
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
  external void updateDynamicRules();

  ///  Returns the current set of dynamic rules for the extension. Callers can
  ///  optionally filter the list of fetched rules by specifying a
  ///  `filter`.
  ///  |filter|: An object to filter the list of fetched rules.
  ///  |callback|: Called with the set of dynamic rules. An error might be
  ///  raised in case of transient internal errors.
  external void getDynamicRules();

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
  external void updateSessionRules();

  ///  Returns the current set of session scoped rules for the extension.
  ///  Callers can optionally filter the list of fetched rules by specifying a
  ///  `filter`.
  ///  |filter|: An object to filter the list of fetched rules.
  ///  |callback|: Called with the set of session scoped rules.
  external void getSessionRules();

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
  external void updateEnabledRulesets();

  ///  Returns the ids for the current set of enabled static rulesets.
  ///  |callback|: Called with a list of ids, where each id corresponds to an
  ///  enabled static $(ref:Ruleset).
  external void getEnabledRulesets();

  ///  Disables and enables individual static rules in a $(ref:Ruleset).
  ///  Changes to rules belonging to a disabled $(ref:Ruleset) will take
  ///  effect the next time that it becomes enabled.
  ///  |callback|: Called once the update is complete. In case of an error,
  ///  $(ref:runtime.lastError) will be set and no change will be made to the
  ///  enabled static rules.
  external void updateStaticRules();

  ///  Returns the list of static rules in the given $(ref:Ruleset) that are
  ///  currently disabled.
  ///  |options|: Specifies the ruleset to query.
  ///  |callback|: Called with a list of ids that correspond to the disabled
  ///  rules in that ruleset.
  external void getDisabledRuleIds();

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
  external void getMatchedRules();

  ///  Configures if the action count for tabs should be displayed as the
  ///  extension action's badge text and provides a way for that action count to
  ///  be incremented.
  external void setExtensionActionOptions();

  ///  Checks if the given regular expression will be supported as a
  ///  `regexFilter` rule condition.
  ///  |regexOptions|: The regular expression to check.
  ///  |callback|: Called with details consisting of whether the regular
  ///  expression is supported and the reason if not.
  external void isRegexSupported();

  ///  Returns the number of static rules an extension can enable before the
  ///  <a href="#global-static-rule-limit">global static rule limit</a> is
  ///  reached.
  external void getAvailableStaticRuleCount();

  ///  Checks if any of the extension's declarativeNetRequest rules would match
  ///  a hypothetical request.
  ///  Note: Only available for unpacked extensions as this is only intended to
  ///  be used during extension development.
  ///  |requestDetails|: The request details to test.
  ///  |callback|: Called with the details of matched rules.
  external void testMatchOutcome();

  ///  Fired when a rule is matched with a request. Only available for unpacked
  ///  extensions with the `declarativeNetRequestFeedback` permission
  ///  as this is intended to be used for debugging purposes only.
  ///  |info|: The rule that has been matched along with information about the
  ///  associated request.
  external ChromeEvent get onRuleMatchedDebug;
}
