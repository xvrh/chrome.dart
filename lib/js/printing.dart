import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSPrintingExtension on JSChrome {
  ///  Use the `chrome.printing` API to send print jobs to printers
  ///  installed on Chromebook.
  external JSPrinting get Printing;
}

@JS()
@staticInterop
class JSPrinting {}

extension JSPrintingExtension on JSPrinting {
  ///  Submits the job for print.
  ///  If the extension is not listed in PrintingAPIExtensionsAllowlist policy,
  ///  the user will be prompted to accept the print job.
  external void submitJob();

  ///  Cancels previously submitted job.
  ///  |jobId|: The id of the print job to cancel. This should be the same id
  ///  received in a $(ref:SubmitJobResponse).
  external void cancelJob();

  ///  Returns the list of available printers on the device. This includes
  ///  manually added, enterprise and discovered printers.
  external void getPrinters();

  ///  Returns the status and capabilities of the printer in
  ///  <a href="https://developers.google.com/cloud-print/docs/cdd#cdd">
  ///  CDD format</a>.
  ///  This call will fail with a runtime error if no printers with given id are
  ///  installed.
  external void getPrinterInfo();

  ///  Event fired when the status of the job is changed.
  ///  This is only fired for the jobs created by this extension.
  external ChromeEvent get onJobStatusChanged;
}
