import 'chrome.dart';
export 'chrome.dart';

final _printing = ChromePrinting._();

extension ChromeChromePrintingExtension on Chrome {
  ChromePrinting get printing => _printing;
}

class ChromePrinting {
  ChromePrinting._();
}

///  The status of $(ref:submitJob) request.
enum SubmitJobStatus {
  ///  Sent print job request is accepted.
  ok('OK'),

  ///  Sent print job request is rejected by the user.
  userREJECTED('USER_REJECTED');

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
  doorOPEN('DOOR_OPEN'),

  ///  The tray of the printer is missing. Printer still accepts print jobs.
  trayMISSING('TRAY_MISSING'),

  ///  The printer is out of ink. Printer still accepts print jobs.
  outOFINK('OUT_OF_INK'),

  ///  The printer is out of paper. Printer still accepts print jobs.
  outOFPAPER('OUT_OF_PAPER'),

  ///  The output area of the printer (e.g. tray) is full. Printer still accepts
  ///  print jobs.
  outputFULL('OUTPUT_FULL'),

  ///  The printer has a paper jam. Printer still accepts print jobs.
  paperJAM('PAPER_JAM'),

  ///  Some generic issue. Printer still accepts print jobs.
  genericISSUE('GENERIC_ISSUE'),

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
  inPROGRESS('IN_PROGRESS'),

  ///  Print job was interrupted due to some error.
  failed('FAILED'),

  ///  Print job was canceled by the user or via API.
  canceled('CANCELED'),

  ///  Print job was printed without any errors.
  printed('PRINTED');

  const JobStatus(this.value);

  final String value;
}
