import 'src/internal_helpers.dart';
import 'dart:typed_data';
import 'src/js/file_system_provider.dart' as $js;
export 'chrome.dart';

final _fileSystemProvider = ChromeFileSystemProvider._();

extension ChromeFileSystemProviderExtension on Chrome {
  ChromeFileSystemProvider get fileSystemProvider => _fileSystemProvider;
}

class ChromeFileSystemProvider {
  ChromeFileSystemProvider._();

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
  /// In case of an error, [runtime.lastError] will be set with a
  /// corresponding error code.
  Future<void> mount(MountOptions options) => throw UnimplementedError();

  /// Unmounts a file system with the given `fileSystemId`. It
  /// must be called after [onUnmountRequested] is invoked. Also,
  /// the providing extension can decide to perform unmounting if not requested
  /// (eg. in case of lost connection, or a file error).
  ///
  /// In case of an error, [runtime.lastError] will be set with a
  /// corresponding error code.
  Future<void> unmount(UnmountOptions options) => throw UnimplementedError();

  /// Returns all file systems mounted by the extension.
  Future<List<FileSystemInfo>> getAll() => throw UnimplementedError();

  /// Returns information about a file system with the passed
  /// `fileSystemId`.
  Future<FileSystemInfo> get(String fileSystemId) => throw UnimplementedError();

  /// Notifies about changes in the watched directory at
  /// `observedPath` in `recursive` mode. If the file
  /// system is mounted with `supportsNofityTag`, then
  /// `tag` must be provided, and all changes since the last
  /// notification always reported, even if the system was shutdown. The last
  /// tag can be obtained with [getAll].
  ///
  /// To use, the `file_system_provider.notify` manifest option
  /// must be set to true.
  ///
  /// Value of `tag` can be any string which is unique per call,
  /// so it's possible to identify the last registered notification. Eg. if
  /// the providing extension starts after a reboot, and the last registered
  /// notification's tag is equal to "123", then it should call [notify]
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
  /// In case of an error, [runtime.lastError] will be set
  /// will a corresponding error code.
  Future<void> notify(NotifyOptions options) => throw UnimplementedError();

  /// Raised when unmounting for the file system with the
  /// `fileSystemId` identifier is requested. In the response, the
  /// [unmount] API method must be called together with
  /// `successCallback`. If unmounting is not possible (eg. due to
  /// a pending operation), then `errorCallback` must be called.
  Stream<OnUnmountRequestedEvent> get onUnmountRequested =>
      throw UnimplementedError();

  /// Raised when metadata of a file or a directory at `entryPath`
  /// is requested. The metadata must be returned with the
  /// `successCallback` call. In case of an error,
  /// `errorCallback` must be called.
  Stream<OnGetMetadataRequestedEvent> get onGetMetadataRequested =>
      throw UnimplementedError();

  /// Raised when a list of actions for a set of files or directories at
  /// `entryPaths` is requested. All of the returned actions must
  /// be applicable to each entry. If there are no such actions, an empty array
  /// should be returned. The actions must be returned with the
  /// `successCallback` call. In case of an error,
  /// `errorCallback` must be called.
  Stream<OnGetActionsRequestedEvent> get onGetActionsRequested =>
      throw UnimplementedError();

  /// Raised when contents of a directory at `directoryPath` are
  /// requested. The results must be returned in chunks by calling the
  /// `successCallback` several times. In case of an error,
  /// `errorCallback` must be called.
  Stream<OnReadDirectoryRequestedEvent> get onReadDirectoryRequested =>
      throw UnimplementedError();

  /// Raised when opening a file at `filePath` is requested. If the
  /// file does not exist, then the operation must fail. Maximum number of
  /// files opened at once can be specified with `MountOptions`.
  Stream<OnOpenFileRequestedEvent> get onOpenFileRequested =>
      throw UnimplementedError();

  /// Raised when opening a file previously opened with
  /// `openRequestId` is requested to be closed.
  Stream<OnCloseFileRequestedEvent> get onCloseFileRequested =>
      throw UnimplementedError();

  /// Raised when reading contents of a file opened previously with
  /// `openRequestId` is requested. The results must be returned in
  /// chunks by calling `successCallback` several times. In case of
  /// an error, `errorCallback` must be called.
  Stream<OnReadFileRequestedEvent> get onReadFileRequested =>
      throw UnimplementedError();

  /// Raised when creating a directory is requested. The operation must fail
  /// with the EXISTS error if the target directory already exists.
  /// If `recursive` is true, then all of the missing directories
  /// on the directory path must be created.
  Stream<OnCreateDirectoryRequestedEvent> get onCreateDirectoryRequested =>
      throw UnimplementedError();

  /// Raised when deleting an entry is requested. If `recursive` is
  /// true, and the entry is a directory, then all of the entries inside
  /// must be recursively deleted as well.
  Stream<OnDeleteEntryRequestedEvent> get onDeleteEntryRequested =>
      throw UnimplementedError();

  /// Raised when creating a file is requested. If the file already exists,
  /// then `errorCallback` must be called with the
  /// `"EXISTS"` error code.
  Stream<OnCreateFileRequestedEvent> get onCreateFileRequested =>
      throw UnimplementedError();

  /// Raised when copying an entry (recursively if a directory) is requested.
  /// If an error occurs, then `errorCallback` must be called.
  Stream<OnCopyEntryRequestedEvent> get onCopyEntryRequested =>
      throw UnimplementedError();

  /// Raised when moving an entry (recursively if a directory) is requested.
  /// If an error occurs, then `errorCallback` must be called.
  Stream<OnMoveEntryRequestedEvent> get onMoveEntryRequested =>
      throw UnimplementedError();

  /// Raised when truncating a file to a desired length is requested.
  /// If an error occurs, then `errorCallback` must be called.
  Stream<OnTruncateRequestedEvent> get onTruncateRequested =>
      throw UnimplementedError();

  /// Raised when writing contents to a file opened previously with
  /// `openRequestId` is requested.
  Stream<OnWriteFileRequestedEvent> get onWriteFileRequested =>
      throw UnimplementedError();

  /// Raised when aborting an operation with `operationRequestId`
  /// is requested. The operation executed with `operationRequestId`
  /// must be immediately stopped and `successCallback` of this
  /// abort request executed. If aborting fails, then
  /// `errorCallback` must be called. Note, that callbacks of the
  /// aborted operation must not be called, as they will be ignored. Despite
  /// calling `errorCallback`, the request may be forcibly aborted.
  Stream<OnAbortRequestedEvent> get onAbortRequested =>
      throw UnimplementedError();

  /// Raised when showing a configuration dialog for `fileSystemId`
  /// is requested. If it's handled, the
  /// `file_system_provider.configurable` manfiest option must be
  /// set to true.
  Stream<OnConfigureRequestedEvent> get onConfigureRequested =>
      throw UnimplementedError();

  /// Raised when showing a dialog for mounting a new file system is requested.
  /// If the extension/app is a file handler, then this event shouldn't be
  /// handled. Instead `app.runtime.onLaunched` should be handled in
  /// order to mount new file systems when a file is opened. For multiple
  /// mounts, the `file_system_provider.multiple_mounts` manifest
  /// option must be set to true.
  Stream<OnMountRequestedEvent> get onMountRequested =>
      throw UnimplementedError();

  /// Raised when setting a new directory watcher is requested. If an error
  /// occurs, then `errorCallback` must be called.
  Stream<OnAddWatcherRequestedEvent> get onAddWatcherRequested =>
      throw UnimplementedError();

  /// Raised when the watcher should be removed. If an error occurs, then
  /// `errorCallback` must be called.
  Stream<OnRemoveWatcherRequestedEvent> get onRemoveWatcherRequested =>
      throw UnimplementedError();

  /// Raised when executing an action for a set of files or directories is\
  /// requested. After the action is completed, `successCallback`
  /// must be called. On error, `errorCallback` must be called.
  Stream<OnExecuteActionRequestedEvent> get onExecuteActionRequested =>
      throw UnimplementedError();
}

/// Error codes used by providing extensions in response to requests as well
/// as in case of errors when calling methods of the API. For success,
/// `"OK"` must be used.
enum ProviderError {
  ok('OK'),
  failed('FAILED'),
  inUse('IN_USE'),
  exists('EXISTS'),
  notFound('NOT_FOUND'),
  accessDenied('ACCESS_DENIED'),
  tooManyOpened('TOO_MANY_OPENED'),
  noMemory('NO_MEMORY'),
  noSpace('NO_SPACE'),
  notADirectory('NOT_A_DIRECTORY'),
  invalidOperation('INVALID_OPERATION'),
  security('SECURITY'),
  abort('ABORT'),
  notAFile('NOT_A_FILE'),
  notEmpty('NOT_EMPTY'),
  invalidUrl('INVALID_URL'),
  io('IO');

  const ProviderError(this.value);

  final String value;

  String get toJS => value;
  static ProviderError fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Mode of opening a file. Used by [onOpenFileRequested].
enum OpenFileMode {
  read('READ'),
  write('WRITE');

  const OpenFileMode(this.value);

  final String value;

  String get toJS => value;
  static OpenFileMode fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Type of a change detected on the observed directory.
enum ChangeType {
  changed('CHANGED'),
  deleted('DELETED');

  const ChangeType(this.value);

  final String value;

  String get toJS => value;
  static ChangeType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// List of common actions. `"SHARE"` is for sharing files with
/// others. `"SAVE_FOR_OFFLINE"` for pinning (saving for offline
/// access). `"OFFLINE_NOT_NECESSARY"` for notifying that the file
/// doesn't need to be stored for offline access anymore.
/// Used by [onGetActionsRequested] and [onExecuteActionRequested].
enum CommonActionId {
  saveForOffline('SAVE_FOR_OFFLINE'),
  offlineNotNecessary('OFFLINE_NOT_NECESSARY'),
  share('SHARE');

  const CommonActionId(this.value);

  final String value;

  String get toJS => value;
  static CommonActionId fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Callback to be called by the providing extension in case of a success.
typedef ProviderSuccessCallback = void Function();

/// Callback to be called by the providing extension in case of an error.
/// Any error code is allowed except `OK`.
typedef ProviderErrorCallback = void Function(ProviderError);

/// Success callback for the [onGetMetadataRequested] event.
typedef MetadataCallback = void Function(EntryMetadata);

/// Success callback for the [onGetActionsRequested] event.
typedef ActionsCallback = void Function(List<Action>);

/// Success callback for the [onReadDirectoryRequested] event. If more
/// entries will be returned, then `hasMore` must be true, and it
/// has to be called again with additional entries. If no more entries are
/// available, then `hasMore` must be set to false.
typedef EntriesCallback = void Function(
  List<EntryMetadata>,
  bool,
);

/// Success callback for the [onReadFileRequested] event. If more
/// data will be returned, then `hasMore` must be true, and it
/// has to be called again with additional entries. If no more data is
/// available, then `hasMore` must be set to false.
typedef FileDataCallback = void Function(
  ByteBuffer,
  bool,
);

class EntryMetadata {
  EntryMetadata.fromJS(this._wrapped);

  final $js.EntryMetadata _wrapped;

  $js.EntryMetadata get toJS => _wrapped;

  /// True if it is a directory. Must be provided if requested in
  /// `options`.
  bool? get isDirectory => _wrapped.isDirectory;
  set isDirectory(bool? v) {
    _wrapped.isDirectory = v;
  }

  /// Name of this entry (not full path name). Must not contain '/'. For root
  /// it must be empty. Must be provided if requested in `options`.
  String? get name => _wrapped.name;
  set name(String? v) {
    _wrapped.name = v;
  }

  /// File size in bytes. Must be provided if requested in
  /// `options`.
  double? get size => _wrapped.size;
  set size(double? v) {
    _wrapped.size = v;
  }

  /// The last modified time of this entry. Must be provided if requested in
  /// `options`.
  JSAny? get modificationTime => _wrapped.modificationTime;
  set modificationTime(JSAny? v) {
    _wrapped.modificationTime = v;
  }

  /// Mime type for the entry. Always optional, but should be provided if
  /// requested in `options`.
  String? get mimeType => _wrapped.mimeType;
  set mimeType(String? v) {
    _wrapped.mimeType = v;
  }

  /// Thumbnail image as a data URI in either PNG, JPEG or WEBP format, at most
  /// 32 KB in size. Optional, but can be provided only when explicitly
  /// requested by the [onGetMetadataRequested] event.
  String? get thumbnail => _wrapped.thumbnail;
  set thumbnail(String? v) {
    _wrapped.thumbnail = v;
  }
}

class Watcher {
  Watcher.fromJS(this._wrapped);

  final $js.Watcher _wrapped;

  $js.Watcher get toJS => _wrapped;

  /// The path of the entry being observed.
  String get entryPath => _wrapped.entryPath;
  set entryPath(String v) {
    _wrapped.entryPath = v;
  }

  /// Whether watching should include all child entries recursively. It can be
  /// true for directories only.
  bool get recursive => _wrapped.recursive;
  set recursive(bool v) {
    _wrapped.recursive = v;
  }

  /// Tag used by the last notification for the watcher.
  String? get lastTag => _wrapped.lastTag;
  set lastTag(String? v) {
    _wrapped.lastTag = v;
  }
}

class OpenedFile {
  OpenedFile.fromJS(this._wrapped);

  final $js.OpenedFile _wrapped;

  $js.OpenedFile get toJS => _wrapped;

  /// A request ID to be be used by consecutive read/write and close requests.
  int get openRequestId => _wrapped.openRequestId;
  set openRequestId(int v) {
    _wrapped.openRequestId = v;
  }

  /// The path of the opened file.
  String get filePath => _wrapped.filePath;
  set filePath(String v) {
    _wrapped.filePath = v;
  }

  /// Whether the file was opened for reading or writing.
  OpenFileMode get mode => OpenFileMode.fromJS(_wrapped.mode);
  set mode(OpenFileMode v) {
    _wrapped.mode = v.toJS;
  }
}

class FileSystemInfo {
  FileSystemInfo.fromJS(this._wrapped);

  final $js.FileSystemInfo _wrapped;

  $js.FileSystemInfo get toJS => _wrapped;

  /// The identifier of the file system.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// A human-readable name for the file system.
  String get displayName => _wrapped.displayName;
  set displayName(String v) {
    _wrapped.displayName = v;
  }

  /// Whether the file system supports operations which may change contents
  /// of the file system (such as creating, deleting or writing to files).
  bool get writable => _wrapped.writable;
  set writable(bool v) {
    _wrapped.writable = v;
  }

  /// The maximum number of files that can be opened at once. If 0, then not
  /// limited.
  int get openedFilesLimit => _wrapped.openedFilesLimit;
  set openedFilesLimit(int v) {
    _wrapped.openedFilesLimit = v;
  }

  /// List of currently opened files.
  List<OpenedFile> get openedFiles => _wrapped.openedFiles.toDart
      .cast<$js.OpenedFile>()
      .map((e) => OpenedFile.fromJS(e))
      .toList();
  set openedFiles(List<OpenedFile> v) {
    _wrapped.openedFiles = throw UnimplementedError();
  }

  /// Whether the file system supports the `tag` field for observing
  /// directories.
  bool? get supportsNotifyTag => _wrapped.supportsNotifyTag;
  set supportsNotifyTag(bool? v) {
    _wrapped.supportsNotifyTag = v;
  }

  /// List of watchers.
  List<Watcher> get watchers => _wrapped.watchers.toDart
      .cast<$js.Watcher>()
      .map((e) => Watcher.fromJS(e))
      .toList();
  set watchers(List<Watcher> v) {
    _wrapped.watchers = throw UnimplementedError();
  }
}

class MountOptions {
  MountOptions.fromJS(this._wrapped);

  final $js.MountOptions _wrapped;

  $js.MountOptions get toJS => _wrapped;

  /// The string indentifier of the file system. Must be unique per each
  /// extension.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// A human-readable name for the file system.
  String get displayName => _wrapped.displayName;
  set displayName(String v) {
    _wrapped.displayName = v;
  }

  /// Whether the file system supports operations which may change contents
  /// of the file system (such as creating, deleting or writing to files).
  bool? get writable => _wrapped.writable;
  set writable(bool? v) {
    _wrapped.writable = v;
  }

  /// The maximum number of files that can be opened at once. If not specified,
  /// or 0, then not limited.
  int? get openedFilesLimit => _wrapped.openedFilesLimit;
  set openedFilesLimit(int? v) {
    _wrapped.openedFilesLimit = v;
  }

  /// Whether the file system supports the `tag` field for observed
  /// directories.
  bool? get supportsNotifyTag => _wrapped.supportsNotifyTag;
  set supportsNotifyTag(bool? v) {
    _wrapped.supportsNotifyTag = v;
  }

  /// Whether the framework should resume the file system at the next sign-in
  /// session. True by default.
  bool? get persistent => _wrapped.persistent;
  set persistent(bool? v) {
    _wrapped.persistent = v;
  }
}

class UnmountOptions {
  UnmountOptions.fromJS(this._wrapped);

  final $js.UnmountOptions _wrapped;

  $js.UnmountOptions get toJS => _wrapped;

  /// The identifier of the file system to be unmounted.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }
}

class UnmountRequestedOptions {
  UnmountRequestedOptions.fromJS(this._wrapped);

  final $js.UnmountRequestedOptions _wrapped;

  $js.UnmountRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system to be unmounted.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }
}

class GetMetadataRequestedOptions {
  GetMetadataRequestedOptions.fromJS(this._wrapped);

  final $js.GetMetadataRequestedOptions _wrapped;

  $js.GetMetadataRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The path of the entry to fetch metadata about.
  String get entryPath => _wrapped.entryPath;
  set entryPath(String v) {
    _wrapped.entryPath = v;
  }

  /// Set to `true` if `is_directory` value is requested.
  bool get isDirectory => _wrapped.isDirectory;
  set isDirectory(bool v) {
    _wrapped.isDirectory = v;
  }

  /// Set to `true` if `name` value is requested.
  bool get name => _wrapped.name;
  set name(bool v) {
    _wrapped.name = v;
  }

  /// Set to `true` if `size` value is requested.
  bool get size => _wrapped.size;
  set size(bool v) {
    _wrapped.size = v;
  }

  /// Set to `true` if `modificationTime` value is
  /// requested.
  bool get modificationTime => _wrapped.modificationTime;
  set modificationTime(bool v) {
    _wrapped.modificationTime = v;
  }

  /// Set to `true` if `mimeType` value is requested.
  bool get mimeType => _wrapped.mimeType;
  set mimeType(bool v) {
    _wrapped.mimeType = v;
  }

  /// Set to `true` if the thumbnail is requested.
  bool get thumbnail => _wrapped.thumbnail;
  set thumbnail(bool v) {
    _wrapped.thumbnail = v;
  }
}

class GetActionsRequestedOptions {
  GetActionsRequestedOptions.fromJS(this._wrapped);

  final $js.GetActionsRequestedOptions _wrapped;

  $js.GetActionsRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// List of paths of entries for the list of actions.
  List<String> get entryPaths =>
      _wrapped.entryPaths.toDart.cast<String>().map((e) => e).toList();
  set entryPaths(List<String> v) {
    _wrapped.entryPaths = throw UnimplementedError();
  }
}

class ReadDirectoryRequestedOptions {
  ReadDirectoryRequestedOptions.fromJS(this._wrapped);

  final $js.ReadDirectoryRequestedOptions _wrapped;

  $js.ReadDirectoryRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The path of the directory which contents are requested.
  String get directoryPath => _wrapped.directoryPath;
  set directoryPath(String v) {
    _wrapped.directoryPath = v;
  }

  /// Set to `true` if `is_directory` value is requested.
  bool get isDirectory => _wrapped.isDirectory;
  set isDirectory(bool v) {
    _wrapped.isDirectory = v;
  }

  /// Set to `true` if `name` value is requested.
  bool get name => _wrapped.name;
  set name(bool v) {
    _wrapped.name = v;
  }

  /// Set to `true` if `size` value is requested.
  bool get size => _wrapped.size;
  set size(bool v) {
    _wrapped.size = v;
  }

  /// Set to `true` if `modificationTime` value is
  /// requested.
  bool get modificationTime => _wrapped.modificationTime;
  set modificationTime(bool v) {
    _wrapped.modificationTime = v;
  }

  /// Set to `true` if `mimeType` value is requested.
  bool get mimeType => _wrapped.mimeType;
  set mimeType(bool v) {
    _wrapped.mimeType = v;
  }

  /// Set to `true` if the thumbnail is requested.
  bool get thumbnail => _wrapped.thumbnail;
  set thumbnail(bool v) {
    _wrapped.thumbnail = v;
  }
}

class OpenFileRequestedOptions {
  OpenFileRequestedOptions.fromJS(this._wrapped);

  final $js.OpenFileRequestedOptions _wrapped;

  $js.OpenFileRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// A request ID which will be used by consecutive read/write and close
  /// requests.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The path of the file to be opened.
  String get filePath => _wrapped.filePath;
  set filePath(String v) {
    _wrapped.filePath = v;
  }

  /// Whether the file will be used for reading or writing.
  OpenFileMode get mode => OpenFileMode.fromJS(_wrapped.mode);
  set mode(OpenFileMode v) {
    _wrapped.mode = v.toJS;
  }
}

class CloseFileRequestedOptions {
  CloseFileRequestedOptions.fromJS(this._wrapped);

  final $js.CloseFileRequestedOptions _wrapped;

  $js.CloseFileRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// A request ID used to open the file.
  int get openRequestId => _wrapped.openRequestId;
  set openRequestId(int v) {
    _wrapped.openRequestId = v;
  }
}

class ReadFileRequestedOptions {
  ReadFileRequestedOptions.fromJS(this._wrapped);

  final $js.ReadFileRequestedOptions _wrapped;

  $js.ReadFileRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// A request ID used to open the file.
  int get openRequestId => _wrapped.openRequestId;
  set openRequestId(int v) {
    _wrapped.openRequestId = v;
  }

  /// Position in the file (in bytes) to start reading from.
  double get offset => _wrapped.offset;
  set offset(double v) {
    _wrapped.offset = v;
  }

  /// Number of bytes to be returned.
  double get length => _wrapped.length;
  set length(double v) {
    _wrapped.length = v;
  }
}

class CreateDirectoryRequestedOptions {
  CreateDirectoryRequestedOptions.fromJS(this._wrapped);

  final $js.CreateDirectoryRequestedOptions _wrapped;

  $js.CreateDirectoryRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The path of the directory to be created.
  String get directoryPath => _wrapped.directoryPath;
  set directoryPath(String v) {
    _wrapped.directoryPath = v;
  }

  /// Whether the operation is recursive (for directories only).
  bool get recursive => _wrapped.recursive;
  set recursive(bool v) {
    _wrapped.recursive = v;
  }
}

class DeleteEntryRequestedOptions {
  DeleteEntryRequestedOptions.fromJS(this._wrapped);

  final $js.DeleteEntryRequestedOptions _wrapped;

  $js.DeleteEntryRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The path of the entry to be deleted.
  String get entryPath => _wrapped.entryPath;
  set entryPath(String v) {
    _wrapped.entryPath = v;
  }

  /// Whether the operation is recursive (for directories only).
  bool get recursive => _wrapped.recursive;
  set recursive(bool v) {
    _wrapped.recursive = v;
  }
}

class CreateFileRequestedOptions {
  CreateFileRequestedOptions.fromJS(this._wrapped);

  final $js.CreateFileRequestedOptions _wrapped;

  $js.CreateFileRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The path of the file to be created.
  String get filePath => _wrapped.filePath;
  set filePath(String v) {
    _wrapped.filePath = v;
  }
}

class CopyEntryRequestedOptions {
  CopyEntryRequestedOptions.fromJS(this._wrapped);

  final $js.CopyEntryRequestedOptions _wrapped;

  $js.CopyEntryRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The source path of the entry to be copied.
  String get sourcePath => _wrapped.sourcePath;
  set sourcePath(String v) {
    _wrapped.sourcePath = v;
  }

  /// The destination path for the copy operation.
  String get targetPath => _wrapped.targetPath;
  set targetPath(String v) {
    _wrapped.targetPath = v;
  }
}

class MoveEntryRequestedOptions {
  MoveEntryRequestedOptions.fromJS(this._wrapped);

  final $js.MoveEntryRequestedOptions _wrapped;

  $js.MoveEntryRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The source path of the entry to be moved into a new place.
  String get sourcePath => _wrapped.sourcePath;
  set sourcePath(String v) {
    _wrapped.sourcePath = v;
  }

  /// The destination path for the copy operation.
  String get targetPath => _wrapped.targetPath;
  set targetPath(String v) {
    _wrapped.targetPath = v;
  }
}

class TruncateRequestedOptions {
  TruncateRequestedOptions.fromJS(this._wrapped);

  final $js.TruncateRequestedOptions _wrapped;

  $js.TruncateRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The path of the file to be truncated.
  String get filePath => _wrapped.filePath;
  set filePath(String v) {
    _wrapped.filePath = v;
  }

  /// Number of bytes to be retained after the operation completes.
  double get length => _wrapped.length;
  set length(double v) {
    _wrapped.length = v;
  }
}

class WriteFileRequestedOptions {
  WriteFileRequestedOptions.fromJS(this._wrapped);

  final $js.WriteFileRequestedOptions _wrapped;

  $js.WriteFileRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// A request ID used to open the file.
  int get openRequestId => _wrapped.openRequestId;
  set openRequestId(int v) {
    _wrapped.openRequestId = v;
  }

  /// Position in the file (in bytes) to start writing the bytes from.
  double get offset => _wrapped.offset;
  set offset(double v) {
    _wrapped.offset = v;
  }

  /// Buffer of bytes to be written to the file.
  ByteBuffer get data => _wrapped.data.toDart;
  set data(ByteBuffer v) {
    _wrapped.data = v.toJS;
  }
}

class AbortRequestedOptions {
  AbortRequestedOptions.fromJS(this._wrapped);

  final $js.AbortRequestedOptions _wrapped;

  $js.AbortRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// An ID of the request to be aborted.
  int get operationRequestId => _wrapped.operationRequestId;
  set operationRequestId(int v) {
    _wrapped.operationRequestId = v;
  }
}

class AddWatcherRequestedOptions {
  AddWatcherRequestedOptions.fromJS(this._wrapped);

  final $js.AddWatcherRequestedOptions _wrapped;

  $js.AddWatcherRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The path of the entry to be observed.
  String get entryPath => _wrapped.entryPath;
  set entryPath(String v) {
    _wrapped.entryPath = v;
  }

  /// Whether observing should include all child entries recursively. It can be
  /// true for directories only.
  bool get recursive => _wrapped.recursive;
  set recursive(bool v) {
    _wrapped.recursive = v;
  }
}

class RemoveWatcherRequestedOptions {
  RemoveWatcherRequestedOptions.fromJS(this._wrapped);

  final $js.RemoveWatcherRequestedOptions _wrapped;

  $js.RemoveWatcherRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The path of the watched entry.
  String get entryPath => _wrapped.entryPath;
  set entryPath(String v) {
    _wrapped.entryPath = v;
  }

  /// Mode of the watcher.
  bool get recursive => _wrapped.recursive;
  set recursive(bool v) {
    _wrapped.recursive = v;
  }
}

class Action {
  Action.fromJS(this._wrapped);

  final $js.Action _wrapped;

  $js.Action get toJS => _wrapped;

  /// The identifier of the action. Any string or [CommonActionId] for
  /// common actions.
  String get id => _wrapped.id;
  set id(String v) {
    _wrapped.id = v;
  }

  /// The title of the action. It may be ignored for common actions.
  String? get title => _wrapped.title;
  set title(String? v) {
    _wrapped.title = v;
  }
}

class ExecuteActionRequestedOptions {
  ExecuteActionRequestedOptions.fromJS(this._wrapped);

  final $js.ExecuteActionRequestedOptions _wrapped;

  $js.ExecuteActionRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system related to this operation.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The set of paths of the entries to be used for the action.
  List<String> get entryPaths =>
      _wrapped.entryPaths.toDart.cast<String>().map((e) => e).toList();
  set entryPaths(List<String> v) {
    _wrapped.entryPaths = throw UnimplementedError();
  }

  /// The identifier of the action to be executed.
  String get actionId => _wrapped.actionId;
  set actionId(String v) {
    _wrapped.actionId = v;
  }
}

class Change {
  Change.fromJS(this._wrapped);

  final $js.Change _wrapped;

  $js.Change get toJS => _wrapped;

  /// The path of the changed entry.
  String get entryPath => _wrapped.entryPath;
  set entryPath(String v) {
    _wrapped.entryPath = v;
  }

  /// The type of the change which happened to the entry.
  ChangeType get changeType => ChangeType.fromJS(_wrapped.changeType);
  set changeType(ChangeType v) {
    _wrapped.changeType = v.toJS;
  }
}

class NotifyOptions {
  NotifyOptions.fromJS(this._wrapped);

  final $js.NotifyOptions _wrapped;

  $js.NotifyOptions get toJS => _wrapped;

  /// The identifier of the file system related to this change.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The path of the observed entry.
  String get observedPath => _wrapped.observedPath;
  set observedPath(String v) {
    _wrapped.observedPath = v;
  }

  /// Mode of the observed entry.
  bool get recursive => _wrapped.recursive;
  set recursive(bool v) {
    _wrapped.recursive = v;
  }

  /// The type of the change which happened to the observed entry. If it is
  /// DELETED, then the observed entry will be automatically removed from the
  /// list of observed entries.
  ChangeType get changeType => ChangeType.fromJS(_wrapped.changeType);
  set changeType(ChangeType v) {
    _wrapped.changeType = v.toJS;
  }

  /// List of changes to entries within the observed directory (including the
  /// entry itself)
  List<Change>? get changes => _wrapped.changes?.toDart
      .cast<$js.Change>()
      .map((e) => Change.fromJS(e))
      .toList();
  set changes(List<Change>? v) {
    _wrapped.changes = throw UnimplementedError();
  }

  /// Tag for the notification. Required if the file system was mounted with
  /// the `supportsNotifyTag` option. Note, that this flag is
  /// necessary to provide notifications about changes which changed even
  /// when the system was shutdown.
  String? get tag => _wrapped.tag;
  set tag(String? v) {
    _wrapped.tag = v;
  }
}

class ConfigureRequestedOptions {
  ConfigureRequestedOptions.fromJS(this._wrapped);

  final $js.ConfigureRequestedOptions _wrapped;

  $js.ConfigureRequestedOptions get toJS => _wrapped;

  /// The identifier of the file system to be configured.
  String get fileSystemId => _wrapped.fileSystemId;
  set fileSystemId(String v) {
    _wrapped.fileSystemId = v;
  }

  /// The unique identifier of this request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }
}

class OnUnmountRequestedEvent {
  OnUnmountRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final UnmountRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnGetMetadataRequestedEvent {
  OnGetMetadataRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final GetMetadataRequestedOptions options;

  final MetadataCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnGetActionsRequestedEvent {
  OnGetActionsRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final GetActionsRequestedOptions options;

  final ActionsCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnReadDirectoryRequestedEvent {
  OnReadDirectoryRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final ReadDirectoryRequestedOptions options;

  final EntriesCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnOpenFileRequestedEvent {
  OnOpenFileRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final OpenFileRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnCloseFileRequestedEvent {
  OnCloseFileRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final CloseFileRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnReadFileRequestedEvent {
  OnReadFileRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final ReadFileRequestedOptions options;

  final FileDataCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnCreateDirectoryRequestedEvent {
  OnCreateDirectoryRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final CreateDirectoryRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnDeleteEntryRequestedEvent {
  OnDeleteEntryRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final DeleteEntryRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnCreateFileRequestedEvent {
  OnCreateFileRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final CreateFileRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnCopyEntryRequestedEvent {
  OnCopyEntryRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final CopyEntryRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnMoveEntryRequestedEvent {
  OnMoveEntryRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final MoveEntryRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnTruncateRequestedEvent {
  OnTruncateRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final TruncateRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnWriteFileRequestedEvent {
  OnWriteFileRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final WriteFileRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnAbortRequestedEvent {
  OnAbortRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final AbortRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnConfigureRequestedEvent {
  OnConfigureRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final ConfigureRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnMountRequestedEvent {
  OnMountRequestedEvent({
    required this.successCallback,
    required this.errorCallback,
  });

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnAddWatcherRequestedEvent {
  OnAddWatcherRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final AddWatcherRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnRemoveWatcherRequestedEvent {
  OnRemoveWatcherRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final RemoveWatcherRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}

class OnExecuteActionRequestedEvent {
  OnExecuteActionRequestedEvent({
    required this.options,
    required this.successCallback,
    required this.errorCallback,
  });

  final ExecuteActionRequestedOptions options;

  final ProviderSuccessCallback successCallback;

  final ProviderErrorCallback errorCallback;
}
