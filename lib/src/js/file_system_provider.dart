import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSFileSystemProviderExtension on JSChrome {
  /// Use the `chrome.fileSystemProvider` API to create file systems,
  /// that can be accessible from the file manager on Chrome OS.
  external JSFileSystemProvider get fileSystemProvider;
}

@JS()
@staticInterop
class JSFileSystemProvider {}

extension JSFileSystemProviderExtension on JSFileSystemProvider {
  /// Mounts a file system with the given `fileSystemId` and
  /// `displayName`. `displayName` will be shown in the
  /// left panel of the Files app. `displayName` can contain any
  /// characters including '/', but cannot be an empty string.
  /// `displayName` must be descriptive but doesn't have to be
  /// unique. The `fileSystemId` must not be an empty string.
  ///
  /// Depending on the type of the file system being mounted, the
  /// `source` option must be set appropriately.
  ///
  /// In case of an error, $(ref:runtime.lastError) will be set with a
  /// corresponding error code.
  external void mount(
    MountOptions options,
    JSFunction callback,
  );

  /// Unmounts a file system with the given `fileSystemId`. It
  /// must be called after $(ref:onUnmountRequested) is invoked. Also,
  /// the providing extension can decide to perform unmounting if not requested
  /// (eg. in case of lost connection, or a file error).
  ///
  /// In case of an error, $(ref:runtime.lastError) will be set with a
  /// corresponding error code.
  external void unmount(
    UnmountOptions options,
    JSFunction callback,
  );

  /// Returns all file systems mounted by the extension.
  external void getAll(JSFunction callback);

  /// Returns information about a file system with the passed
  /// `fileSystemId`.
  external void get(
    String fileSystemId,
    JSFunction callback,
  );

  /// Notifies about changes in the watched directory at
  /// `observedPath` in `recursive` mode. If the file
  /// system is mounted with `supportsNofityTag`, then
  /// `tag` must be provided, and all changes since the last
  /// notification always reported, even if the system was shutdown. The last
  /// tag can be obtained with $(ref:getAll).
  ///
  /// To use, the `file_system_provider.notify` manifest option
  /// must be set to true.
  ///
  /// Value of `tag` can be any string which is unique per call,
  /// so it's possible to identify the last registered notification. Eg. if
  /// the providing extension starts after a reboot, and the last registered
  /// notification's tag is equal to "123", then it should call $(ref:notify)
  /// for all changes which happened since the change tagged as "123". It
  /// cannot be an empty string.
  ///
  /// Not all providers are able to provide a tag, but if the file system has
  /// a changelog, then the tag can be eg. a change number, or a revision
  /// number.
  ///
  /// Note that if a parent directory is removed, then all descendant entries
  /// are also removed, and if they are watched, then the API must be notified
  /// about the fact. Also, if a directory is renamed, then all descendant
  /// entries are in fact removed, as there is no entry under their original
  /// paths anymore.
  ///
  /// In case of an error, $(ref:runtime.lastError) will be set
  /// will a corresponding error code.
  external void notify(
    NotifyOptions options,
    JSFunction callback,
  );

  /// Raised when unmounting for the file system with the
  /// `fileSystemId` identifier is requested. In the response, the
  /// $(ref:unmount) API method must be called together with
  /// `successCallback`. If unmounting is not possible (eg. due to
  /// a pending operation), then `errorCallback` must be called.
  external ChromeEvent get onUnmountRequested;

  /// Raised when metadata of a file or a directory at `entryPath`
  /// is requested. The metadata must be returned with the
  /// `successCallback` call. In case of an error,
  /// `errorCallback` must be called.
  external ChromeEvent get onGetMetadataRequested;

  /// Raised when a list of actions for a set of files or directories at
  /// `entryPaths` is requested. All of the returned actions must
  /// be applicable to each entry. If there are no such actions, an empty array
  /// should be returned. The actions must be returned with the
  /// `successCallback` call. In case of an error,
  /// `errorCallback` must be called.
  external ChromeEvent get onGetActionsRequested;

  /// Raised when contents of a directory at `directoryPath` are
  /// requested. The results must be returned in chunks by calling the
  /// `successCallback` several times. In case of an error,
  /// `errorCallback` must be called.
  external ChromeEvent get onReadDirectoryRequested;

  /// Raised when opening a file at `filePath` is requested. If the
  /// file does not exist, then the operation must fail. Maximum number of
  /// files opened at once can be specified with `MountOptions`.
  external ChromeEvent get onOpenFileRequested;

  /// Raised when opening a file previously opened with
  /// `openRequestId` is requested to be closed.
  external ChromeEvent get onCloseFileRequested;

  /// Raised when reading contents of a file opened previously with
  /// `openRequestId` is requested. The results must be returned in
  /// chunks by calling `successCallback` several times. In case of
  /// an error, `errorCallback` must be called.
  external ChromeEvent get onReadFileRequested;

  /// Raised when creating a directory is requested. The operation must fail
  /// with the EXISTS error if the target directory already exists.
  /// If `recursive` is true, then all of the missing directories
  /// on the directory path must be created.
  external ChromeEvent get onCreateDirectoryRequested;

  /// Raised when deleting an entry is requested. If `recursive` is
  /// true, and the entry is a directory, then all of the entries inside
  /// must be recursively deleted as well.
  external ChromeEvent get onDeleteEntryRequested;

  /// Raised when creating a file is requested. If the file already exists,
  /// then `errorCallback` must be called with the
  /// `"EXISTS"` error code.
  external ChromeEvent get onCreateFileRequested;

  /// Raised when copying an entry (recursively if a directory) is requested.
  /// If an error occurs, then `errorCallback` must be called.
  external ChromeEvent get onCopyEntryRequested;

  /// Raised when moving an entry (recursively if a directory) is requested.
  /// If an error occurs, then `errorCallback` must be called.
  external ChromeEvent get onMoveEntryRequested;

  /// Raised when truncating a file to a desired length is requested.
  /// If an error occurs, then `errorCallback` must be called.
  external ChromeEvent get onTruncateRequested;

  /// Raised when writing contents to a file opened previously with
  /// `openRequestId` is requested.
  external ChromeEvent get onWriteFileRequested;

  /// Raised when aborting an operation with `operationRequestId`
  /// is requested. The operation executed with `operationRequestId`
  /// must be immediately stopped and `successCallback` of this
  /// abort request executed. If aborting fails, then
  /// `errorCallback` must be called. Note, that callbacks of the
  /// aborted operation must not be called, as they will be ignored. Despite
  /// calling `errorCallback`, the request may be forcibly aborted.
  external ChromeEvent get onAbortRequested;

  /// Raised when showing a configuration dialog for `fileSystemId`
  /// is requested. If it's handled, the
  /// `file_system_provider.configurable` manfiest option must be
  /// set to true.
  external ChromeEvent get onConfigureRequested;

  /// Raised when showing a dialog for mounting a new file system is requested.
  /// If the extension/app is a file handler, then this event shouldn't be
  /// handled. Instead `app.runtime.onLaunched` should be handled in
  /// order to mount new file systems when a file is opened. For multiple
  /// mounts, the `file_system_provider.multiple_mounts` manifest
  /// option must be set to true.
  external ChromeEvent get onMountRequested;

  /// Raised when setting a new directory watcher is requested. If an error
  /// occurs, then `errorCallback` must be called.
  external ChromeEvent get onAddWatcherRequested;

  /// Raised when the watcher should be removed. If an error occurs, then
  /// `errorCallback` must be called.
  external ChromeEvent get onRemoveWatcherRequested;

  /// Raised when executing an action for a set of files or directories is\
  /// requested. After the action is completed, `successCallback`
  /// must be called. On error, `errorCallback` must be called.
  external ChromeEvent get onExecuteActionRequested;
}

/// Error codes used by providing extensions in response to requests as well
/// as in case of errors when calling methods of the API. For success,
/// `"OK"` must be used.
typedef ProviderError = JSString;

/// Mode of opening a file. Used by $(ref:onOpenFileRequested).
typedef OpenFileMode = JSString;

/// Type of a change detected on the observed directory.
typedef ChangeType = JSString;

/// List of common actions. `"SHARE"` is for sharing files with
/// others. `"SAVE_FOR_OFFLINE"` for pinning (saving for offline
/// access). `"OFFLINE_NOT_NECESSARY"` for notifying that the file
/// doesn't need to be stored for offline access anymore.
/// Used by $(ref:onGetActionsRequested) and $(ref:onExecuteActionRequested).
typedef CommonActionId = JSString;

@JS()
@staticInterop
class EntryMetadata {}

extension EntryMetadataExtension on EntryMetadata {
  /// True if it is a directory. Must be provided if requested in
  /// `options`.
  external bool? get isDirectory;

  /// Name of this entry (not full path name). Must not contain '/'. For root
  /// it must be empty. Must be provided if requested in `options`.
  external String? get name;

  /// File size in bytes. Must be provided if requested in
  /// `options`.
  external double? get size;

  /// The last modified time of this entry. Must be provided if requested in
  /// `options`.
  external JSObject? get modificationTime;

  /// Mime type for the entry. Always optional, but should be provided if
  /// requested in `options`.
  external String? get mimeType;

  /// Thumbnail image as a data URI in either PNG, JPEG or WEBP format, at most
  /// 32 KB in size. Optional, but can be provided only when explicitly
  /// requested by the $(ref:onGetMetadataRequested) event.
  external String? get thumbnail;
}

@JS()
@staticInterop
class Watcher {}

extension WatcherExtension on Watcher {
  /// The path of the entry being observed.
  external String get entryPath;

  /// Whether watching should include all child entries recursively. It can be
  /// true for directories only.
  external bool get recursive;

  /// Tag used by the last notification for the watcher.
  external String? get lastTag;
}

@JS()
@staticInterop
class OpenedFile {}

extension OpenedFileExtension on OpenedFile {
  /// A request ID to be be used by consecutive read/write and close requests.
  external int get openRequestId;

  /// The path of the opened file.
  external String get filePath;

  /// Whether the file was opened for reading or writing.
  external OpenFileMode get mode;
}

@JS()
@staticInterop
class FileSystemInfo {}

extension FileSystemInfoExtension on FileSystemInfo {
  /// The identifier of the file system.
  external String get fileSystemId;

  /// A human-readable name for the file system.
  external String get displayName;

  /// Whether the file system supports operations which may change contents
  /// of the file system (such as creating, deleting or writing to files).
  external bool get writable;

  /// The maximum number of files that can be opened at once. If 0, then not
  /// limited.
  external int get openedFilesLimit;

  /// List of currently opened files.
  external JSArray get openedFiles;

  /// Whether the file system supports the `tag` field for observing
  /// directories.
  external bool? get supportsNotifyTag;

  /// List of watchers.
  external JSArray get watchers;
}

@JS()
@staticInterop
class MountOptions {}

extension MountOptionsExtension on MountOptions {
  /// The string indentifier of the file system. Must be unique per each
  /// extension.
  external String get fileSystemId;

  /// A human-readable name for the file system.
  external String get displayName;

  /// Whether the file system supports operations which may change contents
  /// of the file system (such as creating, deleting or writing to files).
  external bool? get writable;

  /// The maximum number of files that can be opened at once. If not specified,
  /// or 0, then not limited.
  external int? get openedFilesLimit;

  /// Whether the file system supports the `tag` field for observed
  /// directories.
  external bool? get supportsNotifyTag;

  /// Whether the framework should resume the file system at the next sign-in
  /// session. True by default.
  external bool? get persistent;
}

@JS()
@staticInterop
class UnmountOptions {}

extension UnmountOptionsExtension on UnmountOptions {
  /// The identifier of the file system to be unmounted.
  external String get fileSystemId;
}

@JS()
@staticInterop
class UnmountRequestedOptions {}

extension UnmountRequestedOptionsExtension on UnmountRequestedOptions {
  /// The identifier of the file system to be unmounted.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;
}

@JS()
@staticInterop
class GetMetadataRequestedOptions {}

extension GetMetadataRequestedOptionsExtension on GetMetadataRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The path of the entry to fetch metadata about.
  external String get entryPath;

  /// Set to `true` if `is_directory` value is requested.
  external bool get isDirectory;

  /// Set to `true` if `name` value is requested.
  external bool get name;

  /// Set to `true` if `size` value is requested.
  external bool get size;

  /// Set to `true` if `modificationTime` value is
  /// requested.
  external bool get modificationTime;

  /// Set to `true` if `mimeType` value is requested.
  external bool get mimeType;

  /// Set to `true` if the thumbnail is requested.
  external bool get thumbnail;
}

@JS()
@staticInterop
class GetActionsRequestedOptions {}

extension GetActionsRequestedOptionsExtension on GetActionsRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// List of paths of entries for the list of actions.
  external JSArray get entryPaths;
}

@JS()
@staticInterop
class ReadDirectoryRequestedOptions {}

extension ReadDirectoryRequestedOptionsExtension
    on ReadDirectoryRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The path of the directory which contents are requested.
  external String get directoryPath;

  /// Set to `true` if `is_directory` value is requested.
  external bool get isDirectory;

  /// Set to `true` if `name` value is requested.
  external bool get name;

  /// Set to `true` if `size` value is requested.
  external bool get size;

  /// Set to `true` if `modificationTime` value is
  /// requested.
  external bool get modificationTime;

  /// Set to `true` if `mimeType` value is requested.
  external bool get mimeType;

  /// Set to `true` if the thumbnail is requested.
  external bool get thumbnail;
}

@JS()
@staticInterop
class OpenFileRequestedOptions {}

extension OpenFileRequestedOptionsExtension on OpenFileRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// A request ID which will be used by consecutive read/write and close
  /// requests.
  external int get requestId;

  /// The path of the file to be opened.
  external String get filePath;

  /// Whether the file will be used for reading or writing.
  external OpenFileMode get mode;
}

@JS()
@staticInterop
class CloseFileRequestedOptions {}

extension CloseFileRequestedOptionsExtension on CloseFileRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// A request ID used to open the file.
  external int get openRequestId;
}

@JS()
@staticInterop
class ReadFileRequestedOptions {}

extension ReadFileRequestedOptionsExtension on ReadFileRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// A request ID used to open the file.
  external int get openRequestId;

  /// Position in the file (in bytes) to start reading from.
  external double get offset;

  /// Number of bytes to be returned.
  external double get length;
}

@JS()
@staticInterop
class CreateDirectoryRequestedOptions {}

extension CreateDirectoryRequestedOptionsExtension
    on CreateDirectoryRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The path of the directory to be created.
  external String get directoryPath;

  /// Whether the operation is recursive (for directories only).
  external bool get recursive;
}

@JS()
@staticInterop
class DeleteEntryRequestedOptions {}

extension DeleteEntryRequestedOptionsExtension on DeleteEntryRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The path of the entry to be deleted.
  external String get entryPath;

  /// Whether the operation is recursive (for directories only).
  external bool get recursive;
}

@JS()
@staticInterop
class CreateFileRequestedOptions {}

extension CreateFileRequestedOptionsExtension on CreateFileRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The path of the file to be created.
  external String get filePath;
}

@JS()
@staticInterop
class CopyEntryRequestedOptions {}

extension CopyEntryRequestedOptionsExtension on CopyEntryRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The source path of the entry to be copied.
  external String get sourcePath;

  /// The destination path for the copy operation.
  external String get targetPath;
}

@JS()
@staticInterop
class MoveEntryRequestedOptions {}

extension MoveEntryRequestedOptionsExtension on MoveEntryRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The source path of the entry to be moved into a new place.
  external String get sourcePath;

  /// The destination path for the copy operation.
  external String get targetPath;
}

@JS()
@staticInterop
class TruncateRequestedOptions {}

extension TruncateRequestedOptionsExtension on TruncateRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The path of the file to be truncated.
  external String get filePath;

  /// Number of bytes to be retained after the operation completes.
  external double get length;
}

@JS()
@staticInterop
class WriteFileRequestedOptions {}

extension WriteFileRequestedOptionsExtension on WriteFileRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// A request ID used to open the file.
  external int get openRequestId;

  /// Position in the file (in bytes) to start writing the bytes from.
  external double get offset;

  /// Buffer of bytes to be written to the file.
  external JSArrayBuffer get data;
}

@JS()
@staticInterop
class AbortRequestedOptions {}

extension AbortRequestedOptionsExtension on AbortRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// An ID of the request to be aborted.
  external int get operationRequestId;
}

@JS()
@staticInterop
class AddWatcherRequestedOptions {}

extension AddWatcherRequestedOptionsExtension on AddWatcherRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The path of the entry to be observed.
  external String get entryPath;

  /// Whether observing should include all child entries recursively. It can be
  /// true for directories only.
  external bool get recursive;
}

@JS()
@staticInterop
class RemoveWatcherRequestedOptions {}

extension RemoveWatcherRequestedOptionsExtension
    on RemoveWatcherRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The path of the watched entry.
  external String get entryPath;

  /// Mode of the watcher.
  external bool get recursive;
}

@JS()
@staticInterop
class Action {}

extension ActionExtension on Action {
  /// The identifier of the action. Any string or $(ref:CommonActionId) for
  /// common actions.
  external String get id;

  /// The title of the action. It may be ignored for common actions.
  external String? get title;
}

@JS()
@staticInterop
class ExecuteActionRequestedOptions {}

extension ExecuteActionRequestedOptionsExtension
    on ExecuteActionRequestedOptions {
  /// The identifier of the file system related to this operation.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;

  /// The set of paths of the entries to be used for the action.
  external JSArray get entryPaths;

  /// The identifier of the action to be executed.
  external String get actionId;
}

@JS()
@staticInterop
class Change {}

extension ChangeExtension on Change {
  /// The path of the changed entry.
  external String get entryPath;

  /// The type of the change which happened to the entry.
  external ChangeType get changeType;
}

@JS()
@staticInterop
class NotifyOptions {}

extension NotifyOptionsExtension on NotifyOptions {
  /// The identifier of the file system related to this change.
  external String get fileSystemId;

  /// The path of the observed entry.
  external String get observedPath;

  /// Mode of the observed entry.
  external bool get recursive;

  /// The type of the change which happened to the observed entry. If it is
  /// DELETED, then the observed entry will be automatically removed from the
  /// list of observed entries.
  external ChangeType get changeType;

  /// List of changes to entries within the observed directory (including the
  /// entry itself)
  external JSArray? get changes;

  /// Tag for the notification. Required if the file system was mounted with
  /// the `supportsNotifyTag` option. Note, that this flag is
  /// necessary to provide notifications about changes which changed even
  /// when the system was shutdown.
  external String? get tag;
}

@JS()
@staticInterop
class ConfigureRequestedOptions {}

extension ConfigureRequestedOptionsExtension on ConfigureRequestedOptions {
  /// The identifier of the file system to be configured.
  external String get fileSystemId;

  /// The unique identifier of this request.
  external int get requestId;
}
