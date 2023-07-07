/* This file has been generated from printing.idl - do not edit */

/**
 * Use the `chrome.printing` API to send print jobs to printers installed on
 * Chromebook.
 */
library chrome.printing;

import '../src/common.dart';

/**
 * Accessor for the `chrome.printing` namespace.
 */
final ChromePrinting printing = ChromePrinting._();

class ChromePrinting extends ChromeApi {
  JsObject get _printing => chrome['printing'];

  Stream<OnJobStatusChangedEvent> get onJobStatusChanged => _onJobStatusChanged.stream;
  late ChromeStreamController<OnJobStatusChangedEvent> _onJobStatusChanged;

  ChromePrinting._() {
    var getApi = () => _printing;
    _onJobStatusChanged = ChromeStreamController<OnJobStatusChangedEvent>.twoArgs(getApi, 'onJobStatusChanged', _createOnJobStatusChangedEvent);
  }

  bool get available => _printing != null;

  /**
   * Submits the job for print. If the extension is not listed in
   * PrintingAPIExtensionsAllowlist policy, the user will be prompted to accept
   * the print job.
   */
  Future<SubmitJobResponse> submitJob(SubmitJobRequest request) {
    if (_printing == null) _throwNotAvailable();

    var completer =  ChromeCompleter<SubmitJobResponse>.oneArg(_createSubmitJobResponse);
    _printing.callMethod('submitJob', [jsify(request), completer.callback]);
    return completer.future;
  }

  /**
   * Cancels previously submitted job.
   * [jobId]: The id of the print job to cancel. This should be the same id
   * received in a [SubmitJobResponse].
   */
  Future cancelJob(String jobId) {
    if (_printing == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _printing.callMethod('cancelJob', [jobId, completer.callback]);
    return completer.future;
  }

  /**
   * Returns the list of available printers on the device. This includes
   * manually added, enterprise and discovered printers.
   */
  Future<List<Printer>> getPrinters() {
    if (_printing == null) _throwNotAvailable();

    var completer =  ChromeCompleter<List<Printer>>.oneArg((e) => listify(e, _createPrinter));
    _printing.callMethod('getPrinters', [completer.callback]);
    return completer.future;
  }

  /**
   * Returns the status and capabilities of the printer in <a
   * href="https://developers.google.com/cloud-print/docs/cdd#cdd"> CDD
   * format</a>. This call will fail with a runtime error if no printers with
   * given id are installed.
   */
  Future<GetPrinterInfoResponse> getPrinterInfo(String printerId) {
    if (_printing == null) _throwNotAvailable();

    var completer =  ChromeCompleter<GetPrinterInfoResponse>.oneArg(_createGetPrinterInfoResponse);
    _printing.callMethod('getPrinterInfo', [printerId, completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.printing' is not available");
  }
}

class OnJobStatusChangedEvent {
  final String jobId;

  final JobStatus status;

  OnJobStatusChangedEvent(this.jobId, this.status);
}

/**
 * The status of [submitJob] request.
 */
class SubmitJobStatus extends ChromeEnum {
  static const SubmitJobStatus OK = const SubmitJobStatus._('OK');
  static const SubmitJobStatus USER_REJECTED = const SubmitJobStatus._('USER_REJECTED');

  static const List<SubmitJobStatus> VALUES = const[OK, USER_REJECTED];

  const SubmitJobStatus._(String str): super(str);
}

/**
 * The source of the printer.
 */
class PrinterSource extends ChromeEnum {
  static const PrinterSource USER = const PrinterSource._('USER');
  static const PrinterSource POLICY = const PrinterSource._('POLICY');

  static const List<PrinterSource> VALUES = const[USER, POLICY];

  const PrinterSource._(String str): super(str);
}

/**
 * The status of the printer.
 */
class PrinterStatus extends ChromeEnum {
  static const PrinterStatus DOOR_OPEN = const PrinterStatus._('DOOR_OPEN');
  static const PrinterStatus TRAY_MISSING = const PrinterStatus._('TRAY_MISSING');
  static const PrinterStatus OUT_OF_INK = const PrinterStatus._('OUT_OF_INK');
  static const PrinterStatus OUT_OF_PAPER = const PrinterStatus._('OUT_OF_PAPER');
  static const PrinterStatus OUTPUT_FULL = const PrinterStatus._('OUTPUT_FULL');
  static const PrinterStatus PAPER_JAM = const PrinterStatus._('PAPER_JAM');
  static const PrinterStatus GENERIC_ISSUE = const PrinterStatus._('GENERIC_ISSUE');
  static const PrinterStatus STOPPED = const PrinterStatus._('STOPPED');
  static const PrinterStatus UNREACHABLE = const PrinterStatus._('UNREACHABLE');
  static const PrinterStatus AVAILABLE = const PrinterStatus._('AVAILABLE');

  static const List<PrinterStatus> VALUES = const[DOOR_OPEN, TRAY_MISSING, OUT_OF_INK, OUT_OF_PAPER, OUTPUT_FULL, PAPER_JAM, GENERIC_ISSUE, STOPPED, UNREACHABLE, AVAILABLE];

  const PrinterStatus._(String str): super(str);
}

/**
 * Status of the print job.
 */
class JobStatus extends ChromeEnum {
  static const JobStatus PENDING = const JobStatus._('PENDING');
  static const JobStatus IN_PROGRESS = const JobStatus._('IN_PROGRESS');
  static const JobStatus FAILED = const JobStatus._('FAILED');
  static const JobStatus CANCELED = const JobStatus._('CANCELED');
  static const JobStatus PRINTED = const JobStatus._('PRINTED');

  static const List<JobStatus> VALUES = const[PENDING, IN_PROGRESS, FAILED, CANCELED, PRINTED];

  const JobStatus._(String str): super(str);
}

class SubmitJobRequest extends ChromeObject {
  SubmitJobRequest({printerProvider.PrintJob? job, String? documentBlobUuid}) {
    if (job != null) this.job = job;
    if (documentBlobUuid != null) this.documentBlobUuid = documentBlobUuid;
  }
  SubmitJobRequest.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  printerProvider.PrintJob get job => _createprinterProvider.PrintJob(jsProxy['job']);
  set job(printerProvider.PrintJob value) => jsProxy['job'] = jsify(value);

  String get documentBlobUuid => jsProxy['documentBlobUuid'];
  set documentBlobUuid(String value) => jsProxy['documentBlobUuid'] = value;
}

/**
 * Response for [submitJob] request.
 */
class SubmitJobResponse extends ChromeObject {
  SubmitJobResponse({SubmitJobStatus? status, String? jobId}) {
    if (status != null) this.status = status;
    if (jobId != null) this.jobId = jobId;
  }
  SubmitJobResponse.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  SubmitJobStatus get status => _createSubmitJobStatus(jsProxy['status']);
  set status(SubmitJobStatus value) => jsProxy['status'] = jsify(value);

  String get jobId => jsProxy['jobId'];
  set jobId(String value) => jsProxy['jobId'] = value;
}

/**
 * Description of the printer.
 */
class Printer extends ChromeObject {
  Printer({String? id, String? name, String? description, String? uri, PrinterSource? source, bool? isDefault, int? recentlyUsedRank}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (description != null) this.description = description;
    if (uri != null) this.uri = uri;
    if (source != null) this.source = source;
    if (isDefault != null) this.isDefault = isDefault;
    if (recentlyUsedRank != null) this.recentlyUsedRank = recentlyUsedRank;
  }
  Printer.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  String get name => jsProxy['name'];
  set name(String value) => jsProxy['name'] = value;

  String get description => jsProxy['description'];
  set description(String value) => jsProxy['description'] = value;

  String get uri => jsProxy['uri'];
  set uri(String value) => jsProxy['uri'] = value;

  PrinterSource get source => _createPrinterSource(jsProxy['source']);
  set source(PrinterSource value) => jsProxy['source'] = jsify(value);

  bool get isDefault => jsProxy['isDefault'];
  set isDefault(bool value) => jsProxy['isDefault'] = value;

  int get recentlyUsedRank => jsProxy['recentlyUsedRank'];
  set recentlyUsedRank(int value) => jsProxy['recentlyUsedRank'] = value;
}

/**
 * Response for [getPrinterInfo] request.
 */
class GetPrinterInfoResponse extends ChromeObject {
  GetPrinterInfoResponse({Object? capabilities, PrinterStatus? status}) {
    if (capabilities != null) this.capabilities = capabilities;
    if (status != null) this.status = status;
  }
  GetPrinterInfoResponse.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  Object get capabilities => jsProxy['capabilities'];
  set capabilities(Object value) => jsProxy['capabilities'] = jsify(value);

  PrinterStatus get status => _createPrinterStatus(jsProxy['status']);
  set status(PrinterStatus value) => jsProxy['status'] = jsify(value);
}

OnJobStatusChangedEvent _createOnJobStatusChangedEvent(String jobId, JsObject status) =>
    OnJobStatusChangedEvent(jobId, _createJobStatus(status));
SubmitJobResponse _createSubmitJobResponse(JsObject jsProxy) => SubmitJobResponse.fromProxy(jsProxy);
Printer _createPrinter(JsObject jsProxy) => Printer.fromProxy(jsProxy);
GetPrinterInfoResponse _createGetPrinterInfoResponse(JsObject jsProxy) => GetPrinterInfoResponse.fromProxy(jsProxy);
printerProvider.PrintJob _createprinterProvider.PrintJob(JsObject jsProxy) => printerProvider.PrintJob.fromProxy(jsProxy);
SubmitJobStatus _createSubmitJobStatus(String value) => SubmitJobStatus.VALUES.singleWhere((ChromeEnum e) => e.value == value);
PrinterSource _createPrinterSource(String value) => PrinterSource.VALUES.singleWhere((ChromeEnum e) => e.value == value);
PrinterStatus _createPrinterStatus(String value) => PrinterStatus.VALUES.singleWhere((ChromeEnum e) => e.value == value);
JobStatus _createJobStatus(String value) => JobStatus.VALUES.singleWhere((ChromeEnum e) => e.value == value);
