import 'package:checks/checks.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/i18n.dart';

void main() => setup(_tests);

void _tests(TestContext context) {
  test('getAcceptLanguages', () async {
    var languages = await chrome.i18n.getAcceptLanguages();
    check(languages).isNotEmpty();
  });

  test('detectLanguage', () async {
    var language = await chrome.i18n.detectLanguage('Bonjour tout le monde');
    check(language.languages.first.language).equals('fr');
    check(language.languages.first.percentage).equals(100);
  });

  test('getUILanguage', () async {
    var language = chrome.i18n.getUILanguage();
    check(language).isNotEmpty();
  });
}
