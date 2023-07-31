import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_router/shelf_router.dart' as shelf;
import 'package:http/http.dart' as http;

part 'communication.g.dart';

// Launch a websocket server
// Compile JS with define that give the server url
// Have the script connect to this server
// Various endpoints:
//   - Send a log (or a test report)
//   - Send a terminate event

class Server {
  final ServerInfo Function() onInfo;
  final void Function(LogRequest) onLog;
  final void Function(TerminateRequest) onTerminate;

  late final router = shelf.Router()
    ..get('/info', (request) => _info())
    ..post('/log', _log)
    ..post('/terminate', _terminate);

  Server({
    required this.onInfo,
    required this.onLog,
    required this.onTerminate,
  });

  shelf.Response _wrapResponse(Object object) {
    return shelf.Response.ok(jsonEncode(object), headers: {
      'content-type': 'application/json',
    });
  }

  shelf.Response _info() {
    return _wrapResponse(onInfo());
  }

  Future<shelf.Response> _log(shelf.Request request) async {
    var log = LogRequest.fromJson(jsonDecode(await request.readAsString()));
    onLog(log);
    return shelf.Response.ok('');
  }

  Future<shelf.Response> _terminate(shelf.Request request) async {
    var terminate =
        TerminateRequest.fromJson(jsonDecode(await request.readAsString()));
    onTerminate(terminate);
    return shelf.Response.ok('');
  }
}

@JsonSerializable()
class ServerInfo {
  final String puppeteerUrl;
  final String platform;

  ServerInfo({required this.puppeteerUrl, required this.platform});

  factory ServerInfo.fromJson(Map<String, dynamic> json) =>
      _$ServerInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ServerInfoToJson(this);
}

@JsonSerializable()
class LogRequest {
  final String log;

  LogRequest({required this.log});

  factory LogRequest.fromJson(Map<String, dynamic> json) =>
      _$LogRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LogRequestToJson(this);
}

@JsonSerializable()
class TerminateRequest {
  final bool success;

  TerminateRequest({required this.success});

  factory TerminateRequest.fromJson(Map<String, dynamic> json) =>
      _$TerminateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TerminateRequestToJson(this);
}
