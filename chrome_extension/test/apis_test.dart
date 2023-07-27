import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:puppeteer/protocol/dev_tools.dart';
import 'package:puppeteer/puppeteer.dart';
import 'package:puppeteer/puppeteer.dart' as pup;
import 'package:puppeteer/protocol/runtime.dart' as pup;
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

import 'test_context.dart';

void main() {
  test('first test', () {});
  test(
      'chrome.*.isAvailable',
      () => runTest('test/check_available.dart',
          manifest: File('test/manifest_no_permission.json')));
  test('chrome.accessibilityFeatures',
      () => runTest('test/apis/accessibility_features.dart'));
  test('chrome.action', () => runTest('test/apis/action.dart'));
  test('chrome.alarms', () => runTest('test/apis/alarms.dart'));
  test('chrome.bookmarks', () => runTest('test/apis/bookmarks.dart'));
  test('chrome.browsingData', () => runTest('test/apis/browsing_data.dart'));
  test('chrome.contextMenus', () => runTest('test/apis/context_menus.dart'));
  test('chrome.i18n', () => runTest('test/apis/i18n.dart'));
  test('chrome.privacy', () => runTest('test/apis/privacy.dart'));
  test('chrome.runtime', () => runTest('test/apis/runtime.dart'));
  test('chrome.storage', () => runTest('test/apis/storage.dart'));
  test('chrome.system.cpu', () => runTest('test/apis/system_cpu.dart'));
  test('chrome.system.display', () => runTest('test/apis/system_display.dart'));
  test('chrome.system.memory', () => runTest('test/apis/system_memory.dart'));
  test('chrome.system.network', () => runTest('test/apis/system_network.dart'));
  test('chrome.system.storage', () => runTest('test/apis/system_storage.dart'));
  test('chrome.tabs', () => runTest('test/apis/tabs.dart'));
}

Future<void> runTest(String filePath, {File? manifest}) async {
  manifest ??= File('test/manifest.json');

  var manifestVersion = _readManifestVersion(manifest);
  if (manifestVersion < 3) {
    throw Exception('Manifest before v3 is not supported');
  }

  var chromeExtensionDir = Directory(p.join('.dart_tool', 'chrome_extension'))
    ..createSync(recursive: true);
  var extensionDir = chromeExtensionDir.createTempSync();
  var extensionPath = extensionDir.path;

  var compileResult = await Process.run(Platform.resolvedExecutable, [
    'compile',
    'js',
    filePath,
    '--csp',
    '--enable-asserts',
    '--output',
    p.join(extensionDir.path, 'background.js')
  ]);
  if (compileResult.exitCode != 0) {
    throw Exception(
        'Error when compiling JS (${compileResult.exitCode}).\n${compileResult.stdout}\n${compileResult.stderr}');
  }
  manifest.copySync(p.join(extensionPath, 'manifest.json'));

  var browser = await puppeteer.launch(
    headless: false,
    args: [
      '--disable-extensions-except=$extensionPath',
      '--load-extension=$extensionPath',
    ],
  );
  try {
    var targetName = manifestVersion < 3 ? 'background_page' : 'service_worker';

    var backgroundPageTarget =
        browser.targets.firstWhereOrNull((t) => t.type == targetName);
    backgroundPageTarget ??=
        await browser.waitForTarget((target) => target.type == targetName);
    expect(backgroundPageTarget.isPage, isFalse);
    var worker = (await backgroundPageTarget.worker)!;

    var endCompleter = Completer<bool>();

    var endDetector = RegExp(r'[0-9]{2}:[0-9]{2}.*:(.*)');
    DevTools(worker.client).runtime.onConsoleAPICalled.listen((e) {
      var message = e.args.map((e) => e.value).join(',');
      print('[Extension message] $message');

      if (endDetector.firstMatch(message) case var match?) {
        var testName = match.group(1)!.trim();
        if (testName.contains('Some tests failed.')) {
          endCompleter.complete(false);
        } else if (testName.startsWith('All tests passed!')) {
          endCompleter.complete(true);
        }
      }
    });
    await waitFor(() async => await worker.evaluate(_checkIsReady));

    var context = TestContext(
        puppeteerUrl: browser.wsEndpoint,
        operatingSystem: Platform.operatingSystem);
    await worker.evaluate('(context) => startFunction(context)',
        args: [jsonEncode(context.toJson())]);

    var isOk = await endCompleter.future;
    if (!isOk) {
      fail('Some tests failed.');
    }
  } finally {
    await browser.close();
  }

  extensionDir.deleteSync(recursive: true);
}

Future<void> waitFor(FutureOr<bool> Function() predicate,
    {Duration? pollInterval, Duration? timeout}) async {
  pollInterval ??= Duration(milliseconds: 100);
  timeout ??= Duration(seconds: 10);
  var stopwatch = Stopwatch()..start();
  while (true) {
    var result = await predicate();
    if (result) return;
    if (stopwatch.elapsed > timeout) {
      throw TimeoutException('waitFor has timed out');
    }

    await Future.delayed(pollInterval);
  }
}

final _checkIsReady = '''() => {
try {
  return isReady === true;
} catch (e) {
  return false;
}      
}''';

int _readManifestVersion(File file) {
  var content = file.readAsStringSync();
  var map = jsonDecode(content) as Map<String, dynamic>;
  return map['manifest_version']! as int;
}
