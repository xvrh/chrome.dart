import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSPrintingMetricsExtension on JSChrome {
  ///  Use the `chrome.printingMetrics` API to fetch data about
  ///  printing usage.
  external JSPrintingMetrics get printingMetrics;
}

@JS()
@staticInterop
class JSPrintingMetrics {}

extension JSPrintingMetricsExtension on JSPrintingMetrics {
  ///  Returns the list of the finished print jobs.
  external void getPrintJobs(callback);

  ///  Event fired when the print job is finished.
  ///  This includes any of termination statuses: FAILED, CANCELED and PRINTED.
  external ChromeEvent get onPrintJobFinished;
}

@JS()
@staticInterop
class MediaSize {
  ///  Width (in micrometers) of the media used for printing.
  external JSAny get width;

  ///  Height (in micrometers) of the media used for printing.
  external JSAny get height;

  ///  Vendor-provided ID, e.g. "iso_a3_297x420mm" or "na_index-3x5_3x5in".
  ///  Possible values are values of "media" IPP attribute and can be found on
  ///  <a
  /// href="https://www.iana.org/assignments/ipp-registrations/ipp-registrations.xhtml">
  ///  IANA page</a> .
  external JSAny get vendorId;
}

@JS()
@staticInterop
class PrintSettings {
  ///  The requested color mode.
  external JSAny get color;

  ///  The requested duplex mode.
  external JSAny get duplex;

  ///  The requested media size.
  external JSAny get mediaSize;

  ///  The requested number of copies.
  external JSAny get copies;
}

@JS()
@staticInterop
class Printer {
  ///  Displayed name of the printer.
  external JSAny get name;

  ///  The full path for the printer.
  ///  Contains protocol, hostname, port, and queue.
  external JSAny get uri;

  ///  The source of the printer.
  external JSAny get source;
}

@JS()
@staticInterop
class PrintJobInfo {
  ///  The ID of the job.
  external JSAny get id;

  ///  The title of the document which was printed.
  external JSAny get title;

  ///  Source showing who initiated the print job.
  external JSAny get source;

  ///  ID of source. Null if source is PRINT_PREVIEW or ANDROID_APP.
  external JSAny? get sourceId;

  ///  The final status of the job.
  external JSAny get status;

  ///  The job creation time (in milliseconds past the Unix epoch).
  external JSAny get creationTime;

  ///  The job completion time (in milliseconds past the Unix epoch).
  external JSAny get completionTime;

  ///  The info about the printer which printed the document.
  external JSAny get printer;

  ///  The settings of the print job.
  external JSAny get settings;

  ///  The number of pages in the document.
  external JSAny get numberOfPages;

  ///  The status of the printer.
  external JSAny get printer_status;
}
