import 'package:checks/checks.dart';
import 'package:chrome_apis/src/internal_helpers.dart';
import 'package:test/test.dart';

import '../client_side_wrapper.dart';
import 'package:chrome_apis/bookmarks.dart';

void main() => setup(_tests);

void _tests(TestContext context) {

  test('create', () async {
    var node = await chrome.bookmarks.create(
        CreateDetails(title: 'One bookmark', url: 'https://google.com'));
    check(node.url).equals('https://google.com/');
    check(node.title).equals('One bookmark');

    var nodes = await chrome.bookmarks.get(node.id);
    check(nodes).length.equals(1);
    check(nodes.first.url).equals('https://google.com/');

    await chrome.bookmarks.remove(node.id);
  });

  test('getTree', () async {
    var node = await chrome.bookmarks.create(
        CreateDetails(title: 'One bookmark', url: 'https://google.com'));
    var tree = await chrome.bookmarks.getTree();

    check(tree).isNotEmpty();
    await chrome.bookmarks.remove(node.id);
  });

  test('Events', () async {
    chrome.bookmarks.onCreated.listen(expectAsync1((e) {
      check(e.id).isNotNull();
      check(e.bookmark.id).isNotNull();
      check(e.bookmark.title).isNotNull();
    }));
    chrome.bookmarks.onRemoved.listen(expectAsync1((e) {
      check(e.id).isNotNull();
      check(e.removeInfo.index).isNotNull();
    }));
    var node = await chrome.bookmarks.create(
        CreateDetails(title: 'One bookmark', url: 'https://google.com'));
    await chrome.bookmarks.remove(node.id);
  });
}
