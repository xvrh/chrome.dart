import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:puppeteer/protocol/dev_tools.dart';
import 'package:puppeteer/puppeteer.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  test('target.page() should return a background_page', () async {
    var chromeExtensionDir = Directory(p.join('.dart_tool', 'chrome_extension'))
      ..createSync(recursive: true);
    var extensionDir = chromeExtensionDir.createTempSync();
    var extensionPath = extensionDir.path;

    var compileResult = await Process.run(Platform.resolvedExecutable, [
      'compile',
      'js',
      'test/extension_test_background.dart',
      '--csp',
      '--output',
      p.join(extensionDir.path, 'background.js')
    ]);
    if (compileResult.exitCode != 0) {
      throw Exception(
          'Error when compiling JS (${compileResult.exitCode}).\n${compileResult.stdout}\n${compileResult.stderr}');
    }
    File('test/assets/manifest.json')
        .copySync(p.join(extensionPath, 'manifest.json'));

    var browser = await puppeteer.launch(
      headless: false,
      args: [
        '--disable-extensions-except=$extensionPath',
        '--load-extension=$extensionPath',
      ],
    );
    try {
      var backgroundPageTarget =
          browser.targets.firstWhereOrNull((t) => t.type == 'service_worker');
      backgroundPageTarget ??= await browser
          .waitForTarget((target) => target.type == 'service_worker');
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
      await worker.evaluate('() => startFunction()');

      var isOk = await endCompleter.future;
      if (!isOk) {
        fail('Some tests failed.');
      }
    } finally {
      await browser.close();
    }

    extensionDir.deleteSync(recursive: true);
  });
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