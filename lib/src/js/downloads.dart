import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDownloadsExtension on JSChrome {
  ///  Use the `chrome.downloads` API to programmatically initiate,
  ///  monitor, manipulate, and search for downloads.
  external JSDownloads get downloads;
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
  external void download(
    DownloadOptions options,
    JSFunction callback,
  );

  ///  Find $(ref:DownloadItem). Set `query` to the empty object to get
  ///  all $(ref:DownloadItem). To get a specific $(ref:DownloadItem), set only
  /// the
  ///  `id` field. To page through a large number of items, set
  ///  `orderBy: ['-startTime']`, set `limit` to the
  ///  number of items per page, and set `startedAfter` to the
  ///  `startTime` of the last item from the last page.
  external void search(
    DownloadQuery query,
    JSFunction callback,
  );

  ///  Pause the download. If the request was successful the download is in a
  ///  paused state. Otherwise $(ref:runtime.lastError) contains an error
  /// message.
  ///  The request will fail if the download is not active.
  ///  |downloadId|: The id of the download to pause.
  ///  |callback|: Called when the pause request is completed.
  external void pause(
    int downloadId,
    JSFunction callback,
  );

  ///  Resume a paused download. If the request was successful the download is
  ///  in progress and unpaused. Otherwise $(ref:runtime.lastError) contains an
  ///  error message. The request will fail if the download is not active.
  ///  |downloadId|: The id of the download to resume.
  ///  |callback|: Called when the resume request is completed.
  external void resume(
    int downloadId,
    JSFunction callback,
  );

  ///  Cancel a download. When `callback` is run, the download is
  ///  cancelled, completed, interrupted or doesn't exist anymore.
  ///  |downloadId|: The id of the download to cancel.
  ///  |callback|: Called when the cancel request is completed.
  external void cancel(
    int downloadId,
    JSFunction callback,
  );

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
  external void getFileIcon(
    int downloadId,
    GetFileIconOptions options,
    JSFunction callback,
  );

  ///  Open the downloaded file now if the $(ref:DownloadItem) is complete;
  ///  otherwise returns an error through $(ref:runtime.lastError). Requires the
  ///  `"downloads.open"` permission in addition to the
  ///  `"downloads"` permission. An $(ref:onChanged) event will fire
  ///  when the item is opened for the first time.
  ///  |downloadId|: The identifier for the downloaded file.
  external void open(int downloadId);

  ///  Show the downloaded file in its folder in a file manager.
  ///  |downloadId|: The identifier for the downloaded file.
  external void show(int downloadId);

  ///  Show the default Downloads folder in a file manager.
  external void showDefaultFolder();

  ///  Erase matching $(ref:DownloadItem) from history without deleting the
  ///  downloaded file. An $(ref:onErased) event will fire for each
  ///  $(ref:DownloadItem) that matches `query`, then
  ///  `callback` will be called.
  external void erase(
    DownloadQuery query,
    JSFunction callback,
  );

  ///  Remove the downloaded file if it exists and the $(ref:DownloadItem) is
  ///  complete; otherwise return an error through $(ref:runtime.lastError).
  external void removeFile(
    int downloadId,
    JSFunction callback,
  );

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
  external void acceptDanger(
    int downloadId,
    JSFunction callback,
  );

  ///  Enable or disable the gray shelf at the bottom of every window associated
  ///  with the current browser profile. The shelf will be disabled as long as
  ///  at least one extension has disabled it. Enabling the shelf while at least
  ///  one other extension has disabled it will return an error through
  ///  $(ref:runtime.lastError). Requires the `"downloads.shelf"`
  ///  permission in addition to the `"downloads"` permission.
  external void setShelfEnabled(bool enabled);

  ///  Change the download UI of every window associated with the current
  ///  browser profile. As long as at least one extension has set
  ///  $(ref:UiOptions.enabled) to false, the download UI will be hidden.
  ///  Setting $(ref:UiOptions.enabled) to true while at least one other
  ///  extension has disabled it will return an error through
  ///  $(ref:runtime.lastError). Requires the `"downloads.ui"`
  ///  permission in addition to the `"downloads"` permission.
  ///  |options|: Encapsulate a change to the download UI.
  ///  |callback|: Called when the UI update is completed.
  external void setUiOptions(
    UiOptions options,
    JSFunction callback,
  );

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

///  <dl><dt>uniquify</dt>
///      <dd>To avoid duplication, the `filename` is changed to
///      include a counter before the filename extension.</dd>
///      <dt>overwrite</dt>
///      <dd>The existing file will be overwritten with the new file.</dd>
///      <dt>prompt</dt>
///      <dd>The user will be prompted with a file chooser dialog.</dd>
///  </dl>
typedef FilenameConflictAction = JSString;

typedef HttpMethod = JSString;

typedef InterruptReason = JSString;

///  <dl><dt>file</dt>
///      <dd>The download's filename is suspicious.</dd>
///      <dt>url</dt>
///      <dd>The download's URL is known to be malicious.</dd>
///      <dt>content</dt>
///      <dd>The downloaded file is known to be malicious.</dd>
///      <dt>uncommon</dt>
///      <dd>The download's URL is not commonly downloaded and could be
///      dangerous.</dd>
///      <dt>host</dt>
///      <dd>The download came from a host known to distribute malicious
///      binaries and is likely dangerous.</dd>
///      <dt>unwanted</dt>
///      <dd>The download is potentially unwanted or unsafe. E.g. it could make
///      changes to browser or computer settings.</dd>
///      <dt>safe</dt>
///      <dd>The download presents no known danger to the user's computer.</dd>
///      <dt>accepted</dt>
///      <dd>The user has accepted the dangerous download.</dd>
///  </dl>
typedef DangerType = JSString;

///  <dl><dt>in_progress</dt>
///      <dd>The download is currently receiving data from the server.</dd>
///      <dt>interrupted</dt>
///      <dd>An error broke the connection with the file host.</dd>
///      <dt>complete</dt>
///      <dd>The download completed successfully.</dd>
///  </dl>
typedef State = JSString;

@JS()
@staticInterop
class HeaderNameValuePair {}

extension HeaderNameValuePairExtension on HeaderNameValuePair {
  ///  Name of the HTTP header.
  external String get name;

  ///  Value of the HTTP header.
  external String get value;
}

@JS()
@staticInterop
class FilenameSuggestion {}

extension FilenameSuggestionExtension on FilenameSuggestion {
  ///  The $(ref:DownloadItem)'s new target $(ref:DownloadItem.filename), as a
  /// path
  ///  relative to the user's default Downloads directory, possibly containing
  ///  subdirectories. Absolute paths, empty paths, and paths containing
  ///  back-references ".." will be ignored. `filename` is ignored if
  ///  there are any $(ref:onDeterminingFilename) listeners registered by any
  ///  extensions.
  external String get filename;

  ///  The action to take if `filename` already exists.
  external FilenameConflictAction? get conflictAction;
}

@JS()
@staticInterop
class DownloadOptions {}

extension DownloadOptionsExtension on DownloadOptions {
  ///  The URL to download.
  external String get url;

  ///  A file path relative to the Downloads directory to contain the downloaded
  ///  file, possibly containing subdirectories. Absolute paths, empty paths,
  ///  and paths containing back-references ".." will cause an error.
  ///  $(ref:onDeterminingFilename) allows suggesting a filename after the
  /// file's
  ///  MIME type and a tentative filename have been determined.
  external String? get filename;

  ///  The action to take if `filename` already exists.
  external FilenameConflictAction? get conflictAction;

  ///  Use a file-chooser to allow the user to select a filename regardless of
  ///  whether `filename` is set or already exists.
  external bool? get saveAs;

  ///  The HTTP method to use if the URL uses the HTTP[S] protocol.
  external HttpMethod? get method;

  ///  Extra HTTP headers to send with the request if the URL uses the HTTP[s]
  ///  protocol. Each header is represented as a dictionary containing the keys
  ///  `name` and either `value` or
  ///  `binaryValue`, restricted to those allowed by XMLHttpRequest.
  external JSArray? get headers;

  ///  Post body.
  external String? get body;
}

@JS()
@staticInterop
class DownloadItem {}

extension DownloadItemExtension on DownloadItem {
  ///  An identifier that is persistent across browser sessions.
  external int get id;

  ///  The absolute URL that this download initiated from, before any
  ///  redirects.
  external String get url;

  ///  The absolute URL that this download is being made from, after all
  ///  redirects.
  external String get finalUrl;

  ///  Absolute URL.
  external String get referrer;

  ///  Absolute local path.
  external String get filename;

  ///  False if this download is recorded in the history, true if it is not
  ///  recorded.
  external bool get incognito;

  ///  Indication of whether this download is thought to be safe or known to be
  ///  suspicious.
  external DangerType get danger;

  ///  The file's MIME type.
  external String get mime;

  ///  The time when the download began in ISO 8601 format. May be passed
  ///  directly to the Date constructor: `chrome.downloads.search({},
  ///  function(items){items.forEach(function(item){console.log(new
  ///  Date(item.startTime))})})`
  external String get startTime;

  ///  The time when the download ended in ISO 8601 format. May be passed
  ///  directly to the Date constructor: `chrome.downloads.search({},
  ///  function(items){items.forEach(function(item){if (item.endTime)
  ///  console.log(new Date(item.endTime))})})`
  external String? get endTime;

  ///  Estimated time when the download will complete in ISO 8601 format. May be
  ///  passed directly to the Date constructor:
  ///  `chrome.downloads.search({},
  ///  function(items){items.forEach(function(item){if (item.estimatedEndTime)
  ///  console.log(new Date(item.estimatedEndTime))})})`
  external String? get estimatedEndTime;

  ///  Indicates whether the download is progressing, interrupted, or complete.
  external State get state;

  ///  True if the download has stopped reading data from the host, but kept the
  ///  connection open.
  external bool get paused;

  ///  True if the download is in progress and paused, or else if it is
  ///  interrupted and can be resumed starting from where it was interrupted.
  external bool get canResume;

  ///  Why the download was interrupted. Several kinds of HTTP errors may be
  ///  grouped under one of the errors beginning with `SERVER_`.
  ///  Errors relating to the network begin with `NETWORK_`, errors
  ///  relating to the process of writing the file to the file system begin with
  ///  `FILE_`, and interruptions initiated by the user begin with
  ///  `USER_`.
  external InterruptReason? get error;

  ///  Number of bytes received so far from the host, without considering file
  ///  compression.
  external double get bytesReceived;

  ///  Number of bytes in the whole file, without considering file compression,
  ///  or -1 if unknown.
  external double get totalBytes;

  ///  Number of bytes in the whole file post-decompression, or -1 if unknown.
  external double get fileSize;

  ///  Whether the downloaded file still exists. This information may be out of
  ///  date because Chrome does not automatically watch for file removal. Call
  ///  $(ref:search)() in order to trigger the check for file existence. When
  /// the
  ///  existence check completes, if the file has been deleted, then an
  ///  $(ref:onChanged) event will fire. Note that $(ref:search)() does not wait
  ///  for the existence check to finish before returning, so results from
  ///  $(ref:search)() may not accurately reflect the file system. Also,
  ///  $(ref:search)() may be called as often as necessary, but will not check
  /// for
  ///  file existence any more frequently than once every 10 seconds.
  external bool get exists;

  ///  The identifier for the extension that initiated this download if this
  ///  download was initiated by an extension. Does not change once it is set.
  external String? get byExtensionId;

  ///  The localized name of the extension that initiated this download if this
  ///  download was initiated by an extension. May change if the extension
  ///  changes its name or if the user changes their locale.
  external String? get byExtensionName;
}

@JS()
@staticInterop
class DownloadQuery {}

extension DownloadQueryExtension on DownloadQuery {
  ///  This array of search terms limits results to $(ref:DownloadItem) whose
  ///  `filename` or `url` or `finalUrl`
  ///  contain all of the search terms that do not begin with a dash '-' and
  ///  none of the search terms that do begin with a dash.
  external JSArray? get query;

  ///  Limits results to $(ref:DownloadItem) that
  ///  started before the given ms since the epoch.
  external String? get startedBefore;

  ///  Limits results to $(ref:DownloadItem) that
  ///  started after the given ms since the epoch.
  external String? get startedAfter;

  ///  Limits results to $(ref:DownloadItem) that ended before the given ms
  /// since the
  ///  epoch.
  external String? get endedBefore;

  ///  Limits results to $(ref:DownloadItem) that ended after the given ms since
  /// the
  ///  epoch.
  external String? get endedAfter;

  ///  Limits results to $(ref:DownloadItem) whose
  ///  `totalBytes` is greater than the given integer.
  external double? get totalBytesGreater;

  ///  Limits results to $(ref:DownloadItem) whose
  ///  `totalBytes` is less than the given integer.
  external double? get totalBytesLess;

  ///  Limits results to $(ref:DownloadItem) whose
  ///  `filename` matches the given regular expression.
  external String? get filenameRegex;

  ///  Limits results to $(ref:DownloadItem) whose
  ///  `url` matches the given regular expression.
  external String? get urlRegex;

  ///  Limits results to $(ref:DownloadItem) whose
  ///  `finalUrl` matches the given regular expression.
  external String? get finalUrlRegex;

  ///  The maximum number of matching $(ref:DownloadItem) returned. Defaults to
  ///  1000. Set to 0 in order to return all matching $(ref:DownloadItem). See
  ///  $(ref:search) for how to page through results.
  external int? get limit;

  ///  Set elements of this array to $(ref:DownloadItem) properties in order to
  ///  sort search results. For example, setting
  ///  `orderBy=['startTime']` sorts the $(ref:DownloadItem) by their
  ///  start time in ascending order. To specify descending order, prefix with a
  ///  hyphen: '-startTime'.
  external JSArray? get orderBy;

  ///  The `id` of the $(ref:DownloadItem) to query.
  external int? get id;

  ///  The absolute URL that this download initiated from, before any
  ///  redirects.
  external String? get url;

  ///  The absolute URL that this download is being made from, after all
  ///  redirects.
  external String? get finalUrl;

  ///  Absolute local path.
  external String? get filename;

  ///  Indication of whether this download is thought to be safe or known to be
  ///  suspicious.
  external DangerType? get danger;

  ///  The file's MIME type.
  external String? get mime;

  ///  The time when the download began in ISO 8601 format.
  external String? get startTime;

  ///  The time when the download ended in ISO 8601 format.
  external String? get endTime;

  ///  Indicates whether the download is progressing, interrupted, or complete.
  external State? get state;

  ///  True if the download has stopped reading data from the host, but kept the
  ///  connection open.
  external bool? get paused;

  ///  Why a download was interrupted.
  external InterruptReason? get error;

  ///  Number of bytes received so far from the host, without considering file
  ///  compression.
  external double? get bytesReceived;

  ///  Number of bytes in the whole file, without considering file compression,
  ///  or -1 if unknown.
  external double? get totalBytes;

  ///  Number of bytes in the whole file post-decompression, or -1 if unknown.
  external double? get fileSize;

  ///  Whether the downloaded file exists;
  external bool? get exists;
}

@JS()
@staticInterop
class StringDelta {}

extension StringDeltaExtension on StringDelta {
  external String? get previous;

  external String? get current;
}

@JS()
@staticInterop
class DoubleDelta {}

extension DoubleDeltaExtension on DoubleDelta {
  external double? get previous;

  external double? get current;
}

@JS()
@staticInterop
class BooleanDelta {}

extension BooleanDeltaExtension on BooleanDelta {
  external bool? get previous;

  external bool? get current;
}

@JS()
@staticInterop
class DownloadDelta {}

extension DownloadDeltaExtension on DownloadDelta {
  ///  The `id` of the $(ref:DownloadItem)
  ///  that changed.
  external int get id;

  ///  The change in `url`, if any.
  external StringDelta? get url;

  ///  The change in `finalUrl`, if any.
  external StringDelta? get finalUrl;

  ///  The change in `filename`, if any.
  external StringDelta? get filename;

  ///  The change in `danger`, if any.
  external StringDelta? get danger;

  ///  The change in `mime`, if any.
  external StringDelta? get mime;

  ///  The change in `startTime`, if any.
  external StringDelta? get startTime;

  ///  The change in `endTime`, if any.
  external StringDelta? get endTime;

  ///  The change in `state`, if any.
  external StringDelta? get state;

  ///  The change in `canResume`, if any.
  external BooleanDelta? get canResume;

  ///  The change in `paused`, if any.
  external BooleanDelta? get paused;

  ///  The change in `error`, if any.
  external StringDelta? get error;

  ///  The change in `totalBytes`, if any.
  external DoubleDelta? get totalBytes;

  ///  The change in `fileSize`, if any.
  external DoubleDelta? get fileSize;

  ///  The change in `exists`, if any.
  external BooleanDelta? get exists;
}

@JS()
@staticInterop
class GetFileIconOptions {}

extension GetFileIconOptionsExtension on GetFileIconOptions {
  ///  The size of the returned icon. The icon will be square with dimensions
  ///  size * size pixels. The default and largest size for the icon is 32x32
  ///  pixels. The only supported sizes are 16 and 32. It is an error to specify
  ///  any other size.
  external int? get size;
}

@JS()
@staticInterop
class UiOptions {}

extension UiOptionsExtension on UiOptions {
  ///  Enable or disable the download UI.
  external bool get enabled;
}
