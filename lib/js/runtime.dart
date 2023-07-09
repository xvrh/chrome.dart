import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSRuntimeExtension on JSChrome {
  /// Use the `chrome.runtime` API to retrieve the background page, return
  /// details about the manifest, and listen for and respond to events in the
  /// app or extension lifecycle. You can also use this API to convert the
  /// relative path of URLs to fully-qualified URLs.
  external JSRuntime get Runtime;
}

@JS()
@staticInterop
class JSRuntime {}

extension JSRuntimeExtension on JSRuntime {
  /// Retrieves the JavaScript 'window' object for the background page running
  /// inside the current extension/app. If the background page is an event page,
  /// the system will ensure it is loaded before calling the callback. If there
  /// is no background page, an error is set.
  external void getBackgroundPage();

  /// <p>Open your Extension's options page, if possible.</p><p>The precise
  /// behavior may depend on your manifest's `<a
  /// href="optionsV2">options_ui</a>` or `<a href="options">options_page</a>`
  /// key, or what Chrome happens to support at the time. For example, the page
  /// may be opened in a new tab, within chrome://extensions, within an App, or
  /// it may just focus an open options page. It will never cause the caller
  /// page to reload.</p><p>If your Extension does not declare an options page,
  /// or Chrome failed to create one for some other reason, the callback will
  /// set $(ref:lastError).</p>
  external void openOptionsPage();

  /// Returns details about the app or extension from the manifest. The object
  /// returned is a serialization of the full <a href="manifest.html">manifest
  /// file</a>.
  external void getManifest();

  /// Converts a relative path within an app/extension install directory to a
  /// fully-qualified URL.
  external void getURL();

  /// Sets the URL to be visited upon uninstallation. This may be used to clean
  /// up server-side data, do analytics, and implement surveys. Maximum 255
  /// characters.
  external void setUninstallURL();

  /// Reloads the app or extension. This method is not supported in kiosk mode.
  /// For kiosk mode, use chrome.runtime.restart() method.
  external void reload();

  /// <p>Requests an immediate update check be done for this app/extension.</p>
  /// <p><b>Important</b>: Most extensions/apps should <b>not</b> use this
  /// method, since Chrome already does automatic checks every few hours, and
  /// you can listen for the $(ref:runtime.onUpdateAvailable) event without
  /// needing to call requestUpdateCheck.</p><p>This method is only appropriate
  /// to call in very limited circumstances, such as if your extension/app talks
  /// to a backend service, and the backend service has determined that the
  /// client extension/app version is very far out of date and you'd like to
  /// prompt a user to update. Most other uses of requestUpdateCheck, such as
  /// calling it unconditionally based on a repeating timer, probably only serve
  /// to waste client, network, and server resources.</p><p>Note: When called
  /// with a callback, instead of returning an object this function will return
  /// the two properties as separate arguments passed to the callback.</p>
  external void requestUpdateCheck();

  /// Restart the ChromeOS device when the app runs in kiosk mode. Otherwise,
  /// it's no-op.
  external void restart();

  /// Restart the ChromeOS device when the app runs in kiosk mode after the
  /// given seconds. If called again before the time ends, the reboot will be
  /// delayed. If called with a value of -1, the reboot will be cancelled. It's
  /// a no-op in non-kiosk mode. It's only allowed to be called repeatedly by
  /// the first extension to invoke this API.
  external void restartAfterDelay();

  /// Attempts to connect listeners within an extension/app (such as the
  /// background page), or other extensions/apps. This is useful for content
  /// scripts connecting to their extension processes, inter-app/extension
  /// communication, and <a href="manifest/externally_connectable.html">web
  /// messaging</a>. Note that this does not connect to any listeners in a
  /// content script. Extensions may connect to content scripts embedded in tabs
  /// via $(ref:tabs.connect).
  external void connect();

  /// Connects to a native application in the host machine. See <a
  /// href="nativeMessaging">Native Messaging</a> for more information.
  external void connectNative();

  /// Sends a single message to event listeners within your extension/app or a
  /// different extension/app. Similar to $(ref:runtime.connect) but only sends
  /// a single message, with an optional response. If sending to your extension,
  /// the $(ref:runtime.onMessage) event will be fired in every frame of your
  /// extension (except for the sender's frame), or
  /// $(ref:runtime.onMessageExternal), if a different extension. Note that
  /// extensions cannot send messages to content scripts using this method. To
  /// send messages to content scripts, use $(ref:tabs.sendMessage).
  external void sendMessage();

  /// Send a single message to a native application.
  external void sendNativeMessage();

  /// Returns information about the current platform.
  external void getPlatformInfo();

  /// Returns a DirectoryEntry for the package directory.
  external void getPackageDirectoryEntry();

  /// Fetches information about active contexts associated with this extension
  external void getContexts();

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
}
