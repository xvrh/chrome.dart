import 'chrome.dart';
import 'dart:js_interop';
import 'printer_provider.dart';
export 'chrome.dart';

extension JSChromeJSPrintingExtension on JSChrome {
  ///  Use the `chrome.printing` API to send print jobs to printers
  ///  installed on Chromebook.
  external JSPrinting get printing;
}

@JS()
@staticInterop
class JSPrinting {}

extension JSPrintingExtension on JSPrinting {
  ///  Submits the job for print.
  ///  If the extension is not listed in PrintingAPIExtensionsAllowlist policy,
  ///  the user will be prompted to accept the print job.
  external void submitJob(
    request,
    callback,
  );

  ///  Cancels previously submitted job.
  ///  |jobId|: The id of the print job to cancel. This should be the same id
  ///  received in a $(ref:SubmitJobResponse).
  external void cancelJob(
    jobId,
    callback,
  );

  ///  Returns the list of available printers on the device. This includes
  ///  manually added, enterprise and discovered printers.
  external void getPrinters(callback);

  ///  Returns the status and capabilities of the printer in
  ///  <a href="https://developers.google.com/cloud-print/docs/cdd#cdd">
  ///  CDD format</a>.
  ///  This call will fail with a runtime error if no printers with given id are
  ///  installed.
  external void getPrinterInfo(
    printerId,
    callback,
  );

  ///  Event fired when the status of the job is changed.
  ///  This is only fired for the jobs created by this extension.
  external ChromeEvent get onJobStatusChanged;
}

///  The status of $(ref:submitJob) request.
typedef SubmitJobStatus = JSString;

///  The source of the printer.
typedef PrinterSource = JSString;

///  The status of the printer.
typedef PrinterStatus = JSString;

///  Status of the print job.
typedef JobStatus = JSString;

@JS()
@staticInterop
class SubmitJobRequest {
  ///  The print job to be submitted.
  ///  The only supported content type is "application/pdf", and the CJT ticket
  ///  shouldn't include FitToPageTicketItem, PageRangeTicketItem,
  ///  ReverseOrderTicketItem and VendorTicketItem fields since they are
  ///  irrelevant for native printing. All other fields must be present.
  external PrintJob get job;

  ///  Used internally to store the blob uuid after parameter customization and
  ///  shouldn't be populated by the extension.
  external String? get documentBlobUuid;
}

@JS()
@staticInterop
class SubmitJobResponse {
  ///  The status of the request.
  external SubmitJobStatus get status;

  ///  The id of created print job. This is a unique identifier among all print
  ///  jobs on the device. If status is not OK, jobId will be null.
  external String? get jobId;
}

@JS()
@staticInterop
class Printer {
  ///  The printer's identifier; guaranteed to be unique among printers on the
  ///  device.
  external String get id;

  ///  The name of the printer.
  external String get name;

  ///  The human-readable description of the printer.
  external String get description;

  ///  The printer URI. This can be used by extensions to choose the printer for
  ///  the user.
  external String get uri;

  ///  The source of the printer (user or policy configured).
  external PrinterSource get source;

  ///  The flag which shows whether the printer fits
  ///  <a
  /// href="https://chromium.org/administrators/policy-list-3#DefaultPrinterSelection">
  ///  DefaultPrinterSelection</a> rules.
  ///  Note that several printers could be flagged.
  external bool get isDefault;

  ///  The value showing how recent the printer was used for printing from
  ///  Chrome. The lower the value is the more recent the printer was used. The
  ///  minimum value is 0. Missing value indicates that the printer wasn't used
  ///  recently. This value is guaranteed to be unique amongst printers.
  external int? get recentlyUsedRank;
}

@JS()
@staticInterop
class GetPrinterInfoResponse {
  ///  Printer capabilities in
  ///  <a href="https://developers.google.com/cloud-print/docs/cdd#cdd">
  ///  CDD format</a>.
  ///  The property may be missing.
  external JSObject? get capabilities;

  ///  The status of the printer.
  external PrinterStatus get status;
}
