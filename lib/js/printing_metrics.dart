import 'chrome.dart';
import 'dart:js_interop';
import 'printing.dart';
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

///  The source of the print job.
typedef PrintJobSource = JSString;

///  The final status of the print job.
typedef PrintJobStatus = JSString;

///  The source of the printer.
typedef PrinterSource = JSString;

typedef ColorMode = JSString;

typedef DuplexMode = JSString;

@JS()
@staticInterop
class MediaSize {
  ///  Width (in micrometers) of the media used for printing.
  external int get width;

  ///  Height (in micrometers) of the media used for printing.
  external int get height;

  ///  Vendor-provided ID, e.g. "iso_a3_297x420mm" or "na_index-3x5_3x5in".
  ///  Possible values are values of "media" IPP attribute and can be found on
  ///  <a
  /// href="https://www.iana.org/assignments/ipp-registrations/ipp-registrations.xhtml">
  ///  IANA page</a> .
  external String get vendorId;
}

@JS()
@staticInterop
class PrintSettings {
  ///  The requested color mode.
  external ColorMode get color;

  ///  The requested duplex mode.
  external DuplexMode get duplex;

  ///  The requested media size.
  external MediaSize get mediaSize;

  ///  The requested number of copies.
  external int get copies;
}

@JS()
@staticInterop
class Printer {
  ///  Displayed name of the printer.
  external String get name;

  ///  The full path for the printer.
  ///  Contains protocol, hostname, port, and queue.
  external String get uri;

  ///  The source of the printer.
  external PrinterSource get source;
}

@JS()
@staticInterop
class PrintJobInfo {
  ///  The ID of the job.
  external String get id;

  ///  The title of the document which was printed.
  external String get title;

  ///  Source showing who initiated the print job.
  external PrintJobSource get source;

  ///  ID of source. Null if source is PRINT_PREVIEW or ANDROID_APP.
  external String? get sourceId;

  ///  The final status of the job.
  external PrintJobStatus get status;

  ///  The job creation time (in milliseconds past the Unix epoch).
  external double get creationTime;

  ///  The job completion time (in milliseconds past the Unix epoch).
  external double get completionTime;

  ///  The info about the printer which printed the document.
  external Printer get printer;

  ///  The settings of the print job.
  external PrintSettings get settings;

  ///  The number of pages in the document.
  external int get numberOfPages;

  ///  The status of the printer.
  external PrinterStatus get printer_status;
}
