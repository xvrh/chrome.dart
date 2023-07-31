import 'dart:async';

import 'communication.dart';
import 'communication_client.dart';
export 'communication.dart' show ServerInfo;

final _endDetector = RegExp(r'[0-9]{2}:[0-9]{2}.*:(.*)');

Future<void> runTests(void Function(ServerInfo) callback) async {
  try {
    var client = Client();
    var serverInfo = await client.serverInfo();

    runZoned(() {
      callback(serverInfo);
    }, zoneSpecification: ZoneSpecification(print: (self, parent, zone, line) {
      client.log(line);

      if (_endDetector.firstMatch(line) case var match?) {
        var testName = match.group(1)!.trim();
        if (testName.contains('Some tests failed.')) {
          client.terminate(success: false);
        } else if (testName.startsWith('All tests passed!')) {
          client.terminate(success: true);
        }
      }
    }));
  } catch (e) {
    print("Global error $e");
  }
}
