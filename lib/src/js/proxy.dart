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
class ProxyServer {}

extension ProxyServerExtension on ProxyServer {
  /// The scheme (protocol) of the proxy server itself. Defaults to 'http'.
  external Scheme? get scheme;

  /// The hostname or IP address of the proxy server. Hostnames must be in ASCII
  /// (in Punycode format). IDNA is not supported, yet.
  external JSString get host;

  /// The port of the proxy server. Defaults to a port that depends on the
  /// scheme.
  external JSNumber? get port;
}

@JS()
@staticInterop
class ProxyRules {}

extension ProxyRulesExtension on ProxyRules {
  /// The proxy server to be used for all per-URL requests (that is http, https,
  /// and ftp).
  external ProxyServer? get singleProxy;

  /// The proxy server to be used for HTTP requests.
  external ProxyServer? get proxyForHttp;

  /// The proxy server to be used for HTTPS requests.
  external ProxyServer? get proxyForHttps;

  /// The proxy server to be used for FTP requests.
  external ProxyServer? get proxyForFtp;

  /// The proxy server to be used for everthing else or if any of the specific
  /// proxyFor... is not specified.
  external ProxyServer? get fallbackProxy;

  /// List of servers to connect to without a proxy server.
  external JSArray? get bypassList;
}

@JS()
@staticInterop
class PacScript {}

extension PacScriptExtension on PacScript {
  /// URL of the PAC file to be used.
  external JSString? get url;

  /// A PAC script.
  external JSString? get data;

  /// If true, an invalid PAC script will prevent the network stack from falling
  /// back to direct connections. Defaults to false.
  external JSBoolean? get mandatory;
}

@JS()
@staticInterop
class ProxyConfig {}

extension ProxyConfigExtension on ProxyConfig {
  /// The proxy rules describing this configuration. Use this for
  /// 'fixed_servers' mode.
  external ProxyRules? get rules;

  /// The proxy auto-config (PAC) script for this configuration. Use this for
  /// 'pac_script' mode.
  external PacScript? get pacScript;

  /// 'direct' = Never use a proxy
  /// 'auto_detect' = Auto detect proxy settings
  /// 'pac_script' = Use specified PAC script
  /// 'fixed_servers' = Manually specify proxy servers
  /// 'system' = Use system proxy settings
  external Mode get mode;
}
