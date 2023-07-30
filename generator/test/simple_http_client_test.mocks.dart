// Mocks generated by Mockito 5.4.3-wip from annotations
// in chrome_extension_generator/test/simple_http_client_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:convert' as _i3;
import 'dart:io' as _i2;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDuration_0 extends _i1.SmartFake implements Duration {
  _FakeDuration_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHttpClientRequest_1 extends _i1.SmartFake
    implements _i2.HttpClientRequest {
  _FakeHttpClientRequest_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUri_2 extends _i1.SmartFake implements Uri {
  _FakeUri_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHttpHeaders_3 extends _i1.SmartFake implements _i2.HttpHeaders {
  _FakeHttpHeaders_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHttpClientResponse_4 extends _i1.SmartFake
    implements _i2.HttpClientResponse {
  _FakeHttpClientResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEncoding_5 extends _i1.SmartFake implements _i3.Encoding {
  _FakeEncoding_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSocket_6 extends _i1.SmartFake implements _i2.Socket {
  _FakeSocket_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamSubscription_7<T> extends _i1.SmartFake
    implements _i4.StreamSubscription<T> {
  _FakeStreamSubscription_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFuture_8<T> extends _i1.SmartFake implements _i4.Future<T> {
  _FakeFuture_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HttpClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i2.HttpClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Duration get idleTimeout => (super.noSuchMethod(
        Invocation.getter(#idleTimeout),
        returnValue: _FakeDuration_0(
          this,
          Invocation.getter(#idleTimeout),
        ),
      ) as Duration);
  @override
  set idleTimeout(Duration? _idleTimeout) => super.noSuchMethod(
        Invocation.setter(
          #idleTimeout,
          _idleTimeout,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set connectionTimeout(Duration? _connectionTimeout) => super.noSuchMethod(
        Invocation.setter(
          #connectionTimeout,
          _connectionTimeout,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set maxConnectionsPerHost(int? _maxConnectionsPerHost) => super.noSuchMethod(
        Invocation.setter(
          #maxConnectionsPerHost,
          _maxConnectionsPerHost,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get autoUncompress => (super.noSuchMethod(
        Invocation.getter(#autoUncompress),
        returnValue: false,
      ) as bool);
  @override
  set autoUncompress(bool? _autoUncompress) => super.noSuchMethod(
        Invocation.setter(
          #autoUncompress,
          _autoUncompress,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set userAgent(String? _userAgent) => super.noSuchMethod(
        Invocation.setter(
          #userAgent,
          _userAgent,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set authenticate(
          _i4.Future<bool> Function(
            Uri,
            String,
            String?,
          )? f) =>
      super.noSuchMethod(
        Invocation.setter(
          #authenticate,
          f,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set connectionFactory(
          _i4.Future<_i2.ConnectionTask<_i2.Socket>> Function(
            Uri,
            String?,
            int?,
          )? f) =>
      super.noSuchMethod(
        Invocation.setter(
          #connectionFactory,
          f,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set findProxy(String Function(Uri)? f) => super.noSuchMethod(
        Invocation.setter(
          #findProxy,
          f,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set authenticateProxy(
          _i4.Future<bool> Function(
            String,
            int,
            String,
            String?,
          )? f) =>
      super.noSuchMethod(
        Invocation.setter(
          #authenticateProxy,
          f,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set badCertificateCallback(
          bool Function(
            _i2.X509Certificate,
            String,
            int,
          )? callback) =>
      super.noSuchMethod(
        Invocation.setter(
          #badCertificateCallback,
          callback,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set keyLog(dynamic Function(String)? callback) => super.noSuchMethod(
        Invocation.setter(
          #keyLog,
          callback,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<_i2.HttpClientRequest> open(
    String? method,
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #open,
          [
            method,
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #open,
            [
              method,
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> openUrl(
    String? method,
    Uri? url,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #openUrl,
          [
            method,
            url,
          ],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #openUrl,
            [
              method,
              url,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> get(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #get,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> getUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #getUrl,
          [url],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #getUrl,
            [url],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> post(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #post,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> postUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #postUrl,
          [url],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #postUrl,
            [url],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> put(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #put,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> putUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #putUrl,
          [url],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #putUrl,
            [url],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> delete(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #delete,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> deleteUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #deleteUrl,
          [url],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #deleteUrl,
            [url],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> patch(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #patch,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> patchUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #patchUrl,
          [url],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #patchUrl,
            [url],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> head(
    String? host,
    int? port,
    String? path,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [
            host,
            port,
            path,
          ],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #head,
            [
              host,
              port,
              path,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  _i4.Future<_i2.HttpClientRequest> headUrl(Uri? url) => (super.noSuchMethod(
        Invocation.method(
          #headUrl,
          [url],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientRequest>.value(_FakeHttpClientRequest_1(
          this,
          Invocation.method(
            #headUrl,
            [url],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientRequest>);
  @override
  void addCredentials(
    Uri? url,
    String? realm,
    _i2.HttpClientCredentials? credentials,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #addCredentials,
          [
            url,
            realm,
            credentials,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addProxyCredentials(
    String? host,
    int? port,
    String? realm,
    _i2.HttpClientCredentials? credentials,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #addProxyCredentials,
          [
            host,
            port,
            realm,
            credentials,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void close({bool? force = false}) => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
          {#force: force},
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [HttpClientRequest].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClientRequest extends _i1.Mock implements _i2.HttpClientRequest {
  MockHttpClientRequest() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get persistentConnection => (super.noSuchMethod(
        Invocation.getter(#persistentConnection),
        returnValue: false,
      ) as bool);
  @override
  set persistentConnection(bool? _persistentConnection) => super.noSuchMethod(
        Invocation.setter(
          #persistentConnection,
          _persistentConnection,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get followRedirects => (super.noSuchMethod(
        Invocation.getter(#followRedirects),
        returnValue: false,
      ) as bool);
  @override
  set followRedirects(bool? _followRedirects) => super.noSuchMethod(
        Invocation.setter(
          #followRedirects,
          _followRedirects,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get maxRedirects => (super.noSuchMethod(
        Invocation.getter(#maxRedirects),
        returnValue: 0,
      ) as int);
  @override
  set maxRedirects(int? _maxRedirects) => super.noSuchMethod(
        Invocation.setter(
          #maxRedirects,
          _maxRedirects,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get contentLength => (super.noSuchMethod(
        Invocation.getter(#contentLength),
        returnValue: 0,
      ) as int);
  @override
  set contentLength(int? _contentLength) => super.noSuchMethod(
        Invocation.setter(
          #contentLength,
          _contentLength,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get bufferOutput => (super.noSuchMethod(
        Invocation.getter(#bufferOutput),
        returnValue: false,
      ) as bool);
  @override
  set bufferOutput(bool? _bufferOutput) => super.noSuchMethod(
        Invocation.setter(
          #bufferOutput,
          _bufferOutput,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get method => (super.noSuchMethod(
        Invocation.getter(#method),
        returnValue: '',
      ) as String);
  @override
  Uri get uri => (super.noSuchMethod(
        Invocation.getter(#uri),
        returnValue: _FakeUri_2(
          this,
          Invocation.getter(#uri),
        ),
      ) as Uri);
  @override
  _i2.HttpHeaders get headers => (super.noSuchMethod(
        Invocation.getter(#headers),
        returnValue: _FakeHttpHeaders_3(
          this,
          Invocation.getter(#headers),
        ),
      ) as _i2.HttpHeaders);
  @override
  List<_i2.Cookie> get cookies => (super.noSuchMethod(
        Invocation.getter(#cookies),
        returnValue: <_i2.Cookie>[],
      ) as List<_i2.Cookie>);
  @override
  _i4.Future<_i2.HttpClientResponse> get done => (super.noSuchMethod(
        Invocation.getter(#done),
        returnValue:
            _i4.Future<_i2.HttpClientResponse>.value(_FakeHttpClientResponse_4(
          this,
          Invocation.getter(#done),
        )),
      ) as _i4.Future<_i2.HttpClientResponse>);
  @override
  _i3.Encoding get encoding => (super.noSuchMethod(
        Invocation.getter(#encoding),
        returnValue: _FakeEncoding_5(
          this,
          Invocation.getter(#encoding),
        ),
      ) as _i3.Encoding);
  @override
  set encoding(_i3.Encoding? _encoding) => super.noSuchMethod(
        Invocation.setter(
          #encoding,
          _encoding,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<_i2.HttpClientResponse> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientResponse>.value(_FakeHttpClientResponse_4(
          this,
          Invocation.method(
            #close,
            [],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientResponse>);
  @override
  void abort([
    Object? exception,
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #abort,
          [
            exception,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void add(List<int>? data) => super.noSuchMethod(
        Invocation.method(
          #add,
          [data],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void write(Object? object) => super.noSuchMethod(
        Invocation.method(
          #write,
          [object],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void writeAll(
    Iterable<dynamic>? objects, [
    String? separator = r'',
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #writeAll,
          [
            objects,
            separator,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void writeln([Object? object = r'']) => super.noSuchMethod(
        Invocation.method(
          #writeln,
          [object],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void writeCharCode(int? charCode) => super.noSuchMethod(
        Invocation.method(
          #writeCharCode,
          [charCode],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<dynamic> addStream(_i4.Stream<List<int>>? stream) =>
      (super.noSuchMethod(
        Invocation.method(
          #addStream,
          [stream],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> flush() => (super.noSuchMethod(
        Invocation.method(
          #flush,
          [],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
}

/// A class which mocks [HttpClientResponse].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClientResponse extends _i1.Mock
    implements _i2.HttpClientResponse {
  MockHttpClientResponse() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get statusCode => (super.noSuchMethod(
        Invocation.getter(#statusCode),
        returnValue: 0,
      ) as int);
  @override
  String get reasonPhrase => (super.noSuchMethod(
        Invocation.getter(#reasonPhrase),
        returnValue: '',
      ) as String);
  @override
  int get contentLength => (super.noSuchMethod(
        Invocation.getter(#contentLength),
        returnValue: 0,
      ) as int);
  @override
  _i2.HttpClientResponseCompressionState get compressionState =>
      (super.noSuchMethod(
        Invocation.getter(#compressionState),
        returnValue: _i2.HttpClientResponseCompressionState.notCompressed,
      ) as _i2.HttpClientResponseCompressionState);
  @override
  bool get persistentConnection => (super.noSuchMethod(
        Invocation.getter(#persistentConnection),
        returnValue: false,
      ) as bool);
  @override
  bool get isRedirect => (super.noSuchMethod(
        Invocation.getter(#isRedirect),
        returnValue: false,
      ) as bool);
  @override
  List<_i2.RedirectInfo> get redirects => (super.noSuchMethod(
        Invocation.getter(#redirects),
        returnValue: <_i2.RedirectInfo>[],
      ) as List<_i2.RedirectInfo>);
  @override
  _i2.HttpHeaders get headers => (super.noSuchMethod(
        Invocation.getter(#headers),
        returnValue: _FakeHttpHeaders_3(
          this,
          Invocation.getter(#headers),
        ),
      ) as _i2.HttpHeaders);
  @override
  List<_i2.Cookie> get cookies => (super.noSuchMethod(
        Invocation.getter(#cookies),
        returnValue: <_i2.Cookie>[],
      ) as List<_i2.Cookie>);
  @override
  bool get isBroadcast => (super.noSuchMethod(
        Invocation.getter(#isBroadcast),
        returnValue: false,
      ) as bool);
  @override
  _i4.Future<int> get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);
  @override
  _i4.Future<bool> get isEmpty => (super.noSuchMethod(
        Invocation.getter(#isEmpty),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<List<int>> get first => (super.noSuchMethod(
        Invocation.getter(#first),
        returnValue: _i4.Future<List<int>>.value(<int>[]),
      ) as _i4.Future<List<int>>);
  @override
  _i4.Future<List<int>> get last => (super.noSuchMethod(
        Invocation.getter(#last),
        returnValue: _i4.Future<List<int>>.value(<int>[]),
      ) as _i4.Future<List<int>>);
  @override
  _i4.Future<List<int>> get single => (super.noSuchMethod(
        Invocation.getter(#single),
        returnValue: _i4.Future<List<int>>.value(<int>[]),
      ) as _i4.Future<List<int>>);
  @override
  _i4.Future<_i2.HttpClientResponse> redirect([
    String? method,
    Uri? url,
    bool? followLoops,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #redirect,
          [
            method,
            url,
            followLoops,
          ],
        ),
        returnValue:
            _i4.Future<_i2.HttpClientResponse>.value(_FakeHttpClientResponse_4(
          this,
          Invocation.method(
            #redirect,
            [
              method,
              url,
              followLoops,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpClientResponse>);
  @override
  _i4.Future<_i2.Socket> detachSocket() => (super.noSuchMethod(
        Invocation.method(
          #detachSocket,
          [],
        ),
        returnValue: _i4.Future<_i2.Socket>.value(_FakeSocket_6(
          this,
          Invocation.method(
            #detachSocket,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Socket>);
  @override
  _i4.Stream<List<int>> asBroadcastStream({
    void Function(_i4.StreamSubscription<List<int>>)? onListen,
    void Function(_i4.StreamSubscription<List<int>>)? onCancel,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #asBroadcastStream,
          [],
          {
            #onListen: onListen,
            #onCancel: onCancel,
          },
        ),
        returnValue: _i4.Stream<List<int>>.empty(),
      ) as _i4.Stream<List<int>>);
  @override
  _i4.StreamSubscription<List<int>> listen(
    void Function(List<int>)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #listen,
          [onData],
          {
            #onError: onError,
            #onDone: onDone,
            #cancelOnError: cancelOnError,
          },
        ),
        returnValue: _FakeStreamSubscription_7<List<int>>(
          this,
          Invocation.method(
            #listen,
            [onData],
            {
              #onError: onError,
              #onDone: onDone,
              #cancelOnError: cancelOnError,
            },
          ),
        ),
      ) as _i4.StreamSubscription<List<int>>);
  @override
  _i4.Stream<List<int>> where(bool Function(List<int>)? test) =>
      (super.noSuchMethod(
        Invocation.method(
          #where,
          [test],
        ),
        returnValue: _i4.Stream<List<int>>.empty(),
      ) as _i4.Stream<List<int>>);
  @override
  _i4.Stream<S> map<S>(S Function(List<int>)? convert) => (super.noSuchMethod(
        Invocation.method(
          #map,
          [convert],
        ),
        returnValue: _i4.Stream<S>.empty(),
      ) as _i4.Stream<S>);
  @override
  _i4.Stream<E> asyncMap<E>(_i4.FutureOr<E> Function(List<int>)? convert) =>
      (super.noSuchMethod(
        Invocation.method(
          #asyncMap,
          [convert],
        ),
        returnValue: _i4.Stream<E>.empty(),
      ) as _i4.Stream<E>);
  @override
  _i4.Stream<E> asyncExpand<E>(_i4.Stream<E>? Function(List<int>)? convert) =>
      (super.noSuchMethod(
        Invocation.method(
          #asyncExpand,
          [convert],
        ),
        returnValue: _i4.Stream<E>.empty(),
      ) as _i4.Stream<E>);
  @override
  _i4.Stream<List<int>> handleError(
    Function? onError, {
    bool Function(dynamic)? test,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #handleError,
          [onError],
          {#test: test},
        ),
        returnValue: _i4.Stream<List<int>>.empty(),
      ) as _i4.Stream<List<int>>);
  @override
  _i4.Stream<S> expand<S>(Iterable<S> Function(List<int>)? convert) =>
      (super.noSuchMethod(
        Invocation.method(
          #expand,
          [convert],
        ),
        returnValue: _i4.Stream<S>.empty(),
      ) as _i4.Stream<S>);
  @override
  _i4.Future<dynamic> pipe(_i4.StreamConsumer<List<int>>? streamConsumer) =>
      (super.noSuchMethod(
        Invocation.method(
          #pipe,
          [streamConsumer],
        ),
        returnValue: _i4.Future<dynamic>.value(),
      ) as _i4.Future<dynamic>);
  @override
  _i4.Stream<S> transform<S>(
          _i4.StreamTransformer<List<int>, S>? streamTransformer) =>
      (super.noSuchMethod(
        Invocation.method(
          #transform,
          [streamTransformer],
        ),
        returnValue: _i4.Stream<S>.empty(),
      ) as _i4.Stream<S>);
  @override
  _i4.Future<List<int>> reduce(
          List<int> Function(
            List<int>,
            List<int>,
          )? combine) =>
      (super.noSuchMethod(
        Invocation.method(
          #reduce,
          [combine],
        ),
        returnValue: _i4.Future<List<int>>.value(<int>[]),
      ) as _i4.Future<List<int>>);
  @override
  _i4.Future<S> fold<S>(
    S? initialValue,
    S Function(
      S,
      List<int>,
    )? combine,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fold,
          [
            initialValue,
            combine,
          ],
        ),
        returnValue: _i5.ifNotNull(
              _i5.dummyValueOrNull<S>(
                this,
                Invocation.method(
                  #fold,
                  [
                    initialValue,
                    combine,
                  ],
                ),
              ),
              (S v) => _i4.Future<S>.value(v),
            ) ??
            _FakeFuture_8<S>(
              this,
              Invocation.method(
                #fold,
                [
                  initialValue,
                  combine,
                ],
              ),
            ),
      ) as _i4.Future<S>);
  @override
  _i4.Future<String> join([String? separator = r'']) => (super.noSuchMethod(
        Invocation.method(
          #join,
          [separator],
        ),
        returnValue: _i4.Future<String>.value(''),
      ) as _i4.Future<String>);
  @override
  _i4.Future<bool> contains(Object? needle) => (super.noSuchMethod(
        Invocation.method(
          #contains,
          [needle],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<void> forEach(void Function(List<int>)? action) =>
      (super.noSuchMethod(
        Invocation.method(
          #forEach,
          [action],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<bool> every(bool Function(List<int>)? test) => (super.noSuchMethod(
        Invocation.method(
          #every,
          [test],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<bool> any(bool Function(List<int>)? test) => (super.noSuchMethod(
        Invocation.method(
          #any,
          [test],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Stream<R> cast<R>() => (super.noSuchMethod(
        Invocation.method(
          #cast,
          [],
        ),
        returnValue: _i4.Stream<R>.empty(),
      ) as _i4.Stream<R>);
  @override
  _i4.Future<List<List<int>>> toList() => (super.noSuchMethod(
        Invocation.method(
          #toList,
          [],
        ),
        returnValue: _i4.Future<List<List<int>>>.value(<List<int>>[]),
      ) as _i4.Future<List<List<int>>>);
  @override
  _i4.Future<Set<List<int>>> toSet() => (super.noSuchMethod(
        Invocation.method(
          #toSet,
          [],
        ),
        returnValue: _i4.Future<Set<List<int>>>.value(<List<int>>{}),
      ) as _i4.Future<Set<List<int>>>);
  @override
  _i4.Future<E> drain<E>([E? futureValue]) => (super.noSuchMethod(
        Invocation.method(
          #drain,
          [futureValue],
        ),
        returnValue: _i5.ifNotNull(
              _i5.dummyValueOrNull<E>(
                this,
                Invocation.method(
                  #drain,
                  [futureValue],
                ),
              ),
              (E v) => _i4.Future<E>.value(v),
            ) ??
            _FakeFuture_8<E>(
              this,
              Invocation.method(
                #drain,
                [futureValue],
              ),
            ),
      ) as _i4.Future<E>);
  @override
  _i4.Stream<List<int>> take(int? count) => (super.noSuchMethod(
        Invocation.method(
          #take,
          [count],
        ),
        returnValue: _i4.Stream<List<int>>.empty(),
      ) as _i4.Stream<List<int>>);
  @override
  _i4.Stream<List<int>> takeWhile(bool Function(List<int>)? test) =>
      (super.noSuchMethod(
        Invocation.method(
          #takeWhile,
          [test],
        ),
        returnValue: _i4.Stream<List<int>>.empty(),
      ) as _i4.Stream<List<int>>);
  @override
  _i4.Stream<List<int>> skip(int? count) => (super.noSuchMethod(
        Invocation.method(
          #skip,
          [count],
        ),
        returnValue: _i4.Stream<List<int>>.empty(),
      ) as _i4.Stream<List<int>>);
  @override
  _i4.Stream<List<int>> skipWhile(bool Function(List<int>)? test) =>
      (super.noSuchMethod(
        Invocation.method(
          #skipWhile,
          [test],
        ),
        returnValue: _i4.Stream<List<int>>.empty(),
      ) as _i4.Stream<List<int>>);
  @override
  _i4.Stream<List<int>> distinct(
          [bool Function(
            List<int>,
            List<int>,
          )? equals]) =>
      (super.noSuchMethod(
        Invocation.method(
          #distinct,
          [equals],
        ),
        returnValue: _i4.Stream<List<int>>.empty(),
      ) as _i4.Stream<List<int>>);
  @override
  _i4.Future<List<int>> firstWhere(
    bool Function(List<int>)? test, {
    List<int> Function()? orElse,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #firstWhere,
          [test],
          {#orElse: orElse},
        ),
        returnValue: _i4.Future<List<int>>.value(<int>[]),
      ) as _i4.Future<List<int>>);
  @override
  _i4.Future<List<int>> lastWhere(
    bool Function(List<int>)? test, {
    List<int> Function()? orElse,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #lastWhere,
          [test],
          {#orElse: orElse},
        ),
        returnValue: _i4.Future<List<int>>.value(<int>[]),
      ) as _i4.Future<List<int>>);
  @override
  _i4.Future<List<int>> singleWhere(
    bool Function(List<int>)? test, {
    List<int> Function()? orElse,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #singleWhere,
          [test],
          {#orElse: orElse},
        ),
        returnValue: _i4.Future<List<int>>.value(<int>[]),
      ) as _i4.Future<List<int>>);
  @override
  _i4.Future<List<int>> elementAt(int? index) => (super.noSuchMethod(
        Invocation.method(
          #elementAt,
          [index],
        ),
        returnValue: _i4.Future<List<int>>.value(<int>[]),
      ) as _i4.Future<List<int>>);
  @override
  _i4.Stream<List<int>> timeout(
    Duration? timeLimit, {
    void Function(_i4.EventSink<List<int>>)? onTimeout,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #timeout,
          [timeLimit],
          {#onTimeout: onTimeout},
        ),
        returnValue: _i4.Stream<List<int>>.empty(),
      ) as _i4.Stream<List<int>>);
}
