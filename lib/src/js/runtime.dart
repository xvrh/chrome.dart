import 'chrome.dart';
import 'dart:js_interop';
import 'tabs.dart';
export 'chrome.dart';

extension JSChromeJSRuntimeExtension on JSChrome {
  /// Use the `chrome.runtime` API to retrieve the background page, return
  /// details about the manifest, and listen for and respond to events in the
  /// app or extension lifecycle. You can also use this API to convert the
  /// relative path of URLs to fully-qualified URLs.
  external JSRuntime get runtime;
}

@JS()
@staticInterop
class JSRuntime {}

extension JSRuntimeExtension on JSRuntime {
  /// Retrieves the JavaScript 'window' object for the background page running
  /// inside the current extension/app. If the background page is an event page,
  /// the system will ensure it is loaded before calling the callback. If there
  /// is no background page, an error is set.
  external JSPromise getBackgroundPage();

  /// <p>Open your Extension's options page, if possible.</p><p>The precise
  /// behavior may depend on your manifest's `<a
  /// href="optionsV2">options_ui</a>` or `<a href="options">options_page</a>`
  /// key, or what Chrome happens to support at the time. For example, the page
  /// may be opened in a new tab, within chrome://extensions, within an App, or
  /// it may just focus an open options page. It will never cause the caller
  /// page to reload.</p><p>If your Extension does not declare an options page,
  /// or Chrome failed to create one for some other reason, the callback will
  /// set $(ref:lastError).</p>
  external JSPromise openOptionsPage();

  /// Returns details about the app or extension from the manifest. The object
  /// returned is a serialization of the full <a href="manifest.html">manifest
  /// file</a>.
  external JSObject getManifest();

  /// Converts a relative path within an app/extension install directory to a
  /// fully-qualified URL.
  external JSString getURL(JSString path);

  /// Sets the URL to be visited upon uninstallation. This may be used to clean
  /// up server-side data, do analytics, and implement surveys. Maximum 255
  /// characters.
  external JSPromise setUninstallURL(JSString url);

  /// Reloads the app or extension. This method is not supported in kiosk mode.
  /// For kiosk mode, use chrome.runtime.restart() method.
  external void reload();

  /// <p>Requests an immediate update check be done for this app/extension.</p>
  /// <p>**Important**: Most extensions/apps should **not** use this method,
  /// since Chrome already does automatic checks every few hours, and you can
  /// listen for the $(ref:runtime.onUpdateAvailable) event without needing to
  /// call requestUpdateCheck.</p><p>This method is only appropriate to call in
  /// very limited circumstances, such as if your extension/app talks to a
  /// backend service, and the backend service has determined that the client
  /// extension/app version is very far out of date and you'd like to prompt a
  /// user to update. Most other uses of requestUpdateCheck, such as calling it
  /// unconditionally based on a repeating timer, probably only serve to waste
  /// client, network, and server resources.</p><p>Note: When called with a
  /// callback, instead of returning an object this function will return the two
  /// properties as separate arguments passed to the callback.</p>
  external JSPromise requestUpdateCheck();

  /// Restart the ChromeOS device when the app runs in kiosk mode. Otherwise,
  /// it's no-op.
  external void restart();

  /// Restart the ChromeOS device when the app runs in kiosk mode after the
  /// given seconds. If called again before the time ends, the reboot will be
  /// delayed. If called with a value of -1, the reboot will be cancelled. It's
  /// a no-op in non-kiosk mode. It's only allowed to be called repeatedly by
  /// the first extension to invoke this API.
  external JSPromise restartAfterDelay(JSNumber seconds);

  /// Attempts to connect listeners within an extension/app (such as the
  /// background page), or other extensions/apps. This is useful for content
  /// scripts connecting to their extension processes, inter-app/extension
  /// communication, and <a href="manifest/externally_connectable.html">web
  /// messaging</a>. Note that this does not connect to any listeners in a
  /// content script. Extensions may connect to content scripts embedded in tabs
  /// via $(ref:tabs.connect).
  external Port connect(
    JSString? extensionId,
    ConnectInfo? connectInfo,
  );

  /// Connects to a native application in the host machine. See <a
  /// href="nativeMessaging">Native Messaging</a> for more information.
  external Port connectNative(JSString application);

  /// Sends a single message to event listeners within your extension/app or a
  /// different extension/app. Similar to $(ref:runtime.connect) but only sends
  /// a single message, with an optional response. If sending to your extension,
  /// the $(ref:runtime.onMessage) event will be fired in every frame of your
  /// extension (except for the sender's frame), or
  /// $(ref:runtime.onMessageExternal), if a different extension. Note that
  /// extensions cannot send messages to content scripts using this method. To
  /// send messages to content scripts, use $(ref:tabs.sendMessage).
  external JSPromise sendMessage(
    JSString? extensionId,
    JSAny message,
    SendMessageOptions? options,
  );

  /// Send a single message to a native application.
  external JSPromise sendNativeMessage(
    JSString application,
    JSObject message,
  );

  /// Returns information about the current platform.
  external JSPromise getPlatformInfo();

  /// Returns a DirectoryEntry for the package directory.
  external void getPackageDirectoryEntry(JSFunction callback);

  /// Fetches information about active contexts associated with this extension
  external JSPromise getContexts(ContextFilter filter);

  /// Fired when a profile that has this extension installed first starts up.
  /// This event is not fired when an incognito profile is started, even if this
  /// extension is operating in 'split' incognito mode.
  external ChromeEvent get onStartup;

  /// Fired when the extension is first installed, when the extension is updated
  /// to a new version, and when Chrome is updated to a new version.
  external ChromeEvent get onInstalled;

  /// Sent to the event page just before it is unloaded. This gives the
  /// extension opportunity to do some clean up. Note that since the page is
  /// unloading, any asynchronous operations started while handling this event
  /// are not guaranteed to complete. If more activity for the event page occurs
  /// before it gets unloaded the onSuspendCanceled event will be sent and the
  /// page won't be unloaded.
  external ChromeEvent get onSuspend;

  /// Sent after onSuspend to indicate that the app won't be unloaded after all.
  external ChromeEvent get onSuspendCanceled;

  /// Fired when an update is available, but isn't installed immediately because
  /// the app is currently running. If you do nothing, the update will be
  /// installed the next time the background page gets unloaded, if you want it
  /// to be installed sooner you can explicitly call chrome.runtime.reload(). If
  /// your extension is using a persistent background page, the background page
  /// of course never gets unloaded, so unless you call chrome.runtime.reload()
  /// manually in response to this event the update will not get installed until
  /// the next time Chrome itself restarts. If no handlers are listening for
  /// this event, and your extension has a persistent background page, it
  /// behaves as if chrome.runtime.reload() is called in response to this event.
  external ChromeEvent get onUpdateAvailable;

  /// Fired when a Chrome update is available, but isn't installed immediately
  /// because a browser restart is required.
  external ChromeEvent get onBrowserUpdateAvailable;

  /// Fired when a connection is made from either an extension process or a
  /// content script (by $(ref:runtime.connect)).
  external ChromeEvent get onConnect;

  /// Fired when a connection is made from another extension (by
  /// $(ref:runtime.connect)).
  external ChromeEvent get onConnectExternal;

  /// Fired when a connection is made from a native application. Currently only
  /// supported on Chrome OS.
  external ChromeEvent get onConnectNative;

  /// Fired when a message is sent from either an extension process (by
  /// $(ref:runtime.sendMessage)) or a content script (by
  /// $(ref:tabs.sendMessage)).
  external ChromeEvent get onMessage;

  /// Fired when a message is sent from another extension/app (by
  /// $(ref:runtime.sendMessage)). Cannot be used in a content script.
  external ChromeEvent get onMessageExternal;

  /// Fired when an app or the device that it runs on needs to be restarted. The
  /// app should close all its windows at its earliest convenient time to let
  /// the restart to happen. If the app does nothing, a restart will be enforced
  /// after a 24-hour grace period has passed. Currently, this event is only
  /// fired for Chrome OS kiosk apps.
  external ChromeEvent get onRestartRequired;

  /// This will be defined during an API method callback if there was an error
  external JSObject get lastError;

  /// The ID of the extension/app.
  external JSString get id;
}

/// The operating system Chrome is running on.
typedef PlatformOs = JSString;

/// The machine's processor architecture.
typedef PlatformArch = JSString;

/// The native client architecture. This may be different from arch on some
/// platforms.
typedef PlatformNaclArch = JSString;

/// Result of the update check.
typedef RequestUpdateCheckStatus = JSString;

/// The reason that this event is being dispatched.
typedef OnInstalledReason = JSString;

/// The reason that the event is being dispatched. 'app_update' is used when the
/// restart is needed because the application is updated to a newer version.
/// 'os_update' is used when the restart is needed because the browser/OS is
/// updated to a newer version. 'periodic' is used when the system runs for more
/// than the permitted uptime set in the enterprise policy.
typedef OnRestartRequiredReason = JSString;

typedef ContextType = JSString;

@JS()
@staticInterop
class Port {}

extension PortExtension on Port {
  /// The name of the port, as specified in the call to $(ref:runtime.connect).
  external JSString get name;

  /// Immediately disconnect the port. Calling `disconnect()` on an
  /// already-disconnected port has no effect. When a port is disconnected, no
  /// new events will be dispatched to this port.
  external JSFunction get disconnect;

  /// Send a message to the other end of the port. If the port is disconnected,
  /// an error is thrown.
  external JSFunction get postMessage;

  /// This property will **only** be present on ports passed to
  /// $(ref:runtime.onConnect onConnect) / $(ref:runtime.onConnectExternal
  /// onConnectExternal) / $(ref:runtime.onConnectExternal onConnectNative)
  /// listeners.
  external MessageSender? get sender;

  /// Fired when the port is disconnected from the other end(s).
  /// $(ref:runtime.lastError) may be set if the port was disconnected by an
  /// error. If the port is closed via $(ref:Port.disconnect disconnect), then
  /// this event is <em>only</em> fired on the other end. This event is fired at
  /// most once (see also <a href="messaging#port-lifetime">Port lifetime</a>).
  external ChromeEvent get onDisconnect;

  /// This event is fired when $(ref:Port.postMessage postMessage) is called by
  /// the other end of the port.
  external ChromeEvent get onMessage;
}

@JS()
@staticInterop
class MessageSender {}

extension MessageSenderExtension on MessageSender {
  /// The $(ref:tabs.Tab) which opened the connection, if any. This property
  /// will <strong>only</strong> be present when the connection was opened from
  /// a tab (including content scripts), and <strong>only</strong> if the
  /// receiver is an extension, not an app.
  external Tab? get tab;

  /// The <a href='webNavigation#frame_ids'>frame</a> that opened the
  /// connection. 0 for top-level frames, positive for child frames. This will
  /// only be set when `tab` is set.
  external JSNumber? get frameId;

  /// The guest process id of the requesting webview, if available. Only
  /// available for component extensions.
  external JSNumber? get guestProcessId;

  /// The guest render frame routing id of the requesting webview, if available.
  /// Only available for component extensions.
  external JSNumber? get guestRenderFrameRoutingId;

  /// The ID of the extension or app that opened the connection, if any.
  external JSString? get id;

  /// The URL of the page or frame that opened the connection. If the sender is
  /// in an iframe, it will be iframe's URL not the URL of the page which hosts
  /// it.
  external JSString? get url;

  /// The name of the native application that opened the connection, if any.
  external JSString? get nativeApplication;

  /// The TLS channel ID of the page or frame that opened the connection, if
  /// requested by the extension or app, and if available.
  external JSString? get tlsChannelId;

  /// The origin of the page or frame that opened the connection. It can vary
  /// from the url property (e.g., about:blank) or can be opaque (e.g.,
  /// sandboxed iframes). This is useful for identifying if the origin can be
  /// trusted if we can't immediately tell from the URL.
  external JSString? get origin;

  /// A UUID of the document that opened the connection.
  external JSString? get documentId;

  /// The lifecycle the document that opened the connection is in at the time
  /// the port was created. Note that the lifecycle state of the document may
  /// have changed since port creation.
  external JSString? get documentLifecycle;
}

@JS()
@staticInterop
class PlatformInfo {}

extension PlatformInfoExtension on PlatformInfo {
  /// The operating system Chrome is running on.
  external PlatformOs get os;

  /// The machine's processor architecture.
  external PlatformArch get arch;

  /// The native client architecture. This may be different from arch on some
  /// platforms.
  external PlatformNaclArch get nacl_arch;
}

@JS()
@staticInterop
class ExtensionContext {}

extension ExtensionContextExtension on ExtensionContext {
  /// The type of context this corresponds to.
  external ContextType get contextType;

  /// A unique identifier for this context
  external JSString get contextId;

  /// The ID of the tab for this context, or -1 if this context is not hosted in
  /// a tab.
  external JSNumber get tabId;

  /// The ID of the window for this context, or -1 if this context is not hosted
  /// in a window.
  external JSNumber get windowId;

  /// A UUID for the document associated with this context, or undefined if this
  /// context is hosted not in a document.
  external JSString? get documentId;

  /// The ID of the frame for this context, or -1 if this context is not hosted
  /// in a frame.
  external JSNumber get frameId;

  /// The URL of the document associated with this context, or undefined if the
  /// context is not hosted in a document.
  external JSString? get documentUrl;

  /// The origin of the document associated with this context, or undefined if
  /// the context is not hosted in a document.
  external JSString? get documentOrigin;

  /// Whether the context is associated with an incognito profile.
  external JSBoolean get incognito;
}

@JS()
@staticInterop
class ContextFilter {}

extension ContextFilterExtension on ContextFilter {
  external JSArray? get contextTypes;

  external JSArray? get contextIds;

  external JSArray? get tabIds;

  external JSArray? get windowIds;

  external JSArray? get documentIds;

  external JSArray? get frameIds;

  external JSArray? get documentUrls;

  external JSArray? get documentOrigins;

  external JSBoolean? get incognito;
}

@JS()
@staticInterop
@anonymous
class ConnectInfo {
  external factory ConnectInfo(
    /// Will be passed into onConnect for processes that are listening for the
    /// connection event.
    JSString? name,

    /// Whether the TLS channel ID will be passed into onConnectExternal for
    /// processes that are listening for the connection event.
    JSBoolean? includeTlsChannelId,
  );
}

@JS()
@staticInterop
@anonymous
class SendMessageOptions {
  external factory SendMessageOptions(

      /// Whether the TLS channel ID will be passed into onMessageExternal for
      /// processes that are listening for the connection event.
      JSBoolean? includeTlsChannelId);
}
