import 'src/internal_helpers.dart';
import 'types.dart';
import 'src/js/proxy.dart' as $js;
export 'chrome.dart';

final _proxy = ChromeProxy._();

extension ChromeProxyExtension on Chrome {
  ChromeProxy get proxy => _proxy;
}

class ChromeProxy {
  ChromeProxy._();

  /// Proxy settings to be used. The value of this setting is a ProxyConfig
  /// object.
  ChromeSetting get settings => $js.chrome.proxy.settings as dynamic;

  /// Notifies about proxy errors.
  Stream<OnProxyErrorDetails> get onProxyError => throw UnimplementedError();
}

enum Scheme {
  http('http'),
  https('https'),
  quic('quic'),
  socks4('socks4'),
  socks5('socks5');

  const Scheme(this.value);

  final String value;

  String get toJS => value;
  static Scheme fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum Mode {
  direct('direct'),
  autoDetect('auto_detect'),
  pacScript('pac_script'),
  fixedServers('fixed_servers'),
  system('system');

  const Mode(this.value);

  final String value;

  String get toJS => value;
  static Mode fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class ProxyServer {
  ProxyServer.fromJS(this._wrapped);

  final $js.ProxyServer _wrapped;

  $js.ProxyServer get toJS => _wrapped;

  /// The scheme (protocol) of the proxy server itself. Defaults to 'http'.
  Scheme? get scheme => _wrapped.scheme?.let(Scheme.fromJS);
  set scheme(Scheme? v) {
    throw UnimplementedError();
  }

  /// The hostname or IP address of the proxy server. Hostnames must be in ASCII
  /// (in Punycode format). IDNA is not supported, yet.
  String get host => _wrapped.host;
  set host(String v) {
    throw UnimplementedError();
  }

  /// The port of the proxy server. Defaults to a port that depends on the
  /// scheme.
  int? get port => _wrapped.port;
  set port(int? v) {
    throw UnimplementedError();
  }
}

class ProxyRules {
  ProxyRules.fromJS(this._wrapped);

  final $js.ProxyRules _wrapped;

  $js.ProxyRules get toJS => _wrapped;

  /// The proxy server to be used for all per-URL requests (that is http, https,
  /// and ftp).
  ProxyServer? get singleProxy => _wrapped.singleProxy?.let(ProxyServer.fromJS);
  set singleProxy(ProxyServer? v) {
    throw UnimplementedError();
  }

  /// The proxy server to be used for HTTP requests.
  ProxyServer? get proxyForHttp =>
      _wrapped.proxyForHttp?.let(ProxyServer.fromJS);
  set proxyForHttp(ProxyServer? v) {
    throw UnimplementedError();
  }

  /// The proxy server to be used for HTTPS requests.
  ProxyServer? get proxyForHttps =>
      _wrapped.proxyForHttps?.let(ProxyServer.fromJS);
  set proxyForHttps(ProxyServer? v) {
    throw UnimplementedError();
  }

  /// The proxy server to be used for FTP requests.
  ProxyServer? get proxyForFtp => _wrapped.proxyForFtp?.let(ProxyServer.fromJS);
  set proxyForFtp(ProxyServer? v) {
    throw UnimplementedError();
  }

  /// The proxy server to be used for everthing else or if any of the specific
  /// proxyFor... is not specified.
  ProxyServer? get fallbackProxy =>
      _wrapped.fallbackProxy?.let(ProxyServer.fromJS);
  set fallbackProxy(ProxyServer? v) {
    throw UnimplementedError();
  }

  /// List of servers to connect to without a proxy server.
  List<String>? get bypassList => throw UnimplementedError();
  set bypassList(List<String>? v) {
    throw UnimplementedError();
  }
}

class PacScript {
  PacScript.fromJS(this._wrapped);

  final $js.PacScript _wrapped;

  $js.PacScript get toJS => _wrapped;

  /// URL of the PAC file to be used.
  String? get url => _wrapped.url;
  set url(String? v) {
    throw UnimplementedError();
  }

  /// A PAC script.
  String? get data => _wrapped.data;
  set data(String? v) {
    throw UnimplementedError();
  }

  /// If true, an invalid PAC script will prevent the network stack from falling
  /// back to direct connections. Defaults to false.
  bool? get mandatory => _wrapped.mandatory;
  set mandatory(bool? v) {
    throw UnimplementedError();
  }
}

class ProxyConfig {
  ProxyConfig.fromJS(this._wrapped);

  final $js.ProxyConfig _wrapped;

  $js.ProxyConfig get toJS => _wrapped;

  /// The proxy rules describing this configuration. Use this for
  /// 'fixed_servers' mode.
  ProxyRules? get rules => _wrapped.rules?.let(ProxyRules.fromJS);
  set rules(ProxyRules? v) {
    throw UnimplementedError();
  }

  /// The proxy auto-config (PAC) script for this configuration. Use this for
  /// 'pac_script' mode.
  PacScript? get pacScript => _wrapped.pacScript?.let(PacScript.fromJS);
  set pacScript(PacScript? v) {
    throw UnimplementedError();
  }

  /// 'direct' = Never use a proxy
  /// 'auto_detect' = Auto detect proxy settings
  /// 'pac_script' = Use specified PAC script
  /// 'fixed_servers' = Manually specify proxy servers
  /// 'system' = Use system proxy settings
  Mode get mode => Mode.fromJS(_wrapped.mode);
  set mode(Mode v) {
    throw UnimplementedError();
  }
}

class OnProxyErrorDetails {
  OnProxyErrorDetails.fromJS(this._wrapped);

  final $js.OnProxyErrorDetails _wrapped;

  $js.OnProxyErrorDetails get toJS => _wrapped;

  /// If true, the error was fatal and the network transaction was aborted.
  /// Otherwise, a direct connection is used instead.
  bool get fatal => _wrapped.fatal;
  set fatal(bool v) {
    throw UnimplementedError();
  }

  /// The error description.
  String get error => _wrapped.error;
  set error(String v) {
    throw UnimplementedError();
  }

  /// Additional details about the error such as a JavaScript runtime error.
  String get details => _wrapped.details;
  set details(String v) {
    throw UnimplementedError();
  }
}
