import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/declarative_net_request.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  test('updateDynamicRules', () async {
    await chrome.declarativeNetRequest
        .updateDynamicRules(UpdateRuleOptions(addRules: [
      Rule(
        id: 0,
        condition: RuleCondition(domains: ['google.com']),
        action: RuleAction(type: RuleActionType.allow),
      )
    ]));

    var rules = await chrome.declarativeNetRequest
        .getDynamicRules(GetRulesFilter(ruleIds: [0]));
    check(rules).length.equals(1);
  });

  test('getAvailableStaticRuleCount', () async {
    var count =
        await chrome.declarativeNetRequest.getAvailableStaticRuleCount();
    check(count).equals(0);
  });
}
