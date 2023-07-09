import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDownloadsExtension on JSChrome {
  ///  Use the `chrome.downloads` API to programmatically initiate,
  ///  monitor, manipulate, and search for downloads.
  external JSDownloads get Downloads;
}

@JS()
@staticInterop
class JSDownloads {}

extension JSDownloadsExtension on JSDownloads {
  ///  Download a URL. If the URL uses the HTTP[S] protocol, then the request
  ///  will include all cookies currently set for its hostname. If both
  ///  `filename` and `saveAs` are specified, then the
  ///  Save As dialog will be displayed, pre-populated with the specified
  ///  `filename`. If the download started successfully,
  ///  `callback` will be called with the new $(ref:DownloadItem)'s
  ///  `downloadId`. If there was an error starting the download,
  ///  then `callback` will be called with
  ///  `downloadId=undefined` and $(ref:runtime.lastError) will contain
  ///  a descriptive string. The error strings are not guaranteed to remain
  ///  backwards compatible between releases. Extensions must not parse it.
  ///  |options|: What to download and how.
  ///  |callback|: Called with the id of the new $(ref:DownloadItem).
  external void download();

  ///  Find $(ref:DownloadItem). Set `query` to the empty object to get
  ///  all $(ref:DownloadItem). To get a specific $(ref:DownloadItem), set only
  /// the
  ///  `id` field. To page through a large number of items, set
  ///  `orderBy: ['-startTime']`, set `limit` to the
  ///  number of items per page, and set `startedAfter` to the
  ///  `startTime` of the last item from the last page.
  external void search();

  ///  Pause the download. If the request was successful the download is in a
  ///  paused state. Otherwise $(ref:runtime.lastError) contains an error
  /// message.
  ///  The request will fail if the download is not active.
  ///  |downloadId|: The id of the download to pause.
  ///  |callback|: Called when the pause request is completed.
  external void pause();

  ///  Resume a paused download. If the request was successful the download is
  ///  in progress and unpaused. Otherwise $(ref:runtime.lastError) contains an
  ///  error message. The request will fail if the download is not active.
  ///  |downloadId|: The id of the download to resume.
  ///  |callback|: Called when the resume request is completed.
  external void resume();

  ///  Cancel a download. When `callback` is run, the download is
  ///  cancelled, completed, interrupted or doesn't exist anymore.
  ///  |downloadId|: The id of the download to cancel.
  ///  |callback|: Called when the cancel request is completed.
  external void cancel();

  ///  Retrieve an icon for the specified download. For new downloads, file
  ///  icons are available after the $(ref:onCreated) event has been received.
  /// The
  ///  image returned by this function while a download is in progress may be
  ///  different from the image returned after the download is complete. Icon
  ///  retrieval is done by querying the underlying operating system or toolkit
  ///  depending on the platform. The icon that is returned will therefore
  ///  depend on a number of factors including state of the download, platform,
  ///  registered file types and visual theme. If a file icon cannot be
  ///  determined, $(ref:runtime.lastError) will contain an error message.
  ///  |downloadId|: The identifier for the download.
  ///  |callback|: A URL to an image that represents the download.
  external void getFileIcon();

  ///  Open the downloaded file now if the $(ref:DownloadItem) is complete;
  ///  otherwise returns an error through $(ref:runtime.lastError). Requires the
  ///  `"downloads.open"` permission in addition to the
  ///  `"downloads"` permission. An $(ref:onChanged) event will fire
  ///  when the item is opened for the first time.
  ///  |downloadId|: The identifier for the downloaded file.
  external void open();

  ///  Show the downloaded file in its folder in a file manager.
  ///  |downloadId|: The identifier for the downloaded file.
  external void show();

  ///  Show the default Downloads folder in a file manager.
  external void showDefaultFolder();

  ///  Erase matching $(ref:DownloadItem) from history without deleting the
  ///  downloaded file. An $(ref:onErased) event will fire for each
  ///  $(ref:DownloadItem) that matches `query`, then
  ///  `callback` will be called.
  external void erase();

  ///  Remove the downloaded file if it exists and the $(ref:DownloadItem) is
  ///  complete; otherwise return an error through $(ref:runtime.lastError).
  external void removeFile();

  ///  Prompt the user to accept a dangerous download. Can only be called from a
  ///  visible context (tab, window, or page/browser action popup). Does not
  ///  automatically accept dangerous downloads. If the download is accepted,
  ///  then an $(ref:onChanged) event will fire, otherwise nothing will happen.
  ///  When all the data is fetched into a temporary file and either the
  ///  download is not dangerous or the danger has been accepted, then the
  ///  temporary file is renamed to the target filename, the |state| changes to
  ///  'complete', and $(ref:onChanged) fires.
  ///  |downloadId|: The identifier for the $(ref:DownloadItem).
  ///  |callback|: Called when the danger prompt dialog closes.
  external void acceptDanger();

  ///  Enable or disable the gray shelf at the bottom of every window associated
  ///  with the current browser profile. The shelf will be disabled as long as
  ///  at least one extension has disabled it. Enabling the shelf while at least
  ///  one other extension has disabled it will return an error through
  ///  $(ref:runtime.lastError). Requires the `"downloads.shelf"`
  ///  permission in addition to the `"downloads"` permission.
  external void setShelfEnabled();

  ///  Change the download UI of every window associated with the current
  ///  browser profile. As long as at least one extension has set
  ///  $(ref:UiOptions.enabled) to false, the download UI will be hidden.
  ///  Setting $(ref:UiOptions.enabled) to true while at least one other
  ///  extension has disabled it will return an error through
  ///  $(ref:runtime.lastError). Requires the `"downloads.ui"`
  ///  permission in addition to the `"downloads"` permission.
  ///  |options|: Encapsulate a change to the download UI.
  ///  |callback|: Called when the UI update is completed.
  external void setUiOptions();

  ///  This event fires with the $(ref:DownloadItem) object when a download
  ///  begins.
  external ChromeEvent get onCreated;

  ///  Fires with the `downloadId` when a download is erased from
  ///  history.
  ///  |downloadId|: The `id` of the $(ref:DownloadItem) that was
  ///  erased.
  external ChromeEvent get onErased;

  ///  When any of a $(ref:DownloadItem)'s properties except
  ///  `bytesReceived` and `estimatedEndTime` changes,
  ///  this event fires with the `downloadId` and an object
  ///  containing the properties that changed.
  external ChromeEvent get onChanged;

  ///  During the filename determination process, extensions will be given the
  ///  opportunity to override the target $(ref:DownloadItem.filename). Each
  ///  extension may not register more than one listener for this event. Each
  ///  listener must call `suggest` exactly once, either
  ///  synchronously or asynchronously. If the listener calls
  ///  `suggest` asynchronously, then it must return
  ///  `true`. If the listener neither calls `suggest`
  ///  synchronously nor returns `true`, then `suggest`
  ///  will be called automatically. The $(ref:DownloadItem) will not complete
  ///  until all listeners have called `suggest`. Listeners may call
  ///  `suggest` without any arguments in order to allow the download
  ///  to use `downloadItem.filename` for its filename, or pass a
  ///  `suggestion` object to `suggest` in order to
  ///  override the target filename. If more than one extension overrides the
  ///  filename, then the last extension installed whose listener passes a
  ///  `suggestion` object to `suggest` wins. In order to
  ///  avoid confusion regarding which extension will win, users should not
  ///  install extensions that may conflict. If the download is initiated by
  ///  $(ref:download) and the target filename is known before the MIME type and
  ///  tentative filename have been determined, pass `filename` to
  ///  $(ref:download) instead.
  external ChromeEvent get onDeterminingFilename;
}
