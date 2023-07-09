import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSFileSystemProviderExtension on JSChrome {
  ///  Use the `chrome.fileSystemProvider` API to create file systems,
  ///  that can be accessible from the file manager on Chrome OS.
  external JSFileSystemProvider get FileSystemProvider;
}

@JS()
@staticInterop
class JSFileSystemProvider {}

extension JSFileSystemProviderExtension on JSFileSystemProvider {
  ///  Mounts a file system with the given `fileSystemId` and
  ///  `displayName`. `displayName` will be shown in the
  ///  left panel of the Files app. `displayName` can contain any
  ///  characters including '/', but cannot be an empty string.
  ///  `displayName` must be descriptive but doesn't have to be
  ///  unique. The `fileSystemId` must not be an empty string.
  ///
  ///  Depending on the type of the file system being mounted, the
  ///  `source` option must be set appropriately.
  ///
  ///  In case of an error, $(ref:runtime.lastError) will be set with a
  ///  corresponding error code.
  external void mount();

  ///  Unmounts a file system with the given `fileSystemId`. It
  ///  must be called after $(ref:onUnmountRequested) is invoked. Also,
  ///  the providing extension can decide to perform unmounting if not requested
  ///  (eg. in case of lost connection, or a file error).
  ///
  ///  In case of an error, $(ref:runtime.lastError) will be set with a
  ///  corresponding error code.
  external void unmount();

  ///  Returns all file systems mounted by the extension.
  external void getAll();

  ///  Returns information about a file system with the passed
  ///  `fileSystemId`.
  external void get();

  ///  Notifies about changes in the watched directory at
  ///  `observedPath` in `recursive` mode. If the file
  ///  system is mounted with `supportsNofityTag`, then
  ///  `tag` must be provided, and all changes since the last
  ///  notification always reported, even if the system was shutdown. The last
  ///  tag can be obtained with $(ref:getAll).
  ///
  ///  To use, the `file_system_provider.notify` manifest option
  ///  must be set to true.
  ///
  ///  Value of `tag` can be any string which is unique per call,
  ///  so it's possible to identify the last registered notification. Eg. if
  ///  the providing extension starts after a reboot, and the last registered
  ///  notification's tag is equal to "123", then it should call $(ref:notify)
  ///  for all changes which happened since the change tagged as "123". It
  ///  cannot be an empty string.
  ///
  ///  Not all providers are able to provide a tag, but if the file system has
  ///  a changelog, then the tag can be eg. a change number, or a revision
  ///  number.
  ///
  ///  Note that if a parent directory is removed, then all descendant entries
  ///  are also removed, and if they are watched, then the API must be notified
  ///  about the fact. Also, if a directory is renamed, then all descendant
  ///  entries are in fact removed, as there is no entry under their original
  ///  paths anymore.
  ///
  ///  In case of an error, $(ref:runtime.lastError) will be set
  ///  will a corresponding error code.
  external void notify();

  ///  Raised when unmounting for the file system with the
  ///  `fileSystemId` identifier is requested. In the response, the
  ///  $(ref:unmount) API method must be called together with
  ///  `successCallback`. If unmounting is not possible (eg. due to
  ///  a pending operation), then `errorCallback` must be called.
  external ChromeEvent get onUnmountRequested;

  ///  Raised when metadata of a file or a directory at `entryPath`
  ///  is requested. The metadata must be returned with the
  ///  `successCallback` call. In case of an error,
  ///  `errorCallback` must be called.
  external ChromeEvent get onGetMetadataRequested;

  ///  Raised when a list of actions for a set of files or directories at
  ///  `entryPaths` is requested. All of the returned actions must
  ///  be applicable to each entry. If there are no such actions, an empty array
  ///  should be returned. The actions must be returned with the
  ///  `successCallback` call. In case of an error,
  ///  `errorCallback` must be called.
  external ChromeEvent get onGetActionsRequested;

  ///  Raised when contents of a directory at `directoryPath` are
  ///  requested. The results must be returned in chunks by calling the
  ///  `successCallback` several times. In case of an error,
  ///  `errorCallback` must be called.
  external ChromeEvent get onReadDirectoryRequested;

  ///  Raised when opening a file at `filePath` is requested. If the
  ///  file does not exist, then the operation must fail. Maximum number of
  ///  files opened at once can be specified with `MountOptions`.
  external ChromeEvent get onOpenFileRequested;

  ///  Raised when opening a file previously opened with
  ///  `openRequestId` is requested to be closed.
  external ChromeEvent get onCloseFileRequested;

  ///  Raised when reading contents of a file opened previously with
  ///  `openRequestId` is requested. The results must be returned in
  ///  chunks by calling `successCallback` several times. In case of
  ///  an error, `errorCallback` must be called.
  external ChromeEvent get onReadFileRequested;

  ///  Raised when creating a directory is requested. The operation must fail
  ///  with the EXISTS error if the target directory already exists.
  ///  If `recursive` is true, then all of the missing directories
  ///  on the directory path must be created.
  external ChromeEvent get onCreateDirectoryRequested;

  ///  Raised when deleting an entry is requested. If `recursive` is
  ///  true, and the entry is a directory, then all of the entries inside
  ///  must be recursively deleted as well.
  external ChromeEvent get onDeleteEntryRequested;

  ///  Raised when creating a file is requested. If the file already exists,
  ///  then `errorCallback` must be called with the
  ///  `"EXISTS"` error code.
  external ChromeEvent get onCreateFileRequested;

  ///  Raised when copying an entry (recursively if a directory) is requested.
  ///  If an error occurs, then `errorCallback` must be called.
  external ChromeEvent get onCopyEntryRequested;

  ///  Raised when moving an entry (recursively if a directory) is requested.
  ///  If an error occurs, then `errorCallback` must be called.
  external ChromeEvent get onMoveEntryRequested;

  ///  Raised when truncating a file to a desired length is requested.
  ///  If an error occurs, then `errorCallback` must be called.
  external ChromeEvent get onTruncateRequested;

  ///  Raised when writing contents to a file opened previously with
  ///  `openRequestId` is requested.
  external ChromeEvent get onWriteFileRequested;

  ///  Raised when aborting an operation with `operationRequestId`
  ///  is requested. The operation executed with `operationRequestId`
  ///  must be immediately stopped and `successCallback` of this
  ///  abort request executed. If aborting fails, then
  ///  `errorCallback` must be called. Note, that callbacks of the
  ///  aborted operation must not be called, as they will be ignored. Despite
  ///  calling `errorCallback`, the request may be forcibly aborted.
  external ChromeEvent get onAbortRequested;

  ///  Raised when showing a configuration dialog for `fileSystemId`
  ///  is requested. If it's handled, the
  ///  `file_system_provider.configurable` manfiest option must be
  ///  set to true.
  external ChromeEvent get onConfigureRequested;

  ///  Raised when showing a dialog for mounting a new file system is requested.
  ///  If the extension/app is a file handler, then this event shouldn't be
  ///  handled. Instead `app.runtime.onLaunched` should be handled in
  ///  order to mount new file systems when a file is opened. For multiple
  ///  mounts, the `file_system_provider.multiple_mounts` manifest
  ///  option must be set to true.
  external ChromeEvent get onMountRequested;

  ///  Raised when setting a new directory watcher is requested. If an error
  ///  occurs, then `errorCallback` must be called.
  external ChromeEvent get onAddWatcherRequested;

  ///  Raised when the watcher should be removed. If an error occurs, then
  ///  `errorCallback` must be called.
  external ChromeEvent get onRemoveWatcherRequested;

  ///  Raised when executing an action for a set of files or directories is\
  ///  requested. After the action is completed, `successCallback`
  ///  must be called. On error, `errorCallback` must be called.
  external ChromeEvent get onExecuteActionRequested;
}
