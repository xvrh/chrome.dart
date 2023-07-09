import 'chrome.dart';
export 'chrome.dart';

final _fileSystemProvider = ChromeFileSystemProvider._();

extension ChromeChromeFileSystemProviderExtension on Chrome {
  ChromeFileSystemProvider get fileSystemProvider => _fileSystemProvider;
}

class ChromeFileSystemProvider {
  ChromeFileSystemProvider._();
}

///  Error codes used by providing extensions in response to requests as well
///  as in case of errors when calling methods of the API. For success,
///  `"OK"` must be used.
enum ProviderError {
  ok('OK'),
  failed('FAILED'),
  inUSE('IN_USE'),
  exists('EXISTS'),
  notFOUND('NOT_FOUND'),
  accessDENIED('ACCESS_DENIED'),
  tooMANYOPENED('TOO_MANY_OPENED'),
  noMEMORY('NO_MEMORY'),
  noSPACE('NO_SPACE'),
  notADIRECTORY('NOT_A_DIRECTORY'),
  invalidOPERATION('INVALID_OPERATION'),
  security('SECURITY'),
  abort('ABORT'),
  notAFILE('NOT_A_FILE'),
  notEMPTY('NOT_EMPTY'),
  invalidURL('INVALID_URL'),
  io('IO');

  const ProviderError(this.value);

  final String value;
}

///  Mode of opening a file. Used by $(ref:onOpenFileRequested).
enum OpenFileMode {
  read('READ'),
  write('WRITE');

  const OpenFileMode(this.value);

  final String value;
}

///  Type of a change detected on the observed directory.
enum ChangeType {
  changed('CHANGED'),
  deleted('DELETED');

  const ChangeType(this.value);

  final String value;
}

///  List of common actions. `"SHARE"` is for sharing files with
///  others. `"SAVE_FOR_OFFLINE"` for pinning (saving for offline
///  access). `"OFFLINE_NOT_NECESSARY"` for notifying that the file
///  doesn't need to be stored for offline access anymore.
///  Used by $(ref:onGetActionsRequested) and $(ref:onExecuteActionRequested).
enum CommonActionId {
  saveFOROFFLINE('SAVE_FOR_OFFLINE'),
  offlineNOTNECESSARY('OFFLINE_NOT_NECESSARY'),
  share('SHARE');

  const CommonActionId(this.value);

  final String value;
}
