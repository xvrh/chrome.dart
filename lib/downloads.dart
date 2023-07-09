import 'chrome.dart';
export 'chrome.dart';

final _downloads = ChromeDownloads._();

extension ChromeChromeDownloadsExtension on Chrome {
  ChromeDownloads get downloads => _downloads;
}

class ChromeDownloads {
  ChromeDownloads._();
}

///  <dl><dt>uniquify</dt>
///      <dd>To avoid duplication, the `filename` is changed to
///      include a counter before the filename extension.</dd>
///      <dt>overwrite</dt>
///      <dd>The existing file will be overwritten with the new file.</dd>
///      <dt>prompt</dt>
///      <dd>The user will be prompted with a file chooser dialog.</dd>
///  </dl>
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
  fileFAILED('FILE_FAILED'),
  fileACCESSDENIED('FILE_ACCESS_DENIED'),
  fileNOSPACE('FILE_NO_SPACE'),
  fileNAMETOOLONG('FILE_NAME_TOO_LONG'),
  fileTOOLARGE('FILE_TOO_LARGE'),
  fileVIRUSINFECTED('FILE_VIRUS_INFECTED'),
  fileTRANSIENTERROR('FILE_TRANSIENT_ERROR'),
  fileBLOCKED('FILE_BLOCKED'),
  fileSECURITYCHECKFAILED('FILE_SECURITY_CHECK_FAILED'),
  fileTOOSHORT('FILE_TOO_SHORT'),
  fileHASHMISMATCH('FILE_HASH_MISMATCH'),
  fileSAMEASSOURCE('FILE_SAME_AS_SOURCE'),
  networkFAILED('NETWORK_FAILED'),
  networkTIMEOUT('NETWORK_TIMEOUT'),
  networkDISCONNECTED('NETWORK_DISCONNECTED'),
  networkSERVERDOWN('NETWORK_SERVER_DOWN'),
  networkINVALIDREQUEST('NETWORK_INVALID_REQUEST'),
  serverFAILED('SERVER_FAILED'),
  serverNORANGE('SERVER_NO_RANGE'),
  serverBADCONTENT('SERVER_BAD_CONTENT'),
  serverUNAUTHORIZED('SERVER_UNAUTHORIZED'),
  serverCERTPROBLEM('SERVER_CERT_PROBLEM'),
  serverFORBIDDEN('SERVER_FORBIDDEN'),
  serverUNREACHABLE('SERVER_UNREACHABLE'),
  serverCONTENTLENGTHMISMATCH('SERVER_CONTENT_LENGTH_MISMATCH'),
  serverCROSSORIGINREDIRECT('SERVER_CROSS_ORIGIN_REDIRECT'),
  userCANCELED('USER_CANCELED'),
  userSHUTDOWN('USER_SHUTDOWN'),
  crash('CRASH');

  const InterruptReason(this.value);

  final String value;
}

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

///  <dl><dt>in_progress</dt>
///      <dd>The download is currently receiving data from the server.</dd>
///      <dt>interrupted</dt>
///      <dd>An error broke the connection with the file host.</dd>
///      <dt>complete</dt>
///      <dd>The download completed successfully.</dd>
///  </dl>
enum State {
  inProgress('in_progress'),
  interrupted('interrupted'),
  complete('complete');

  const State(this.value);

  final String value;
}
