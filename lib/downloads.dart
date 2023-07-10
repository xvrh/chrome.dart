import 'chrome.dart';
export 'chrome.dart';

final _downloads = ChromeDownloads._();

extension ChromeChromeDownloadsExtension on Chrome {
  ChromeDownloads get downloads => _downloads;
}

class ChromeDownloads {
  ChromeDownloads._();

  /// Download a URL. If the URL uses the HTTP[S] protocol, then the request
  /// will include all cookies currently set for its hostname. If both
  /// `filename` and `saveAs` are specified, then the
  /// Save As dialog will be displayed, pre-populated with the specified
  /// `filename`. If the download started successfully,
  /// `callback` will be called with the new $(ref:DownloadItem)'s
  /// `downloadId`. If there was an error starting the download,
  /// then `callback` will be called with
  /// `downloadId=undefined` and $(ref:runtime.lastError) will contain
  /// a descriptive string. The error strings are not guaranteed to remain
  /// backwards compatible between releases. Extensions must not parse it.
  /// |options|: What to download and how.
  /// |callback|: Called with the id of the new $(ref:DownloadItem).
  void download(options) => throw UnimplementedError();

  /// Find $(ref:DownloadItem). Set `query` to the empty object to get
  /// all $(ref:DownloadItem). To get a specific $(ref:DownloadItem), set only
  /// the
  /// `id` field. To page through a large number of items, set
  /// `orderBy: ['-startTime']`, set `limit` to the
  /// number of items per page, and set `startedAfter` to the
  /// `startTime` of the last item from the last page.
  void search(query) => throw UnimplementedError();

  /// Pause the download. If the request was successful the download is in a
  /// paused state. Otherwise $(ref:runtime.lastError) contains an error
  /// message.
  /// The request will fail if the download is not active.
  /// |downloadId|: The id of the download to pause.
  /// |callback|: Called when the pause request is completed.
  void pause(downloadId) => throw UnimplementedError();

  /// Resume a paused download. If the request was successful the download is
  /// in progress and unpaused. Otherwise $(ref:runtime.lastError) contains an
  /// error message. The request will fail if the download is not active.
  /// |downloadId|: The id of the download to resume.
  /// |callback|: Called when the resume request is completed.
  void resume(downloadId) => throw UnimplementedError();

  /// Cancel a download. When `callback` is run, the download is
  /// cancelled, completed, interrupted or doesn't exist anymore.
  /// |downloadId|: The id of the download to cancel.
  /// |callback|: Called when the cancel request is completed.
  void cancel(downloadId) => throw UnimplementedError();

  /// Retrieve an icon for the specified download. For new downloads, file
  /// icons are available after the $(ref:onCreated) event has been received.
  /// The
  /// image returned by this function while a download is in progress may be
  /// different from the image returned after the download is complete. Icon
  /// retrieval is done by querying the underlying operating system or toolkit
  /// depending on the platform. The icon that is returned will therefore
  /// depend on a number of factors including state of the download, platform,
  /// registered file types and visual theme. If a file icon cannot be
  /// determined, $(ref:runtime.lastError) will contain an error message.
  /// |downloadId|: The identifier for the download.
  /// |callback|: A URL to an image that represents the download.
  void getFileIcon(
    downloadId,
    options,
  ) =>
      throw UnimplementedError();

  /// Open the downloaded file now if the $(ref:DownloadItem) is complete;
  /// otherwise returns an error through $(ref:runtime.lastError). Requires the
  /// `"downloads.open"` permission in addition to the
  /// `"downloads"` permission. An $(ref:onChanged) event will fire
  /// when the item is opened for the first time.
  /// |downloadId|: The identifier for the downloaded file.
  void open(downloadId) => throw UnimplementedError();

  /// Show the downloaded file in its folder in a file manager.
  /// |downloadId|: The identifier for the downloaded file.
  void show(downloadId) => throw UnimplementedError();

  /// Show the default Downloads folder in a file manager.
  void showDefaultFolder() => throw UnimplementedError();

  /// Erase matching $(ref:DownloadItem) from history without deleting the
  /// downloaded file. An $(ref:onErased) event will fire for each
  /// $(ref:DownloadItem) that matches `query`, then
  /// `callback` will be called.
  void erase(query) => throw UnimplementedError();

  /// Remove the downloaded file if it exists and the $(ref:DownloadItem) is
  /// complete; otherwise return an error through $(ref:runtime.lastError).
  void removeFile(downloadId) => throw UnimplementedError();

  /// Prompt the user to accept a dangerous download. Can only be called from a
  /// visible context (tab, window, or page/browser action popup). Does not
  /// automatically accept dangerous downloads. If the download is accepted,
  /// then an $(ref:onChanged) event will fire, otherwise nothing will happen.
  /// When all the data is fetched into a temporary file and either the
  /// download is not dangerous or the danger has been accepted, then the
  /// temporary file is renamed to the target filename, the |state| changes to
  /// 'complete', and $(ref:onChanged) fires.
  /// |downloadId|: The identifier for the $(ref:DownloadItem).
  /// |callback|: Called when the danger prompt dialog closes.
  void acceptDanger(downloadId) => throw UnimplementedError();

  /// Enable or disable the gray shelf at the bottom of every window associated
  /// with the current browser profile. The shelf will be disabled as long as
  /// at least one extension has disabled it. Enabling the shelf while at least
  /// one other extension has disabled it will return an error through
  /// $(ref:runtime.lastError). Requires the `"downloads.shelf"`
  /// permission in addition to the `"downloads"` permission.
  void setShelfEnabled(enabled) => throw UnimplementedError();

  /// Change the download UI of every window associated with the current
  /// browser profile. As long as at least one extension has set
  /// $(ref:UiOptions.enabled) to false, the download UI will be hidden.
  /// Setting $(ref:UiOptions.enabled) to true while at least one other
  /// extension has disabled it will return an error through
  /// $(ref:runtime.lastError). Requires the `"downloads.ui"`
  /// permission in addition to the `"downloads"` permission.
  /// |options|: Encapsulate a change to the download UI.
  /// |callback|: Called when the UI update is completed.
  void setUiOptions(options) => throw UnimplementedError();

  /// This event fires with the $(ref:DownloadItem) object when a download
  /// begins.
  Stream get onCreated => throw UnimplementedError();

  /// Fires with the `downloadId` when a download is erased from
  /// history.
  /// |downloadId|: The `id` of the $(ref:DownloadItem) that was
  /// erased.
  Stream get onErased => throw UnimplementedError();

  /// When any of a $(ref:DownloadItem)'s properties except
  /// `bytesReceived` and `estimatedEndTime` changes,
  /// this event fires with the `downloadId` and an object
  /// containing the properties that changed.
  Stream get onChanged => throw UnimplementedError();

  /// During the filename determination process, extensions will be given the
  /// opportunity to override the target $(ref:DownloadItem.filename). Each
  /// extension may not register more than one listener for this event. Each
  /// listener must call `suggest` exactly once, either
  /// synchronously or asynchronously. If the listener calls
  /// `suggest` asynchronously, then it must return
  /// `true`. If the listener neither calls `suggest`
  /// synchronously nor returns `true`, then `suggest`
  /// will be called automatically. The $(ref:DownloadItem) will not complete
  /// until all listeners have called `suggest`. Listeners may call
  /// `suggest` without any arguments in order to allow the download
  /// to use `downloadItem.filename` for its filename, or pass a
  /// `suggestion` object to `suggest` in order to
  /// override the target filename. If more than one extension overrides the
  /// filename, then the last extension installed whose listener passes a
  /// `suggestion` object to `suggest` wins. In order to
  /// avoid confusion regarding which extension will win, users should not
  /// install extensions that may conflict. If the download is initiated by
  /// $(ref:download) and the target filename is known before the MIME type and
  /// tentative filename have been determined, pass `filename` to
  /// $(ref:download) instead.
  Stream get onDeterminingFilename => throw UnimplementedError();
}

/// <dl><dt>uniquify</dt>
///     <dd>To avoid duplication, the `filename` is changed to
///     include a counter before the filename extension.</dd>
///     <dt>overwrite</dt>
///     <dd>The existing file will be overwritten with the new file.</dd>
///     <dt>prompt</dt>
///     <dd>The user will be prompted with a file chooser dialog.</dd>
/// </dl>
enum FilenameConflictAction {
  uniquify('uniquify'),
  overwrite('overwrite'),
  prompt('prompt');

  const FilenameConflictAction(this.value);

  final String value;
}

enum HttpMethod {
  get('GET'),
  post('POST');

  const HttpMethod(this.value);

  final String value;
}

enum InterruptReason {
  fileFailed('FILE_FAILED'),
  fileAccessDenied('FILE_ACCESS_DENIED'),
  fileNoSpace('FILE_NO_SPACE'),
  fileNameTooLong('FILE_NAME_TOO_LONG'),
  fileTooLarge('FILE_TOO_LARGE'),
  fileVirusInfected('FILE_VIRUS_INFECTED'),
  fileTransientError('FILE_TRANSIENT_ERROR'),
  fileBlocked('FILE_BLOCKED'),
  fileSecurityCheckFailed('FILE_SECURITY_CHECK_FAILED'),
  fileTooShort('FILE_TOO_SHORT'),
  fileHashMismatch('FILE_HASH_MISMATCH'),
  fileSameAsSource('FILE_SAME_AS_SOURCE'),
  networkFailed('NETWORK_FAILED'),
  networkTimeout('NETWORK_TIMEOUT'),
  networkDisconnected('NETWORK_DISCONNECTED'),
  networkServerDown('NETWORK_SERVER_DOWN'),
  networkInvalidRequest('NETWORK_INVALID_REQUEST'),
  serverFailed('SERVER_FAILED'),
  serverNoRange('SERVER_NO_RANGE'),
  serverBadContent('SERVER_BAD_CONTENT'),
  serverUnauthorized('SERVER_UNAUTHORIZED'),
  serverCertProblem('SERVER_CERT_PROBLEM'),
  serverForbidden('SERVER_FORBIDDEN'),
  serverUnreachable('SERVER_UNREACHABLE'),
  serverContentLengthMismatch('SERVER_CONTENT_LENGTH_MISMATCH'),
  serverCrossOriginRedirect('SERVER_CROSS_ORIGIN_REDIRECT'),
  userCanceled('USER_CANCELED'),
  userShutdown('USER_SHUTDOWN'),
  crash('CRASH');

  const InterruptReason(this.value);

  final String value;
}

/// <dl><dt>file</dt>
///     <dd>The download's filename is suspicious.</dd>
///     <dt>url</dt>
///     <dd>The download's URL is known to be malicious.</dd>
///     <dt>content</dt>
///     <dd>The downloaded file is known to be malicious.</dd>
///     <dt>uncommon</dt>
///     <dd>The download's URL is not commonly downloaded and could be
///     dangerous.</dd>
///     <dt>host</dt>
///     <dd>The download came from a host known to distribute malicious
///     binaries and is likely dangerous.</dd>
///     <dt>unwanted</dt>
///     <dd>The download is potentially unwanted or unsafe. E.g. it could make
///     changes to browser or computer settings.</dd>
///     <dt>safe</dt>
///     <dd>The download presents no known danger to the user's computer.</dd>
///     <dt>accepted</dt>
///     <dd>The user has accepted the dangerous download.</dd>
/// </dl>
enum DangerType {
  file('file'),
  url('url'),
  content('content'),
  uncommon('uncommon'),
  host('host'),
  unwanted('unwanted'),
  safe('safe'),
  accepted('accepted'),
  allowlistedByPolicy('allowlistedByPolicy'),
  asyncScanning('asyncScanning'),
  passwordProtected('passwordProtected'),
  blockedTooLarge('blockedTooLarge'),
  sensitiveContentWarning('sensitiveContentWarning'),
  sensitiveContentBlock('sensitiveContentBlock'),
  unsupportedFileType('unsupportedFileType'),
  deepScannedSafe('deepScannedSafe'),
  deepScannedOpenedDangerous('deepScannedOpenedDangerous'),
  promptForScaning('promptForScaning'),
  accountCompromise('accountCompromise');

  const DangerType(this.value);

  final String value;
}

/// <dl><dt>in_progress</dt>
///     <dd>The download is currently receiving data from the server.</dd>
///     <dt>interrupted</dt>
///     <dd>An error broke the connection with the file host.</dd>
///     <dt>complete</dt>
///     <dd>The download completed successfully.</dd>
/// </dl>
enum State {
  inProgress('in_progress'),
  interrupted('interrupted'),
  complete('complete');

  const State(this.value);

  final String value;
}
