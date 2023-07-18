import 'dart:js_interop';

import 'chrome.dart';
import 'types.dart';

export 'chrome.dart';

extension JSChromeJSProxyExtension on JSChrome {
  /// Use the `chrome.proxy` API to manage Chrome's proxy settings. This API
  /// relies on the [ChromeSetting prototype of the type
  /// API](types#ChromeSetting) for getting and setting the proxy configuration.
  external JSProxy get proxy;
}

@JS()
@staticInterop
class JSProxy {}

extension JSProxyExtension on JSProxy {
  /// Notifies about proxy errors.
  external Event get onProxyError;

  /// Proxy settings to be used. The value of this setting is a ProxyConfig
  /// object.
  external ChromeSetting get settings;
}

typedef Scheme = String;

typedef Mode = String;

@JS()
@staticInterop
class ProxyServer {}

extension ProxyServerExtension on ProxyServer {
  /// The scheme (protocol) of the proxy server itself. Defaults to 'http'.
  external Scheme? scheme;

  /// The hostname or IP address of the proxy server. Hostnames must be in ASCII
  /// (in Punycode format). IDNA is not supported, yet.
  external String host;

  /// The port of the proxy server. Defaults to a port that depends on the
  /// scheme.
  external int? port;
}

@JS()
@staticInterop
class ProxyRules {}

extension ProxyRulesExtension on ProxyRules {
  /// The proxy server to be used for all per-URL requests (that is http, https,
  /// and ftp).
  external ProxyServer? singleProxy;

  /// The proxy server to be used for HTTP requests.
  external ProxyServer? proxyForHttp;

  /// The proxy server to be used for HTTPS requests.
  external ProxyServer? proxyForHttps;

  /// The proxy server to be used for FTP requests.
  external ProxyServer? proxyForFtp;

  /// The proxy server to be used for everthing else or if any of the specific
  /// proxyFor... is not specified.
  external ProxyServer? fallbackProxy;

  /// List of servers to connect to without a proxy server.
  external JSArray? bypassList;
}

@JS()
@staticInterop
class PacScript {}

extension PacScriptExtension on PacScript {
  /// URL of the PAC file to be used.
  external String? url;

  /// A PAC script.
  external String? data;

  /// If true, an invalid PAC script will prevent the network stack from falling
  /// back to direct connections. Defaults to false.
  external bool? mandatory;
}

@JS()
@staticInterop
class ProxyConfig {}

extension ProxyConfigExtension on ProxyConfig {
  /// The proxy rules describing this configuration. Use this for
  /// 'fixed_servers' mode.
  external ProxyRules? rules;

  /// The proxy auto-config (PAC) script for this configuration. Use this for
  /// 'pac_script' mode.
  external PacScript? pacScript;

  /// 'direct' = Never use a proxy
  /// 'auto_detect' = Auto detect proxy settings
  /// 'pac_script' = Use specified PAC script
  /// 'fixed_servers' = Manually specify proxy servers
  /// 'system' = Use system proxy settings
  external Mode mode;
}

@JS()
@staticInterop
class OnProxyErrorDetails {}

extension OnProxyErrorDetailsExtension on OnProxyErrorDetails {
  /// If true, the error was fatal and the network transaction was aborted.
  /// Otherwise, a direct connection is used instead.
  external bool fatal;

  /// The error description.
  external String error;

  /// Additional details about the error such as a JavaScript runtime error.
  external String details;
}