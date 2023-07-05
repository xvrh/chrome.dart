/* This file has been generated from runtime.json - do not edit */

/**
 * Use the `chrome.runtime` API to retrieve the background page, return details
 * about the manifest, and listen for and respond to events in the app or
 * extension lifecycle. You can also use this API to convert the relative path
 * of URLs to fully-qualified URLs.
 */
library chrome.runtime;

import '../src/files.dart';
import 'tabs.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.runtime` namespace.
 */
final ChromeRuntime runtime = ChromeRuntime._();

class ChromeRuntime extends ChromeApi {
  JsObject get _runtime => chrome['runtime'];

  /**
   * Fired when a profile that has this extension installed first starts up.
   * This event is not fired when an incognito profile is started, even if this
   * extension is operating in 'split' incognito mode.
   */
  Stream get onStartup => _onStartup.stream;
  late ChromeStreamController _onStartup;

  /**
   * Fired when the extension is first installed, when the extension is updated
   * to a new version, and when Chrome is updated to a new version.
   */
  Stream<Map> get onInstalled => _onInstalled.stream;
  late ChromeStreamController<Map> _onInstalled;

  /**
   * Sent to the event page just before it is unloaded. This gives the extension
   * opportunity to do some clean up. Note that since the page is unloading, any
   * asynchronous operations started while handling this event are not
   * guaranteed to complete. If more activity for the event page occurs before
   * it gets unloaded the onSuspendCanceled event will be sent and the page
   * won't be unloaded.
   */
  Stream get onSuspend => _onSuspend.stream;
  late ChromeStreamController _onSuspend;

  /**
   * Sent after onSuspend to indicate that the app won't be unloaded after all.
   */
  Stream get onSuspendCanceled => _onSuspendCanceled.stream;
  late ChromeStreamController _onSuspendCanceled;

  /**
   * Fired when an update is available, but isn't installed immediately because
   * the app is currently running. If you do nothing, the update will be
   * installed the next time the background page gets unloaded, if you want it
   * to be installed sooner you can explicitly call chrome.runtime.reload(). If
   * your extension is using a persistent background page, the background page
   * of course never gets unloaded, so unless you call chrome.runtime.reload()
   * manually in response to this event the update will not get installed until
   * the next time Chrome itself restarts. If no handlers are listening for this
   * event, and your extension has a persistent background page, it behaves as
   * if chrome.runtime.reload() is called in response to this event.
   */
  Stream<Map<String, Object>> get onUpdateAvailable => _onUpdateAvailable.stream;
  late ChromeStreamController<Map<String, Object>> _onUpdateAvailable;

  /**
   * Fired when a Chrome update is available, but isn't installed immediately
   * because a browser restart is required.
   */
  Stream get onBrowserUpdateAvailable => _onBrowserUpdateAvailable.stream;
  late ChromeStreamController _onBrowserUpdateAvailable;

  /**
   * Fired when a connection is made from either an extension process or a
   * content script (by [runtime.connect]).
   */
  Stream<Port> get onConnect => _onConnect.stream;
  late ChromeStreamController<Port> _onConnect;

  /**
   * Fired when a connection is made from another extension (by
   * [runtime.connect]).
   */
  Stream<Port> get onConnectExternal => _onConnectExternal.stream;
  late ChromeStreamController<Port> _onConnectExternal;

  /**
   * Fired when a connection is made from a native application. Currently only
   * supported on Chrome OS.
   */
  Stream<Port> get onConnectNative => _onConnectNative.stream;
  late ChromeStreamController<Port> _onConnectNative;

  /**
   * Fired when a message is sent from either an extension process (by
   * [runtime.sendMessage]) or a content script (by [tabs.sendMessage]).
   */
  Stream<OnMessageEvent> get onMessage => _onMessage.stream;
  late ChromeStreamController<OnMessageEvent> _onMessage;

  /**
   * Fired when a message is sent from another extension/app (by
   * [runtime.sendMessage]). Cannot be used in a content script.
   */
  Stream<OnMessageExternalEvent> get onMessageExternal => _onMessageExternal.stream;
  late ChromeStreamController<OnMessageExternalEvent> _onMessageExternal;

  /**
   * Fired when an app or the device that it runs on needs to be restarted. The
   * app should close all its windows at its earliest convenient time to let the
   * restart to happen. If the app does nothing, a restart will be enforced
   * after a 24-hour grace period has passed. Currently, this event is only
   * fired for Chrome OS kiosk apps.
   */
  Stream<OnRestartRequiredReason> get onRestartRequired => _onRestartRequired.stream;
  late ChromeStreamController<OnRestartRequiredReason> _onRestartRequired;

  ChromeRuntime._() {
    var getApi = () => _runtime;
    _onStartup = new ChromeStreamController.noArgs(getApi, 'onStartup');
    _onInstalled = ChromeStreamController<Map>.oneArg(getApi, 'onInstalled', mapify);
    _onSuspend = new ChromeStreamController.noArgs(getApi, 'onSuspend');
    _onSuspendCanceled = new ChromeStreamController.noArgs(getApi, 'onSuspendCanceled');
    _onUpdateAvailable = ChromeStreamController<Map<String, Object>>.oneArg(getApi, 'onUpdateAvailable', mapify);
    _onBrowserUpdateAvailable = new ChromeStreamController.noArgs(getApi, 'onBrowserUpdateAvailable');
    _onConnect = ChromeStreamController<Port>.oneArg(getApi, 'onConnect', _createPort);
    _onConnectExternal = ChromeStreamController<Port>.oneArg(getApi, 'onConnectExternal', _createPort);
    _onConnectNative = ChromeStreamController<Port>.oneArg(getApi, 'onConnectNative', _createPort);
    _onMessage = ChromeStreamController<OnMessageEvent>.threeArgs(getApi, 'onMessage', _createOnMessageEvent);
    _onMessageExternal = ChromeStreamController<OnMessageExternalEvent>.threeArgs(getApi, 'onMessageExternal', _createOnMessageExternalEvent);
    _onRestartRequired = ChromeStreamController<OnRestartRequiredReason>.oneArg(getApi, 'onRestartRequired', _createOnRestartRequiredReason);
  }

  bool get available => _runtime != null;

  /**
   * This will be defined during an API method callback if there was an error
   */
  LastErrorRuntime get lastError => _createLastErrorRuntime(_runtime['lastError']);

  /**
   * The ID of the extension/app.
   */
  String get id => _runtime['id'];

  /**
   * Retrieves the JavaScript 'window' object for the background page running
   * inside the current extension/app. If the background page is an event page,
   * the system will ensure it is loaded before calling the callback. If there
   * is no background page, an error is set.
   */
  void getBackgroundPage() {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('getBackgroundPage');
  }

  /**
   * Open your Extension's options page, if possible.
   * 
   * The precise behavior may depend on your manifest's
   * `[options_ui](optionsV2)` or `[options_page](options)` key, or what Chrome
   * happens to support at the time. For example, the page may be opened in a
   * new tab, within chrome://extensions, within an App, or it may just focus an
   * open options page. It will never cause the caller page to reload.
   * 
   * If your Extension does not declare an options page, or Chrome failed to
   * create one for some other reason, the callback will set [lastError].
   */
  void openOptionsPage() {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('openOptionsPage');
  }

  /**
   * Returns details about the app or extension from the manifest. The object
   * returned is a serialization of the full [manifest file](manifest.html).
   * 
   * Returns:
   * The manifest details.
   */
  Map<String, Object> getManifest() {
    if (_runtime == null) _throwNotAvailable();

    return mapify(_runtime.callMethod('getManifest'));
  }

  /**
   * Converts a relative path within an app/extension install directory to a
   * fully-qualified URL.
   * 
   * [path] A path to a resource within an app/extension expressed relative to
   * its install directory.
   * 
   * Returns:
   * The fully-qualified URL to the resource.
   */
  String getURL(String path) {
    if (_runtime == null) _throwNotAvailable();

    return _runtime.callMethod('getURL', [path]);
  }

  /**
   * Sets the URL to be visited upon uninstallation. This may be used to clean
   * up server-side data, do analytics, and implement surveys. Maximum 255
   * characters.
   * 
   * [url] URL to be opened after the extension is uninstalled. This URL must
   * have an http: or https: scheme. Set an empty string to not open a new tab
   * upon uninstallation.
   */
  void setUninstallURL(String url) {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('setUninstallURL', [url]);
  }

  /**
   * Reloads the app or extension. This method is not supported in kiosk mode.
   * For kiosk mode, use chrome.runtime.restart() method.
   */
  void reload() {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('reload');
  }

  /**
   * Requests an immediate update check be done for this app/extension.
   * <b>Important</b>: Most extensions/apps should <b>not</b> use this method,
   * since Chrome already does automatic checks every few hours, and you can
   * listen for the [runtime.onUpdateAvailable] event without needing to call
   * requestUpdateCheck.
   * 
   * This method is only appropriate to call in very limited circumstances, such
   * as if your extension/app talks to a backend service, and the backend
   * service has determined that the client extension/app version is very far
   * out of date and you'd like to prompt a user to update. Most other uses of
   * requestUpdateCheck, such as calling it unconditionally based on a repeating
   * timer, probably only serve to waste client, network, and server resources.
   * 
   * Note: When called with a callback, instead of returning an object this
   * function will return the two properties as separate arguments passed to the
   * callback.
   */
  void requestUpdateCheck() {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('requestUpdateCheck');
  }

  /**
   * Restart the ChromeOS device when the app runs in kiosk mode. Otherwise,
   * it's no-op.
   */
  void restart() {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('restart');
  }

  /**
   * Restart the ChromeOS device when the app runs in kiosk mode after the given
   * seconds. If called again before the time ends, the reboot will be delayed.
   * If called with a value of -1, the reboot will be cancelled. It's a no-op in
   * non-kiosk mode. It's only allowed to be called repeatedly by the first
   * extension to invoke this API.
   * 
   * [seconds] Time to wait in seconds before rebooting the device, or -1 to
   * cancel a scheduled reboot.
   */
  void restartAfterDelay(int seconds) {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('restartAfterDelay', [seconds]);
  }

  /**
   * Attempts to connect listeners within an extension/app (such as the
   * background page), or other extensions/apps. This is useful for content
   * scripts connecting to their extension processes, inter-app/extension
   * communication, and [web messaging](manifest/externally_connectable.html).
   * Note that this does not connect to any listeners in a content script.
   * Extensions may connect to content scripts embedded in tabs via
   * [tabs.connect].
   * 
   * [extensionId] The ID of the extension or app to connect to. If omitted, a
   * connection will be attempted with your own extension. Required if sending
   * messages from a web page for [web
   * messaging](manifest/externally_connectable.html).
   * 
   * Returns:
   * Port through which messages can be sent and received. The port's $(ref:Port
   * onDisconnect) event is fired if the extension/app does not exist.
   */
  Port connect([String? extensionId, RuntimeConnectParams? connectInfo]) {
    if (_runtime == null) _throwNotAvailable();

    return _createPort(_runtime.callMethod('connect', [extensionId, jsify(connectInfo)]));
  }

  /**
   * Connects to a native application in the host machine. See [Native
   * Messaging](nativeMessaging) for more information.
   * 
   * [application] The name of the registered application to connect to.
   * 
   * Returns:
   * Port through which messages can be sent and received with the application
   */
  Port connectNative(String application) {
    if (_runtime == null) _throwNotAvailable();

    return _createPort(_runtime.callMethod('connectNative', [application]));
  }

  /**
   * Sends a single message to event listeners within your extension/app or a
   * different extension/app. Similar to [runtime.connect] but only sends a
   * single message, with an optional response. If sending to your extension,
   * the [runtime.onMessage] event will be fired in every frame of your
   * extension (except for the sender's frame), or [runtime.onMessageExternal],
   * if a different extension. Note that extensions cannot send messages to
   * content scripts using this method. To send messages to content scripts, use
   * [tabs.sendMessage].
   * 
   * [extensionId] The ID of the extension/app to send the message to. If
   * omitted, the message will be sent to your own extension/app. Required if
   * sending messages from a web page for [web
   * messaging](manifest/externally_connectable.html).
   * 
   * [message] The message to send. This message should be a JSON-ifiable
   * object.
   */
  void sendMessage(Object message, [String? extensionId, RuntimeSendMessageParams? options]) {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('sendMessage', [extensionId, jsify(message), jsify(options)]);
  }

  /**
   * Send a single message to a native application.
   * 
   * [application] The name of the native messaging host.
   * 
   * [message] The message that will be passed to the native messaging host.
   */
  void sendNativeMessage(String application, Map<String, Object> message) {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('sendNativeMessage', [application, jsify(message)]);
  }

  /**
   * Returns information about the current platform.
   */
  void getPlatformInfo() {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('getPlatformInfo');
  }

  /**
   * Returns a DirectoryEntry for the package directory.
   */
  Future<DirectoryEntry> getPackageDirectoryEntry() {
    if (_runtime == null) _throwNotAvailable();

    var completer =  ChromeCompleter<DirectoryEntry>.oneArg(_createDirectoryEntry);
    _runtime.callMethod('getPackageDirectoryEntry', [completer.callback]);
    return completer.future;
  }

  /**
   * Fetches information about active contexts associated with this extension
   * 
   * [filter] A filter to find matching contexts. A context matches if it
   * matches all specified fields in the filter. Any unspecified field in the
   * filter matches all contexts.
   */
  void getContexts(ContextFilter filter) {
    if (_runtime == null) _throwNotAvailable();

    _runtime.callMethod('getContexts', [jsify(filter)]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.runtime' is not available");
  }
}

/**
 * Fired when a message is sent from either an extension process (by
 * [runtime.sendMessage]) or a content script (by [tabs.sendMessage]).
 */
class OnMessageEvent {
  /**
   * The message sent by the calling script.
   * `optional`
   * 
   * The message sent by the calling script.
   */
  final Object message;

  final MessageSender sender;

  /**
   * Function to call (at most once) when you have a response. The argument
   * should be any JSON-ifiable object. If you have more than one `onMessage`
   * listener in the same document, then only one may send a response. This
   * function becomes invalid when the event listener returns, *unless you
   * return true* from the event listener to indicate you wish to send a
   * response asynchronously (this will keep the message channel open to the
   * other end until `sendResponse` is called).
   */
  final Object sendResponse;

  OnMessageEvent(this.message, this.sender, this.sendResponse);
}

/**
 * Fired when a message is sent from another extension/app (by
 * [runtime.sendMessage]). Cannot be used in a content script.
 */
class OnMessageExternalEvent {
  /**
   * The message sent by the calling script.
   * `optional`
   * 
   * The message sent by the calling script.
   */
  final Object message;

  final MessageSender sender;

  /**
   * Function to call (at most once) when you have a response. The argument
   * should be any JSON-ifiable object. If you have more than one `onMessage`
   * listener in the same document, then only one may send a response. This
   * function becomes invalid when the event listener returns, *unless you
   * return true* from the event listener to indicate you wish to send a
   * response asynchronously (this will keep the message channel open to the
   * other end until `sendResponse` is called).
   */
  final Object sendResponse;

  OnMessageExternalEvent(this.message, this.sender, this.sendResponse);
}

/**
 * The operating system Chrome is running on.
 */
class PlatformOs extends ChromeEnum {
  static const PlatformOs MAC = const PlatformOs._('mac');
  static const PlatformOs WIN = const PlatformOs._('win');
  static const PlatformOs ANDROID = const PlatformOs._('android');
  static const PlatformOs CROS = const PlatformOs._('cros');
  static const PlatformOs LINUX = const PlatformOs._('linux');
  static const PlatformOs OPENBSD = const PlatformOs._('openbsd');
  static const PlatformOs FUCHSIA = const PlatformOs._('fuchsia');

  static const List<PlatformOs> VALUES = const[MAC, WIN, ANDROID, CROS, LINUX, OPENBSD, FUCHSIA];

  const PlatformOs._(String str): super(str);
}

/**
 * The machine's processor architecture.
 */
class PlatformArch extends ChromeEnum {
  static const PlatformArch ARM = const PlatformArch._('arm');
  static const PlatformArch ARM64 = const PlatformArch._('arm64');
  static const PlatformArch X86_32 = const PlatformArch._('x86-32');
  static const PlatformArch X86_64 = const PlatformArch._('x86-64');
  static const PlatformArch MIPS = const PlatformArch._('mips');
  static const PlatformArch MIPS64 = const PlatformArch._('mips64');

  static const List<PlatformArch> VALUES = const[ARM, ARM64, X86_32, X86_64, MIPS, MIPS64];

  const PlatformArch._(String str): super(str);
}

/**
 * The native client architecture. This may be different from arch on some
 * platforms.
 */
class PlatformNaclArch extends ChromeEnum {
  static const PlatformNaclArch ARM = const PlatformNaclArch._('arm');
  static const PlatformNaclArch X86_32 = const PlatformNaclArch._('x86-32');
  static const PlatformNaclArch X86_64 = const PlatformNaclArch._('x86-64');
  static const PlatformNaclArch MIPS = const PlatformNaclArch._('mips');
  static const PlatformNaclArch MIPS64 = const PlatformNaclArch._('mips64');

  static const List<PlatformNaclArch> VALUES = const[ARM, X86_32, X86_64, MIPS, MIPS64];

  const PlatformNaclArch._(String str): super(str);
}

/**
 * Result of the update check.
 */
class RequestUpdateCheckStatus extends ChromeEnum {
  static const RequestUpdateCheckStatus THROTTLED = const RequestUpdateCheckStatus._('throttled');
  static const RequestUpdateCheckStatus NO_UPDATE = const RequestUpdateCheckStatus._('no_update');
  static const RequestUpdateCheckStatus UPDATE_AVAILABLE = const RequestUpdateCheckStatus._('update_available');

  static const List<RequestUpdateCheckStatus> VALUES = const[THROTTLED, NO_UPDATE, UPDATE_AVAILABLE];

  const RequestUpdateCheckStatus._(String str): super(str);
}

/**
 * The reason that this event is being dispatched.
 */
class OnInstalledReason extends ChromeEnum {
  static const OnInstalledReason INSTALL = const OnInstalledReason._('install');
  static const OnInstalledReason UPDATE = const OnInstalledReason._('update');
  static const OnInstalledReason CHROME_UPDATE = const OnInstalledReason._('chrome_update');
  static const OnInstalledReason SHARED_MODULE_UPDATE = const OnInstalledReason._('shared_module_update');

  static const List<OnInstalledReason> VALUES = const[INSTALL, UPDATE, CHROME_UPDATE, SHARED_MODULE_UPDATE];

  const OnInstalledReason._(String str): super(str);
}

/**
 * The reason that the event is being dispatched. 'app_update' is used when the
 * restart is needed because the application is updated to a newer version.
 * 'os_update' is used when the restart is needed because the browser/OS is
 * updated to a newer version. 'periodic' is used when the system runs for more
 * than the permitted uptime set in the enterprise policy.
 */
class OnRestartRequiredReason extends ChromeEnum {
  static const OnRestartRequiredReason APP_UPDATE = const OnRestartRequiredReason._('app_update');
  static const OnRestartRequiredReason OS_UPDATE = const OnRestartRequiredReason._('os_update');
  static const OnRestartRequiredReason PERIODIC = const OnRestartRequiredReason._('periodic');

  static const List<OnRestartRequiredReason> VALUES = const[APP_UPDATE, OS_UPDATE, PERIODIC];

  const OnRestartRequiredReason._(String str): super(str);
}

class ContextType extends ChromeEnum {
  static const ContextType TAB = const ContextType._('TAB');
  static const ContextType POPUP = const ContextType._('POPUP');
  static const ContextType BACKGROUND = const ContextType._('BACKGROUND');
  static const ContextType OFFSCREEN_DOCUMENT = const ContextType._('OFFSCREEN_DOCUMENT');

  static const List<ContextType> VALUES = const[TAB, POPUP, BACKGROUND, OFFSCREEN_DOCUMENT];

  const ContextType._(String str): super(str);
}

class LastErrorRuntime extends ChromeObject {
  LastErrorRuntime();
  LastErrorRuntime.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Details about the error which occurred.
   */
  String get message => jsProxy['message'];
}

/**
 * An object which allows two way communication with other pages. See <a
 * href="messaging#connect">Long-lived connections</a> for more information.
 */
class Port extends ChromeObject {
  Port({String? name, MessageSender? sender}) {
    if (name != null) this.name = name;
    if (sender != null) this.sender = sender;
  }
  Port.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The name of the port, as specified in the call to [runtime.connect].
   */
  String get name => jsProxy['name'];
  set name(String value) => jsProxy['name'] = value;

  void disconnect([var arg1]) =>
         jsProxy.callMethod('disconnect', [jsify(arg1)]);

  void postMessage([var arg1]) =>
         jsProxy.callMethod('postMessage', [jsify(arg1)]);

  /**
   * This property will <b>only</b> be present on ports passed to
   * $(ref:runtime.onConnect onConnect) / $(ref:runtime.onConnectExternal
   * onConnectExternal) / $(ref:runtime.onConnectExternal onConnectNative)
   * listeners.
   */
  MessageSender get sender => _createMessageSender(jsProxy['sender']);
  set sender(MessageSender value) => jsProxy['sender'] = jsify(value);
}

/**
 * An object containing information about the script context that sent a message
 * or request.
 */
class MessageSender extends ChromeObject {
  MessageSender({Tab? tab, int? frameId, String? id, String? url, String? nativeApplication, String? tlsChannelId, String? origin, String? documentId, String? documentLifecycle}) {
    if (tab != null) this.tab = tab;
    if (frameId != null) this.frameId = frameId;
    if (id != null) this.id = id;
    if (url != null) this.url = url;
    if (nativeApplication != null) this.nativeApplication = nativeApplication;
    if (tlsChannelId != null) this.tlsChannelId = tlsChannelId;
    if (origin != null) this.origin = origin;
    if (documentId != null) this.documentId = documentId;
    if (documentLifecycle != null) this.documentLifecycle = documentLifecycle;
  }
  MessageSender.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The [tabs.Tab] which opened the connection, if any. This property will
   * *only* be present when the connection was opened from a tab (including
   * content scripts), and *only* if the receiver is an extension, not an app.
   */
  Tab get tab => _createTab(jsProxy['tab']);
  set tab(Tab value) => jsProxy['tab'] = jsify(value);

  /**
   * The [frame](webNavigation#frame_ids) that opened the connection. 0 for
   * top-level frames, positive for child frames. This will only be set when
   * `tab` is set.
   */
  int get frameId => jsProxy['frameId'];
  set frameId(int value) => jsProxy['frameId'] = value;

  /**
   * The ID of the extension or app that opened the connection, if any.
   */
  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  /**
   * The URL of the page or frame that opened the connection. If the sender is
   * in an iframe, it will be iframe's URL not the URL of the page which hosts
   * it.
   */
  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  /**
   * The name of the native application that opened the connection, if any.
   */
  String get nativeApplication => jsProxy['nativeApplication'];
  set nativeApplication(String value) => jsProxy['nativeApplication'] = value;

  /**
   * The TLS channel ID of the page or frame that opened the connection, if
   * requested by the extension or app, and if available.
   */
  String get tlsChannelId => jsProxy['tlsChannelId'];
  set tlsChannelId(String value) => jsProxy['tlsChannelId'] = value;

  /**
   * The origin of the page or frame that opened the connection. It can vary
   * from the url property (e.g., about:blank) or can be opaque (e.g., sandboxed
   * iframes). This is useful for identifying if the origin can be trusted if we
   * can't immediately tell from the URL.
   */
  String get origin => jsProxy['origin'];
  set origin(String value) => jsProxy['origin'] = value;

  /**
   * A UUID of the document that opened the connection.
   */
  String get documentId => jsProxy['documentId'];
  set documentId(String value) => jsProxy['documentId'] = value;

  /**
   * The lifecycle the document that opened the connection is in at the time the
   * port was created. Note that the lifecycle state of the document may have
   * changed since port creation.
   */
  String get documentLifecycle => jsProxy['documentLifecycle'];
  set documentLifecycle(String value) => jsProxy['documentLifecycle'] = value;
}

/**
 * An object containing information about the current platform.
 */
class PlatformInfo extends ChromeObject {
  PlatformInfo({PlatformOs? os, PlatformArch? arch, PlatformNaclArch? nacl_arch}) {
    if (os != null) this.os = os;
    if (arch != null) this.arch = arch;
    if (nacl_arch != null) this.nacl_arch = nacl_arch;
  }
  PlatformInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The operating system Chrome is running on.
   */
  PlatformOs get os => _createPlatformOs(jsProxy['os']);
  set os(PlatformOs value) => jsProxy['os'] = jsify(value);

  /**
   * The machine's processor architecture.
   */
  PlatformArch get arch => _createPlatformArch(jsProxy['arch']);
  set arch(PlatformArch value) => jsProxy['arch'] = jsify(value);

  /**
   * The native client architecture. This may be different from arch on some
   * platforms.
   */
  PlatformNaclArch get nacl_arch => _createPlatformNaclArch(jsProxy['nacl_arch']);
  set nacl_arch(PlatformNaclArch value) => jsProxy['nacl_arch'] = jsify(value);
}

/**
 * A context hosting extension content.
 */
class ExtensionContext extends ChromeObject {
  ExtensionContext({ContextType? contextType, String? contextId, int? tabId, int? windowId, String? documentId, int? frameId, String? documentUrl, String? documentOrigin, bool? incognito}) {
    if (contextType != null) this.contextType = contextType;
    if (contextId != null) this.contextId = contextId;
    if (tabId != null) this.tabId = tabId;
    if (windowId != null) this.windowId = windowId;
    if (documentId != null) this.documentId = documentId;
    if (frameId != null) this.frameId = frameId;
    if (documentUrl != null) this.documentUrl = documentUrl;
    if (documentOrigin != null) this.documentOrigin = documentOrigin;
    if (incognito != null) this.incognito = incognito;
  }
  ExtensionContext.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The type of context this corresponds to.
   */
  ContextType get contextType => _createContextType(jsProxy['contextType']);
  set contextType(ContextType value) => jsProxy['contextType'] = jsify(value);

  /**
   * A unique identifier for this context
   */
  String get contextId => jsProxy['contextId'];
  set contextId(String value) => jsProxy['contextId'] = value;

  /**
   * The ID of the tab for this context, or -1 if this context is not hosted in
   * a tab.
   */
  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;

  /**
   * The ID of the window for this context, or -1 if this context is not hosted
   * in a window.
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;

  /**
   * A UUID for the document associated with this context, or undefined if this
   * context is hosted not in a document.
   */
  String get documentId => jsProxy['documentId'];
  set documentId(String value) => jsProxy['documentId'] = value;

  /**
   * The ID of the frame for this context, or -1 if this context is not hosted
   * in a frame.
   */
  int get frameId => jsProxy['frameId'];
  set frameId(int value) => jsProxy['frameId'] = value;

  /**
   * The URL of the document associated with this context, or undefined if the
   * context is not hosted in a document.
   */
  String get documentUrl => jsProxy['documentUrl'];
  set documentUrl(String value) => jsProxy['documentUrl'] = value;

  /**
   * The origin of the document associated with this context, or undefined if
   * the context is not hosted in a document.
   */
  String get documentOrigin => jsProxy['documentOrigin'];
  set documentOrigin(String value) => jsProxy['documentOrigin'] = value;

  /**
   * Whether the context is associated with an incognito profile.
   */
  bool get incognito => jsProxy['incognito'];
  set incognito(bool value) => jsProxy['incognito'] = value;
}

/**
 * A filter to match against certain extension contexts. Matching contexts must
 * match all specified filters; any filter that is not specified matches all
 * available contexts. Thus, a filter of `{}` will match all available contexts.
 */
class ContextFilter extends ChromeObject {
  ContextFilter({List<ContextType>? contextTypes, List<String>? contextIds, List<int>? tabIds, List<int>? windowIds, List<String>? documentIds, List<int>? frameIds, List<String>? documentUrls, List<String>? documentOrigins, bool? incognito}) {
    if (contextTypes != null) this.contextTypes = contextTypes;
    if (contextIds != null) this.contextIds = contextIds;
    if (tabIds != null) this.tabIds = tabIds;
    if (windowIds != null) this.windowIds = windowIds;
    if (documentIds != null) this.documentIds = documentIds;
    if (frameIds != null) this.frameIds = frameIds;
    if (documentUrls != null) this.documentUrls = documentUrls;
    if (documentOrigins != null) this.documentOrigins = documentOrigins;
    if (incognito != null) this.incognito = incognito;
  }
  ContextFilter.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<ContextType> get contextTypes => listify(jsProxy['contextTypes'], _createContextType);
  set contextTypes(List<ContextType> value) => jsProxy['contextTypes'] = jsify(value);

  List<String> get contextIds => listify(jsProxy['contextIds']);
  set contextIds(List<String> value) => jsProxy['contextIds'] = jsify(value);

  List<int> get tabIds => listify(jsProxy['tabIds']);
  set tabIds(List<int> value) => jsProxy['tabIds'] = jsify(value);

  List<int> get windowIds => listify(jsProxy['windowIds']);
  set windowIds(List<int> value) => jsProxy['windowIds'] = jsify(value);

  List<String> get documentIds => listify(jsProxy['documentIds']);
  set documentIds(List<String> value) => jsProxy['documentIds'] = jsify(value);

  List<int> get frameIds => listify(jsProxy['frameIds']);
  set frameIds(List<int> value) => jsProxy['frameIds'] = jsify(value);

  List<String> get documentUrls => listify(jsProxy['documentUrls']);
  set documentUrls(List<String> value) => jsProxy['documentUrls'] = jsify(value);

  List<String> get documentOrigins => listify(jsProxy['documentOrigins']);
  set documentOrigins(List<String> value) => jsProxy['documentOrigins'] = jsify(value);

  bool get incognito => jsProxy['incognito'];
  set incognito(bool value) => jsProxy['incognito'] = value;
}

class RuntimeConnectParams extends ChromeObject {
  RuntimeConnectParams({String? name, bool? includeTlsChannelId}) {
    if (name != null) this.name = name;
    if (includeTlsChannelId != null) this.includeTlsChannelId = includeTlsChannelId;
  }
  RuntimeConnectParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Will be passed into onConnect for processes that are listening for the
   * connection event.
   */
  String get name => jsProxy['name'];
  set name(String value) => jsProxy['name'] = value;

  /**
   * Whether the TLS channel ID will be passed into onConnectExternal for
   * processes that are listening for the connection event.
   */
  bool get includeTlsChannelId => jsProxy['includeTlsChannelId'];
  set includeTlsChannelId(bool value) => jsProxy['includeTlsChannelId'] = value;
}

class RuntimeSendMessageParams extends ChromeObject {
  RuntimeSendMessageParams({bool? includeTlsChannelId}) {
    if (includeTlsChannelId != null) this.includeTlsChannelId = includeTlsChannelId;
  }
  RuntimeSendMessageParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Whether the TLS channel ID will be passed into onMessageExternal for
   * processes that are listening for the connection event.
   */
  bool get includeTlsChannelId => jsProxy['includeTlsChannelId'];
  set includeTlsChannelId(bool value) => jsProxy['includeTlsChannelId'] = value;
}

Port _createPort(JsObject jsProxy) => Port.fromProxy(jsProxy);
OnMessageEvent _createOnMessageEvent(JsObject message, JsObject sender, JsObject sendResponse) =>
    OnMessageEvent(message, _createMessageSender(sender), sendResponse);
OnMessageExternalEvent _createOnMessageExternalEvent(JsObject message, JsObject sender, JsObject sendResponse) =>
    OnMessageExternalEvent(message, _createMessageSender(sender), sendResponse);
OnRestartRequiredReason _createOnRestartRequiredReason(String value) => OnRestartRequiredReason.VALUES.singleWhere((ChromeEnum e) => e.value == value);
LastErrorRuntime _createLastErrorRuntime(JsObject jsProxy) => LastErrorRuntime.fromProxy(jsProxy);
DirectoryEntry _createDirectoryEntry(JsObject jsProxy) => CrDirectoryEntry.fromProxy(jsProxy);
MessageSender _createMessageSender(JsObject jsProxy) => MessageSender.fromProxy(jsProxy);
Tab _createTab(JsObject jsProxy) => Tab.fromProxy(jsProxy);
PlatformOs _createPlatformOs(String value) => PlatformOs.VALUES.singleWhere((ChromeEnum e) => e.value == value);
PlatformArch _createPlatformArch(String value) => PlatformArch.VALUES.singleWhere((ChromeEnum e) => e.value == value);
PlatformNaclArch _createPlatformNaclArch(String value) => PlatformNaclArch.VALUES.singleWhere((ChromeEnum e) => e.value == value);
ContextType _createContextType(String value) => ContextType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
