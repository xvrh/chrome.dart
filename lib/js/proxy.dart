import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSProxyExtension on JSChrome {
  /// Use the `chrome.proxy` API to manage Chrome's proxy settings. This API
  /// relies on the <a href='types#ChromeSetting'>ChromeSetting prototype of the
  /// type API</a> for getting and setting the proxy configuration.
  external JSProxy get proxy;
}

@JS()
@staticInterop
class JSProxy {}

extension JSProxyExtension on JSProxy {
  /// Notifies about proxy errors.
  external ChromeEvent get onProxyError;
}

typedef Scheme = JSString;

typedef Mode = JSString;

@JS()
@staticInterop
class ProxyServer {
  /// The scheme (protocol) of the proxy server itself. Defaults to 'http'.
  external JSAny? get scheme;

  /// The hostname or IP address of the proxy server. Hostnames must be in ASCII
  /// (in Punycode format). IDNA is not supported, yet.
  external JSAny get host;

  /// The port of the proxy server. Defaults to a port that depends on the
  /// scheme.
  external JSAny? get port;
}

@JS()
@staticInterop
class ProxyRules {
  /// The proxy server to be used for all per-URL requests (that is http, https,
  /// and ftp).
  external JSAny? get singleProxy;

  /// The proxy server to be used for HTTP requests.
  external JSAny? get proxyForHttp;

  /// The proxy server to be used for HTTPS requests.
  external JSAny? get proxyForHttps;

  /// The proxy server to be used for FTP requests.
  external JSAny? get proxyForFtp;

  /// The proxy server to be used for everthing else or if any of the specific
  /// proxyFor... is not specified.
  external JSAny? get fallbackProxy;

  /// List of servers to connect to without a proxy server.
  external JSArray? get bypassList;
}

@JS()
@staticInterop
class PacScript {
  /// URL of the PAC file to be used.
  external JSAny? get url;

  /// A PAC script.
  external JSAny? get data;

  /// If true, an invalid PAC script will prevent the network stack from falling
  /// back to direct connections. Defaults to false.
  external JSAny? get mandatory;
}

@JS()
@staticInterop
class ProxyConfig {
  /// The proxy rules describing this configuration. Use this for
  /// 'fixed_servers' mode.
  external JSAny? get rules;

  /// The proxy auto-config (PAC) script for this configuration. Use this for
  /// 'pac_script' mode.
  external JSAny? get pacScript;

  /// 'direct' = Never use a proxy<br>'auto_detect' = Auto detect proxy
  /// settings<br>'pac_script' = Use specified PAC script<br>'fixed_servers' =
  /// Manually specify proxy servers<br>'system' = Use system proxy settings
  external JSAny get mode;
}
