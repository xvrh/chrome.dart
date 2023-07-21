import 'dart:js_interop';

import 'chrome.dart';
import 'printing.dart';

export 'chrome.dart';

extension JSChromeJSPrintingMetricsExtension on JSChrome {
  /// Use the `chrome.printingMetrics` API to fetch data about
  /// printing usage.
  @JS('printingMetrics')
  external JSPrintingMetrics? get printingMetricsNullable;

  /// Use the `chrome.printingMetrics` API to fetch data about
  /// printing usage.
  JSPrintingMetrics get printingMetrics {
    var printingMetricsNullable = this.printingMetricsNullable;
    if (printingMetricsNullable == null) {
      throw ApiNotAvailableException('chrome.printingMetrics');
    }
    return printingMetricsNullable;
  }
}

@JS()
@staticInterop
class JSPrintingMetrics {}

extension JSPrintingMetricsExtension on JSPrintingMetrics {
  /// Returns the list of the finished print jobs.
  external JSPromise getPrintJobs();

  /// Event fired when the print job is finished.
  /// This includes any of termination statuses: FAILED, CANCELED and PRINTED.
  external Event get onPrintJobFinished;
}

/// The source of the print job.
typedef PrintJobSource = String;

/// The final status of the print job.
typedef PrintJobStatus = String;

/// The source of the printer.
typedef PrinterSource = String;

typedef ColorMode = String;

typedef DuplexMode = String;

@JS()
@staticInterop
class MediaSize {}

extension MediaSizeExtension on MediaSize {
  /// Width (in micrometers) of the media used for printing.
  external int width;

  /// Height (in micrometers) of the media used for printing.
  external int height;

  /// Vendor-provided ID, e.g. "iso_a3_297x420mm" or "na_index-3x5_3x5in".
  /// Possible values are values of "media" IPP attribute and can be found on
  /// <a
  /// href="https://www.iana.org/assignments/ipp-registrations/ipp-registrations.xhtml">
  /// IANA page</a> .
  external String vendorId;
}

@JS()
@staticInterop
class PrintSettings {}

extension PrintSettingsExtension on PrintSettings {
  /// The requested color mode.
  external ColorMode color;

  /// The requested duplex mode.
  external DuplexMode duplex;

  /// The requested media size.
  external MediaSize mediaSize;

  /// The requested number of copies.
  external int copies;
}

@JS()
@staticInterop
class Printer {}

extension PrinterExtension on Printer {
  /// Displayed name of the printer.
  external String name;

  /// The full path for the printer.
  /// Contains protocol, hostname, port, and queue.
  external String uri;

  /// The source of the printer.
  external PrinterSource source;
}

@JS()
@staticInterop
class PrintJobInfo {}

extension PrintJobInfoExtension on PrintJobInfo {
  /// The ID of the job.
  external String id;

  /// The title of the document which was printed.
  external String title;

  /// Source showing who initiated the print job.
  external PrintJobSource source;

  /// ID of source. Null if source is PRINT_PREVIEW or ANDROID_APP.
  external String? sourceId;

  /// The final status of the job.
  external PrintJobStatus status;

  /// The job creation time (in milliseconds past the Unix epoch).
  external double creationTime;

  /// The job completion time (in milliseconds past the Unix epoch).
  external double completionTime;

  /// The info about the printer which printed the document.
  external Printer printer;

  /// The settings of the print job.
  external PrintSettings settings;

  /// The number of pages in the document.
  external int numberOfPages;

  /// The status of the printer.
  external PrinterStatus printer_status;
}
