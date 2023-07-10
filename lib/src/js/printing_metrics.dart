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
  external void getPrintJobs(JSFunction callback);

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
class MediaSize {}

extension MediaSizeExtension on MediaSize {
  ///  Width (in micrometers) of the media used for printing.
  external JSNumber get width;

  ///  Height (in micrometers) of the media used for printing.
  external JSNumber get height;

  ///  Vendor-provided ID, e.g. "iso_a3_297x420mm" or "na_index-3x5_3x5in".
  ///  Possible values are values of "media" IPP attribute and can be found on
  ///  <a
  /// href="https://www.iana.org/assignments/ipp-registrations/ipp-registrations.xhtml">
  ///  IANA page</a> .
  external JSString get vendorId;
}

@JS()
@staticInterop
class PrintSettings {}

extension PrintSettingsExtension on PrintSettings {
  ///  The requested color mode.
  external ColorMode get color;

  ///  The requested duplex mode.
  external DuplexMode get duplex;

  ///  The requested media size.
  external MediaSize get mediaSize;

  ///  The requested number of copies.
  external JSNumber get copies;
}

@JS()
@staticInterop
class Printer {}

extension PrinterExtension on Printer {
  ///  Displayed name of the printer.
  external JSString get name;

  ///  The full path for the printer.
  ///  Contains protocol, hostname, port, and queue.
  external JSString get uri;

  ///  The source of the printer.
  external PrinterSource get source;
}

@JS()
@staticInterop
class PrintJobInfo {}

extension PrintJobInfoExtension on PrintJobInfo {
  ///  The ID of the job.
  external JSString get id;

  ///  The title of the document which was printed.
  external JSString get title;

  ///  Source showing who initiated the print job.
  external PrintJobSource get source;

  ///  ID of source. Null if source is PRINT_PREVIEW or ANDROID_APP.
  external JSString? get sourceId;

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
  external JSNumber get numberOfPages;

  ///  The status of the printer.
  external PrinterStatus get printer_status;
}
