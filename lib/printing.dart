import 'chrome.dart';
export 'chrome.dart';

final _printing = ChromePrinting._();

extension ChromeChromePrintingExtension on Chrome {
  ChromePrinting get printing => _printing;
}

class ChromePrinting {
  ChromePrinting._();

  ///  Submits the job for print.
  ///  If the extension is not listed in PrintingAPIExtensionsAllowlist policy,
  ///  the user will be prompted to accept the print job.
  void submitJob(request) => throw UnimplementedError();

  ///  Cancels previously submitted job.
  ///  |jobId|: The id of the print job to cancel. This should be the same id
  ///  received in a $(ref:SubmitJobResponse).
  void cancelJob(jobId) => throw UnimplementedError();

  ///  Returns the list of available printers on the device. This includes
  ///  manually added, enterprise and discovered printers.
  void getPrinters() => throw UnimplementedError();

  ///  Returns the status and capabilities of the printer in
  ///  <a href="https://developers.google.com/cloud-print/docs/cdd#cdd">
  ///  CDD format</a>.
  ///  This call will fail with a runtime error if no printers with given id are
  ///  installed.
  void getPrinterInfo(printerId) => throw UnimplementedError();

  ///  Event fired when the status of the job is changed.
  ///  This is only fired for the jobs created by this extension.
  Stream get onJobStatusChanged => throw UnimplementedError();
}

///  The status of $(ref:submitJob) request.
enum SubmitJobStatus {
  ///  Sent print job request is accepted.
  ok('OK'),

  ///  Sent print job request is rejected by the user.
  userRejected('USER_REJECTED');

  const SubmitJobStatus(this.value);

  final String value;
}

///  The source of the printer.
enum PrinterSource {
  ///  Printer was added by user.
  user('USER'),

  ///  Printer was added via policy.
  policy('POLICY');

  const PrinterSource(this.value);

  final String value;
}

///  The status of the printer.
enum PrinterStatus {
  ///  The door of the printer is open. Printer still accepts print jobs.
  doorOpen('DOOR_OPEN'),

  ///  The tray of the printer is missing. Printer still accepts print jobs.
  trayMissing('TRAY_MISSING'),

  ///  The printer is out of ink. Printer still accepts print jobs.
  outOfInk('OUT_OF_INK'),

  ///  The printer is out of paper. Printer still accepts print jobs.
  outOfPaper('OUT_OF_PAPER'),

  ///  The output area of the printer (e.g. tray) is full. Printer still accepts
  ///  print jobs.
  outputFull('OUTPUT_FULL'),

  ///  The printer has a paper jam. Printer still accepts print jobs.
  paperJam('PAPER_JAM'),

  ///  Some generic issue. Printer still accepts print jobs.
  genericIssue('GENERIC_ISSUE'),

  ///  The printer is stopped and doesn't print but still accepts print jobs.
  stopped('STOPPED'),

  ///  The printer is unreachable and doesn't accept print jobs.
  unreachable('UNREACHABLE'),

  ///  The printer is available.
  available('AVAILABLE');

  const PrinterStatus(this.value);

  final String value;
}

///  Status of the print job.
enum JobStatus {
  ///  Print job is received on Chrome side but was not processed yet.
  pending('PENDING'),

  ///  Print job is sent for printing.
  inProgress('IN_PROGRESS'),

  ///  Print job was interrupted due to some error.
  failed('FAILED'),

  ///  Print job was canceled by the user or via API.
  canceled('CANCELED'),

  ///  Print job was printed without any errors.
  printed('PRINTED');

  const JobStatus(this.value);

  final String value;
}
