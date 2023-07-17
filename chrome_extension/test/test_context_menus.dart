library;

import 'package:chrome_apis/runtime.dart' as runtime;
import 'package:chrome_apis/src/internal_helpers.dart';
import 'package:test/test.dart';
import 'package:chrome_apis/context_menus.dart';

void testContextMenus() {
    var id = 'setupMenuItem';

    setUp(() async {
      var createProperties = CreateProperties(id: id, title: 'setup menu item');
      "todo: should not need the .toJS";
      await chrome.contextMenus.create(createProperties, () {}.toJS);
    });

    tearDown(() async {
      await chrome.contextMenus.removeAll();
    });

    test('create -- defaults', () {
      var createProperties = CreateProperties(title: 'create -- defaults');

      var newId = chrome.contextMenus.create(createProperties, null) as int;
      expect(newId, greaterThan(0));
    });

    test('create -- with listener', () {
      var createProperties = CreateProperties(title: 'create -- with listener');

      // TODO(DrMarcII): figure out a mechanism for selecting menu
      var newId =
          chrome.contextMenus.create(createProperties, (_) {}.toJS) as int;
      expect(newId, greaterThan(0));
    });

    test('create -- with many options specified', () {
      var createProperties = CreateProperties(
          type: ItemType.checkbox,
          id: 'testId',
          title: 'create -- with many options specified',
          checked: true,
          contexts: [ContextType.frame, ContextType.selection],
          parentId: id,
          documentUrlPatterns: ['https://www.google.com/'],
          targetUrlPatterns: ['https://www.google.com/'],
          enabled: false);

      var newId = chrome.contextMenus.create(createProperties, null) as String;
      expect(newId, equals("testId"));
    });

    test('update -- title', () async {
      var updateProperties = UpdateProperties(title: 'update -- title');

      await chrome.contextMenus.update(id, updateProperties);
    });

    test('update -- listener', () async {
      var updateProperties = UpdateProperties();

      // TODO(DrMarcII): figure out a mechanism for selecting menu
      await chrome.contextMenus.update(id, updateProperties);
    });

    test('update -- with many options specified', () async {
      var createProperties = CreateProperties(
          id: 'testId', title: 'update -- with many options specified');

      var updateProperties = UpdateProperties(
          type: ItemType.checkbox,
          checked: true,
          contexts: [ContextType.frame, ContextType.selection],
          parentId: id,
          documentUrlPatterns: ['https://www.google.com/'],
          targetUrlPatterns: ['https://www.google.com/'],
          enabled: false);

      var newId = chrome.contextMenus.create(createProperties, null);
      expect(newId, equals("testId"));

      await chrome.contextMenus.update(newId, updateProperties);
    });

    test('update -- failure', () async {
      var updateProperties = UpdateProperties();

      expect(() async => await chrome.contextMenus
          .update('not a real id', updateProperties), throwsA(isA<Exception>()));
    });

    test('remove -- successful', () async {
      await chrome.contextMenus.remove(id);
    });

    test('remove -- failure', () async {
      expect(() async => await chrome.contextMenus.remove('not a real id'),
          throwsA(isA<Exception>()));
    }, timeout: Timeout(Duration(seconds: 2)));

    "";
    //test('onClicked', () {
    //  // TODO(DrMarcII): figure out a mechanism for selecting menu
    //  chrome.contextMenus.onClicked.listen((_) {}).cancel();
    //});
}
